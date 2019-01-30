# ex-07.ps1
# Transactions
Import-Module Cisco.UCSManager

Connect-Ucs -Name 198.18.133.91

$ucsLanCloud = Get-UcsLanCloud

Start-UcsTransaction
101..104 | ForEach-Object {Add-Ucsvlan -LanCloud $ucsLanCloud -Name vlan$_ -id $_}
Complete-UcsTransaction

Start-UcsTransaction
105..120 | ForEach-Object {Add-Ucsvlan -LanCloud $ucsLanCloud -Name vlan$_ -id $_}
Complete-UcsTransaction

Start-UcsTransaction
Get-UcsVlan | Where-Object {$_.id -ge 102 -and $_.id -le 120} | Remove-UcsVlan -Force | Out-Null
Complete-UcsTransaction | Out-Null

Disconnect-Ucs