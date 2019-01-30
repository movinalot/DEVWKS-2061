# ex_04.ps1
# Metadata
Get-UcsVlan | Select Dn, SwitchId, Id

Get-UcsCmdletMeta -Noun Vlan
Get-UcsCmdletMeta -Noun UcsVlan
Get-UcsCmdletMeta -ClassId FabricVlan
Get-UcsCmdletMeta -ClassId FabricVlan -Tree

$vlan_meta = Get-UcsCmdletMeta -ClassId FabricVlan
$vlan_meta
