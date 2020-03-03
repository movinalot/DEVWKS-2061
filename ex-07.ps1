<# ex-07.ps1

Purpose:
    UCS Manager Transactions example
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

Import-Module Cisco.UCSManager

$creds = new-object -typename System.Management.Automation.PSCredential `
    -argumentlist "admin",$(convertto-securestring -Force -AsPlainText "Nbv12345")

$ucsm_ip = "10.10.20.40"

Connect-Ucs -Name $ucsm_ip -Credential $creds

$ucsLanCloud = Get-UcsLanCloud

# Add (Create) VLANs 101 through 104. Each VLAN creation is a single round trip to UCS Manager 
101..104 | ForEach-Object {Add-Ucsvlan -LanCloud $ucsLanCloud -Name vlan$_ -id $_ -ModifyPresent}

# Add (Create) VLANs 105 through 120 in a Transaction. All VLANs are created in a single request
Start-UcsTransaction
105..120 | ForEach-Object {Add-Ucsvlan -LanCloud $ucsLanCloud -Name vlan$_ -id $_ -ModifyPresent}
Complete-UcsTransaction

# Remove VLANS 105 through 120 in a Transaction
Start-UcsTransaction
Get-UcsVlan | Where-Object {$_.id -ge 105 -and $_.id -le 120} | Remove-UcsVlan -Force | Out-Null
Complete-UcsTransaction | Out-Null

Disconnect-Ucs