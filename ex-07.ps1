# ex-07.ps1
# Transactions
$ucsLanCloud = Get-UcsLanCloud

Start-UcsTransaction
101..104 | %{Add-Ucsvlan -LanCloud $ucsLanCloud -Name vlan$_ -id $_}
Complete-UcsTransaction

Start-UcsTransaction
105..120 | %{Add-Ucsvlan -LanCloud $ucsLanCloud -Name vlan$_ -id $_}
Complete-UcsTransaction

Start-UcsTransaction
Get-UcsVlan | ?{$_.id -ge 102 -and $_.id -le 120} | Remove-UcsVlan -Force | Out-Null
Complete-UcsTransaction | Out-Null
