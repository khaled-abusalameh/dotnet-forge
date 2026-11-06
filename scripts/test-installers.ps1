[CmdletBinding()]
param([string]$ScratchRoot = [IO.Path]::GetTempPath())
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repoRoot 'skills/dotnet-api-mentor'
$sourceFiles = @(Get-ChildItem -LiteralPath $source -Recurse -File)
$testRoot = Join-Path ([IO.Path]::GetFullPath($ScratchRoot)) ('dotnet-forge-test-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $testRoot -Force | Out-Null

function Assert-Copy([string]$Target) {
    $files = @(Get-ChildItem -LiteralPath $Target -Recurse -File)
    if ($files.Count -ne $sourceFiles.Count) { throw "Incomplete installation: $Target" }
    foreach ($file in $sourceFiles) {
        $relative = $file.FullName.Substring($source.Length + 1)
        $installed = Join-Path $Target $relative
        if ((Get-FileHash -LiteralPath $installed).Hash -ne (Get-FileHash -LiteralPath $file.FullName).Hash) { throw "Copy differs: $relative" }
    }
}

$destination = Join-Path $testRoot 'PowerShell workspace with spaces'
& (Join-Path $PSScriptRoot 'install.ps1') -Destination $destination
& (Join-Path $PSScriptRoot 'install.ps1') -Destination $destination
foreach ($tool in @('.claude','.agents','.gemini')) { Assert-Copy (Join-Path $destination "$tool/skills/dotnet-api-mentor") }

$conflict = Join-Path $testRoot 'PowerShell conflict'
& (Join-Path $PSScriptRoot 'install.ps1') -Tool gemini -Destination $conflict
$custom = Join-Path $conflict '.gemini/skills/dotnet-api-mentor/SKILL.md'
Add-Content -LiteralPath $custom -Value 'Local customization must survive.'
$before = (Get-FileHash -LiteralPath $custom).Hash
$rejected = $false
try { & (Join-Path $PSScriptRoot 'install.ps1') -Destination $conflict }
catch { if ($_.Exception.Message -notmatch 'Existing installation differs') { throw }; $rejected = $true }
if (-not $rejected -or (Get-FileHash -LiteralPath $custom).Hash -ne $before -or (Test-Path (Join-Path $conflict '.claude'))) { throw 'PowerShell conflict protection failed.' }

if ($IsLinux -or $IsMacOS) {
    $bashInstaller = Join-Path $PSScriptRoot 'install.sh'
    & bash -n $bashInstaller
    if ($LASTEXITCODE -ne 0) { throw 'Bash syntax failed.' }
    $destination = Join-Path $testRoot 'Bash workspace with spaces'
    & bash $bashInstaller all $destination
    if ($LASTEXITCODE -ne 0) { throw 'Bash install failed.' }
    & bash $bashInstaller all $destination
    if ($LASTEXITCODE -ne 0) { throw 'Bash repeat install failed.' }
    foreach ($tool in @('.claude','.agents','.gemini')) { Assert-Copy (Join-Path $destination "$tool/skills/dotnet-api-mentor") }
    $conflict = Join-Path $testRoot 'Bash conflict'
    & bash $bashInstaller gemini $conflict
    if ($LASTEXITCODE -ne 0) { throw 'Bash fixture creation failed.' }
    $custom = Join-Path $conflict '.gemini/skills/dotnet-api-mentor/SKILL.md'
    Add-Content -LiteralPath $custom -Value 'Local customization must survive.'
    $before = (Get-FileHash -LiteralPath $custom).Hash
    & bash $bashInstaller all $conflict 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0 -or (Get-FileHash -LiteralPath $custom).Hash -ne $before -or (Test-Path (Join-Path $conflict '.claude'))) { throw 'Bash conflict protection failed.' }
    # The expected rejection is handled; do not leak its exit code to CI.
    $global:LASTEXITCODE = 0
}
Write-Output "PASS: installer copy, idempotency, paths with spaces, and conflict protection. Temporary fixtures: $testRoot"
