#Enumerate VMs and search for Protect Snapshots.  Red machines have snapshots to remove, green have no snapshots.
foreach ($vm in get-vm | sort Name) {
                $vmname = $vm.name
                $snaps = get-snapshot -vm $vm 
                foreach ($snap in $snaps) {
                                $snapName = $snap.name
                                if ($snapname -like "EnableCBT") {
                                                Write-Host "Found snapshot: $snapname on $vmname" -foregroundcolor red 
                                               
                                                remove-snapshot -snapshot $snap -confirm:$false
                                }
                                Else {
                                                Write-Host "No EnableCBT snapshot found on $vmname" -foregroundcolor green 
                                }
                }
}

