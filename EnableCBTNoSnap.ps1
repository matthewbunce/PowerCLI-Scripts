foreach ($vm in get-vm | sort Name) {
	Write-Host "Setting .changeTrackingEnabled on $vm"
	$vmtest = Get-VM $vm | get-view
	$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
	$vmConfigSpec.changeTrackingEnabled = $true
	$vmtest.reconfigVM($vmConfigSpec)
}
Write-Host "Listing all VMs with .changeTrackingEnabled Set"
Get-VM| Where-Object{$_.ExtensionData.Config.ChangeTrackingEnabled -eq $true}