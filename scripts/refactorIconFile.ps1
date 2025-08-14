# This script changes the icons file name 
# and add ui kit package for each of them.
#
# example usage
# .\refactorIconFile.ps1 -Reference packageName
#
# [PackageName is the class name of exported icon file before editing (ie : PAPiconset)]

param(
    [String] $Reference
)

$iconFile = $Reference + '_icons.dart'
$fullIconFile = '..\src\packages\module_ui_components\lib\widgets\' + $Reference + '_icons.dart'

# Add UiKit import on line 8
Write-Host 'Step 1: add UiKit import to font file..'
$importToAdd = "import 'package:module_ui_components/module_ui_components.dart';`n"
$fileContent = Get-Content $fullIconFile
$fileContent[8] += $importToAdd
$fileContent | Set-Content $fullIconFile
Write-Host '--- Done ---'

Start-Sleep -Seconds 1

# Add package name at the end of all icons
Write-Host 'Step 2: Add package name at the end of all icons..'
$gitRegExToRemove = 'fontFamily\:\s+_fontFamily\);'
$replaceWith = 'fontFamily: _fontFamily, fontPackage: PapUiKit.packageName);'
Get-ChildItem -Path ..\ -Filter $iconFile -Recurse -File| ForEach-Object {
    (Get-Content  $_ -Raw) -replace($gitRegExToRemove, $replaceWith) | Set-Content -NoNewline $_
}
Write-Host '--- Done ---'

Start-Sleep -Seconds 1

# Replace Class name
Write-Host 'Step 3: Replace Class name with PAPIcons..'
$classNameToremove = 'class\s+'+ $Reference +'\s+\{' 
$classNameToReplace = 'class PAPIcons {'
Get-ChildItem -Path ..\ -Filter $iconFile -Recurse -File| ForEach-Object {
    (Get-Content  $_ -Raw) -replace($classNameToremove, $classNameToReplace) | Set-Content -NoNewline $_
}
Write-Host '--- Done ---'

Start-Sleep -Seconds 1

# Replace Class constructor
Write-Host 'Step 4: Replace Class constructor with PAPIcons..'
$classNameToremove = $Reference+'\._\(\);' 
$classNameToReplace = 'PAPIcons._();'
Get-ChildItem -Path ..\ -Filter $iconFile -Recurse -File| ForEach-Object {
    (Get-Content  $_ -Raw) -replace($classNameToremove, $classNameToReplace) | Set-Content -NoNewline $_
}
Write-Host '--- Done ---'

Start-Sleep -Seconds 1

# Rename file name to pap_icons.dart
Write-Host 'Step 4: Rename file name to pap_icons.dart..'
$papIconFileName = 'pap_icons.dart'
Rename-Item $fullIconFile $papIconFileName
Write-Host '--- All Done ! ---'
