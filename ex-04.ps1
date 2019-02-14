<# ex-04.ps1

Purpose:
    UCS Manager Metadata example
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

Import-Module Cisco.UCSManager

$creds = new-object -typename System.Management.Automation.PSCredential `
    -argumentlist "admin",$(convertto-securestring -Force -AsPlainText "Nbv12345")

$ucsm_ip = "198.18.133.91"

Connect-Ucs -Name $ucsm_ip -Credential $creds

Get-UcsVlan | Select-Object Dn, SwitchId, Id

Get-UcsCmdletMeta -Noun Vlan
Get-UcsCmdletMeta -Noun UcsVlan
Get-UcsCmdletMeta -ClassId FabricVlan
Get-UcsCmdletMeta -ClassId FabricVlan -Tree

$vlan_meta = Get-UcsCmdletMeta -ClassId FabricVlan
$vlan_meta

Disconnect-Ucs