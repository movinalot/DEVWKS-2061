<# ex-05.ps1

Purpose:
    UCS Manager More Metadata examples
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

# Metadata
$vlan_meta = Get-UcsCmdletMeta -ClassId FabricVlan

$vlan_meta.MoMeta
$vlan_meta.MoMeta.PropertyMeta

'Attribute Name:' + $vlan_meta.MoMeta.PropertyMeta[9].Name
$vlan_meta.MoMeta.PropertyMeta[9].Restriction  # Array index could change with updated firmware finding by "Name" is better
$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Id"} | Select-Object -ExpandProperty Restriction | Select-Object Range

'Attribute Name:' + $vlan_meta.MoMeta.PropertyMeta[15].Name
$vlan_meta.MoMeta.PropertyMeta[15].Restriction # Array index could change with updated firmware finding by "Name" is better
$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Name"} | Select-Object -ExpandProperty Restriction | Select-Object Pattern

'Attribute Name:' + $vlan_meta.MoMeta.PropertyMeta[28].Name
$vlan_meta.MoMeta.PropertyMeta[28].Restriction # Array index could change with updated firmware finding by "Name" is better
$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Sharing"} | Select-Object -ExpandProperty Restriction | Select-Object ValueSet