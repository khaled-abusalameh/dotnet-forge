[CmdletBinding()]
param(
    [ValidateSet('all','claude','codex','gemini')][string]$Tool = 'all',
    [string]$Destination = (Split-Path -Parent $PSScriptRoot)
)
$ErrorActionPreference = 'Stop'
$source = Join-Path (Split-Path -Parent $PSScriptRoot) 'skills/dotnet-api-mentor'
if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md'))) { throw 'Source skill missing.' }
$destinationRoot = [IO.Path]::GetFullPath($Destination)
$mapping = @{claude='.claude'; codex='.agents'; gemini='.gemini'}
$selected = if ($Tool -eq 'all') { @('claude','codex','gemini') } else { @($Tool) }
$files = @(Get-ChildItem -LiteralPath $source -Recurse -File)
if (Get-ChildItem -LiteralPath $source -Recurse -Force | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }) { throw 'Source links are not supported.' }
$targets = @()
# Preflight every target before any copy. Never overwrite divergent files.
foreach ($selectedTool in $selected) {
    $target = Join-Path $destinationRoot ($mapping[$selectedTool] + '/skills/dotnet-api-mentor')
    $ancestor = $target
    while ($ancestor) {
        if (Test-Path -LiteralPath $ancestor) {
            $item = Get-Item -LiteralPath $ancestor -Force
            if (-not $item.PSIsContainer -or ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) { throw "Unsafe destination component: $ancestor" }
        }
        $ancestor = Split-Path -Parent $ancestor
    }
    if (Test-Path -LiteralPath $target) {
        $actual = @(Get-ChildItem -LiteralPath $target -Recurse -Force)
        if ($actual | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }) { throw "Destination contains links: $target" }
        $actualFiles = @($actual | Where-Object { -not $_.PSIsContainer })
        if ($actualFiles.Count -ne $files.Count) { throw "Existing installation differs: $target. Use a fresh destination or reconcile it manually." }
        foreach ($file in $files) {
            $relative = $file.FullName.Substring($source.Length + 1)
            $other = Join-Path $target $relative
            if (-not (Test-Path -LiteralPath $other -PathType Leaf) -or (Get-FileHash -LiteralPath $file.FullName).Hash -ne (Get-FileHash -LiteralPath $other).Hash) { throw "Existing installation differs: $target. No files overwritten." }
        }
        Write-Output "Already current: $target"
    } else { $targets += $target }
}
foreach ($target in $targets) {
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item -Path (Join-Path $source '*') -Destination $target -Recurse
    Write-Output "Installed: $target"
}
Write-Output 'Restart/reload the target tool and verify skill discovery. No global settings or trainee state were changed.'
