foreach ($vm in get-vm | sort Name) {
	Write-Host "Setting .changeTrackingEnabled on $vm"
	$vmtest = Get-VM $vm | get-view
	$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
	$vmConfigSpec.changeTrackingEnabled = $true
	$vmtest.reconfigVM($vmConfigSpec)
	$snapshot=Get-Snapshot -VM $virtual_machine
	if ($snapshot) {
		Write-Host $vm ": Snapshot found! Skipping VM"
	} else {
		Write-Host "Create Snapshot of $vm"
		Get-VM $vm | New-Snapshot -Name CBTEnable -Quiesce
		Write-Host "Deleting Snapshot of $vm"
		Get-VM $vm | Get-Snapshot -Name CBTEnable | Remove-Snapshot -Confirm:$false	
	}
}
