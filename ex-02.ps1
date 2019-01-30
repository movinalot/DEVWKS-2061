# ex_02.ps1
# PowerTool is case sensitive by default
Get-UcsBlade -Model UCSB-B200-M4 | Select-Object Dn, Serial, Model
Get-UcsBlade -Model ucsb-B200-M4 | Select-Object Dn, Serial, Model

# PowerShell is case insensitive by default
Get-UcsBlade | ?{$_.Model -eq 'ucsb-B200-M4'} | Select-Object Dn, Serial, Model

# Filter Strings
Get-UcsBlade -Filter 'Model -ilike UcsB-b200-M3' -Xml | Select-Object Dn, Model | more
Get-UcsBlade -Filter 'Model -ilike UcsB-b200-M4' -Xml | Select-Object Dn, Model | more