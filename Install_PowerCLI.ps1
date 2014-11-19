# Install PowerCLI
Set-executionPolicy RemoteSigned -Confirm:$false -force
Write-Host "Installing PowerCLI"
$myargs = $myargs = '/q /s /w /L1033 /v" /qn '
$exe = "D:\Downloads\VMware-PowerCLI-5.5.0-1295336.exe"
Start-process $exe $myargs –Wait
Add-PSSnapin -Name VMware.VimAutomation.Core