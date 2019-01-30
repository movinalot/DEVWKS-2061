# ex_05.ps1
# Metadata
$vlan_meta = Get-UcsCmdletMeta -ClassId FabricVlan

$vlan_meta.MoMeta
$vlan_meta.MoMeta.PropertyMeta
$vlan_meta.MoMeta.PropertyMeta[9].Restriction
$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Id"} | Select-Object -ExpandProperty Restriction | Select-Object Range

$vlan_meta.MoMeta.PropertyMeta[15].Restriction
$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Name"} | Select-Object -ExpandProperty Restriction | Select-Object Pattern

$vlan_meta.MoMeta.PropertyMeta[27].Restriction
$vlan_meta.MoMeta.PropertyMeta | Where-Object {$_.Name -eq "Sharing"} | Select-Object -ExpandProperty Restriction | Select-Object ValueSet
