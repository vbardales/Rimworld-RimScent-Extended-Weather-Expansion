# What no shared check reads: the mood effect of each of the 11 weather scents, the hard dependencies, the optional VEE gate, and that this declarative
# expansion ships no code. XML parse, French coverage and the settings audit are Check-ModBasics, Check-Translations and Check-SettingsContract.
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

function Assert-True([bool]$condition, [string]$message) {
    if (-not $condition) { throw $message }
}

function Read-Xml([string]$relativePath) {
    [xml](Get-Content -LiteralPath (Join-Path $root $relativePath) -Raw)
}

$expectedMoodEffects = [ordered]@{
    RimScentExtended_Scent_Drought      = '-2'
    RimScentExtended_Scent_Swelter      = '-2'
    RimScentExtended_Scent_PsychicBloom = '2'
    RimScentExtended_Scent_Ozone        = '2'
    RimScentExtended_Scent_ColdAir      = '1'
    RimScentExtended_Scent_Spores       = '-1'
    RimScentExtended_Scent_Forest       = '2'
    RimScentExtended_Scent_Water        = '1'
    RimScentExtended_Scent_Ocean        = '2'
    RimScentExtended_Scent_Stagnant     = '-3'
    RimScentExtended_Scent_HotSpring    = '3'
}

$thoughts = Read-Xml 'Mod/Defs/Scents_Weather.xml'
$owned = @($thoughts.Defs.ThoughtDef | Where-Object { $_.defName })
Assert-True ($owned.Count -eq $expectedMoodEffects.Count) 'Owned scent thought inventory changed.'
foreach ($thought in $owned) {
    Assert-True ($expectedMoodEffects.Contains($thought.defName)) "Unexpected thought: $($thought.defName)."
    Assert-True ([string]$thought.stages.li.baseMoodEffect -eq $expectedMoodEffects[$thought.defName]) "Unexpected mood effect for $($thought.defName)."
}

$about = Read-Xml 'Mod/About/About.xml'
$dependencies = @($about.ModMetaData.modDependencies.li.packageId)
foreach ($id in @('reo.RimScent', 'nelim.rimscent.extended')) {
    Assert-True ($dependencies -contains $id) "Missing hard dependency: $id."
}
Assert-True ($dependencies.Count -eq 2) 'Optional integrations must not become hard dependencies.'
$loadAfter = @($about.ModMetaData.loadAfter.li)
Assert-True ($loadAfter -contains 'vanillaexpanded.vee') 'VEE must remain optional and ordered after its package.'

$folders = Read-Xml 'Mod/LoadFolders.xml'
$vee = @($folders.SelectNodes("/loadFolders/v1.6/li[@IfModActive='vanillaexpanded.vee' and text()='VEE']"))
Assert-True ($vee.Count -eq 1) 'VEE patches must remain conditionally loaded.'

$modCode = Get-ChildItem -LiteralPath (Join-Path $root 'Mod') -Recurse -File | Where-Object { $_.Extension -in '.cs', '.dll' }
Assert-True ($null -eq $modCode -or @($modCode).Count -eq 0) 'This declarative expansion must not ship code or an assembly.'

Write-Host "PASS: $($owned.Count) owned thoughts with their mood effect, hard dependencies, VEE gate, no code."
