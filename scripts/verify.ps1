[CmdletBinding()]
param([string]$Root = (Split-Path -Parent $PSScriptRoot))
$ErrorActionPreference = 'Stop'
$Root = [IO.Path]::GetFullPath($Root)
$skill = Join-Path $Root 'skills/dotnet-api-mentor'
$entry = Get-Content -LiteralPath (Join-Path $skill 'SKILL.md') -Raw
function Assert-True($Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
Assert-True ($entry -match '(?s)^---\r?\nname: dotnet-api-mentor\r?\ndescription: ([^\r\n]+)\r?\n---') 'Invalid skill frontmatter.'
$descriptionLength = $Matches[1].Length
Assert-True ($descriptionLength -lt 1024) 'Description must be under 1024 characters.'
$entryLines = @($entry.TrimEnd() -split '\r?\n').Count
Assert-True ($entryLines -le 150) 'SKILL.md exceeds 150 lines.'
foreach ($wrapper in @('CLAUDE.md','GEMINI.md')) {
    Assert-True ((Get-Content -LiteralPath (Join-Path $Root $wrapper) -Raw).Trim() -ceq '@AGENTS.md') "$wrapper must contain only @AGENTS.md."
}
$linkCount = 0
foreach ($file in Get-ChildItem -LiteralPath $Root -Recurse -File -Filter '*.md') {
    $body = Get-Content -LiteralPath $file.FullName -Raw
    foreach ($match in [regex]::Matches($body, '\[[^\]]+\]\(([^)]+)\)')) {
        $url = $match.Groups[1].Value
        if ($url -match '^(https?://|#|mailto:)') { continue }
        $relative = ($url -split '#')[0]
        Assert-True (Test-Path -LiteralPath (Join-Path $file.DirectoryName $relative)) "Broken link in $($file.Name): $url"
        $linkCount++
    }
    foreach ($match in [regex]::Matches($body, '`(references/tracks/[a-z-]+\.md)`')) {
        Assert-True (Test-Path -LiteralPath (Join-Path $skill $match.Groups[1].Value)) "Missing curriculum reference: $($match.Groups[1].Value)"
    }
}
$manifest = @(Get-Content -LiteralPath (Join-Path $Root 'docs/TRACK-PRESERVATION.json') -Raw | ConvertFrom-Json)
Assert-True ($manifest.Count -eq 28) 'Expected 28 preserved tracks.'
$trackFiles = @(Get-ChildItem -LiteralPath (Join-Path $skill 'references/tracks') -Filter '*.md' | Where-Object Name -ne 'INDEX.md')
Assert-True ($trackFiles.Count -eq 28) 'Unexpected track count.'
foreach ($item in $manifest) {
    $body = [IO.File]::ReadAllText((Join-Path $skill ('references/tracks/' + $item.file))).Replace("`r`n","`n")
    $marker = "<!-- BEGIN PRESERVED CURRICULUM -->`n"
    $position = $body.IndexOf($marker)
    Assert-True ($position -ge 0) "Missing preservation marker: $($item.file)"
    $original = $body.Substring($position + $marker.Length).Replace('references/tracks/', 'references/')
    $sha = [Security.Cryptography.SHA256]::Create()
    try { $actual = ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($original)))).Replace('-','').ToLowerInvariant() }
    finally { $sha.Dispose() }
    Assert-True ($actual -eq $item.source_sha256_lf) "Original curriculum lost or changed: $($item.file)"
}
$template = Get-Content -LiteralPath (Join-Path $skill 'assets/PROGRESS.template.md')
Assert-True ($template.Count -le 120) 'Progress template exceeds limit.'
$headings = @($template | Where-Object { $_ -match '^# ' })
$expected = @('# Where we stopped','# Open exercise','# Level and gate status','# Tracks table','# Weak spots','# Capstone milestones','# Last 10 session lines','# Archive summary')
Assert-True (($headings -join '|') -ceq ($expected -join '|')) 'Progress section contract mismatch.'
foreach ($script in Get-ChildItem -LiteralPath (Join-Path $Root 'scripts') -Filter '*.ps1') {
    $tokens = $null; $errors = $null
    [void][Management.Automation.Language.Parser]::ParseFile($script.FullName, [ref]$tokens, [ref]$errors)
    Assert-True ($errors.Count -eq 0) "PowerShell parse failure: $($script.Name): $errors"
}
Write-Output "PASS: SKILL $entryLines lines; description $descriptionLength characters; $linkCount local Markdown links; 28 preserved track hashes; progress template; imports; PowerShell syntax."
Write-Output 'This structural check does not prove model behavior or cross-tool runtime compatibility. See docs/VERIFICATION.md.'
