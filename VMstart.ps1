#Created by Jack Orcherton

$vmrunPath = "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" #path to vmware run command
$vmPath = "C:\Users\myUserName\VirtualMachines\myVM.vmx" #path to vm to boot

& $vmrunPath -T ws start $vmPath #Starts VM
Write-Host "VM started, waiting for it to boot"
Write-Host -NoNewline "Loading"

Do { #Loops until VMware states the linux IP Address
    $vmIP = & $vmrunPath -T ws getGuestIPAddress $vmPath
    Write-Host -NoNewline "."
}
While ($vmIP -Match "Error:")

Write-Host "Done"
Write-Host ""
Write-Host "Connecting to IP:" $vmIP

#Notes whether in NAT or Host-Only
IF($vmIP -Match "192.168.159."){
    Write-Host "In host only mode"
} Else {
    Write-Host "WARNING: in NAT mode (connected to internet)!"
}

Write-Host ""

#Connects via ssh
ssh root@$vmIP
