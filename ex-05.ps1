<# ex-05.ps1

Purpose:
    UCS Manager More Metadata examples
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

Import-Module Cisco.UCSManager

# Metadata
$vlan_meta = Get-UcsCmdletMeta -ClassId FabricVlan

$vlan_meta.MoMeta
$vlan_meta.MoMeta.PropertyMeta

$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Id"} | Select-Object -ExpandProperty Restriction | Select-Object Range

$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Name"} | Select-Object -ExpandProperty Restriction | Select-Object Pattern

$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Sharing"} | Select-Object -ExpandProperty Restriction | Select-Object ValueSet