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

$xmlFiles = Get-ChildItem -LiteralPath (Join-Path $root 'Mod') -Recurse -File -Filter '*.xml'
foreach ($file in $xmlFiles) { [xml](Get-Content -LiteralPath $file.FullName -Raw) | Out-Null }

$expectedMoodEffects = [ordered]@{
    RimScentExtended_Scent_Drought      = '-2'
    RimScentExtended_Scent_Swelter      = '-2'
    RimScentExtended_Scent_PsychicBloom = '2'
    RimScentExtended_Scent_Ozone        = '1'
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

$french = Read-Xml 'Mod/Languages/French/DefInjected/ThoughtDef/Scents_Weather.xml'
$frenchEntries = @($french.LanguageData.ChildNodes | Where-Object { $_.NodeType -eq 'Element' })
Assert-True ($frenchEntries.Count -eq 22) 'French DefInjected inventory changed.'
foreach ($thought in $expectedMoodEffects.Keys) {
    $entries = @($frenchEntries | Where-Object { $_.Name -like "$thought.*" })
    Assert-True ($entries.Count -eq 2) "French translation must provide label and description for $thought."
    Assert-True ((@($entries | Where-Object { [string]::IsNullOrWhiteSpace($_.InnerText) }).Count) -eq 0) "French translation contains empty text for $thought."
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

$modCode = Get-ChildItem -LiteralPath (Join-Path $root 'Mod') -Recurse -File -Include '*.cs','*.dll'
Assert-True ($null -eq $modCode -or @($modCode).Count -eq 0) 'This declarative expansion must not ship code or an assembly.'
$settingsReferences = @(rg -l -i 'MainButton|ModSettings|DoSettingsWindowContents|GetSettings' (Join-Path $root 'Mod'))
Assert-True ($settingsReferences.Count -eq 0) 'A settings or MainButtons implementation was found; redo the settings audit.'

Write-Host "PASS: $($xmlFiles.Count) XML files, $($owned.Count) owned thoughts, and $($frenchEntries.Count) French entries validated."
