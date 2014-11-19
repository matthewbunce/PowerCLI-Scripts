Write-Host "Setting .changeTrackingEnabled on $vm"
$vmtest = Get-VM DCC-Citrix02 | get-view
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$vmConfigSpec.changeTrackingEnabled = $true
$vmtest.reconfigVM($vmConfigSpec)
Write-Host "Stunning $vm"
Get-VM $vm | New-Snapshot -Name CBTEnable -Quiesce
Write-Host "Un-Stunning $vm"
Get-VM $vm | Get-Snapshot -Name CBTEnable | Remove-Snapshot -Confirm:$false -RunASync
