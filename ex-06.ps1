# ex-06.ps1
# Configure

# Add a VLAN
Get-UcsLanCloud | Add-UcsVlan -Name CiscoLive -Id 500

# Add an Organizatoin
$ucsOrg = Add-UcsOrg -Name CiscoLiveOrg
Add-UcsServiceProfile –Org $ucsOrg -Name CiscoLiveSP
Add-UcsBootPolicy –Org $ucsOrg -Name CL_BP -RebootOnUpdate yes -BootMode legacy | Add-UcsLsbootVirtualMedia -ModifyPresent -Access "read-only-local" -LunId "0" -Order 1

Get-UcsServiceProfile -Name CiscoLiveSP | Set-UcsServiceProfile -BootPolicyName CL_BP -Force
Add-UcsServiceProfile –Org $ucsOrg -Name CiscoLiveSP -BootPolicyName CL_BP -ModifyPresent
Get-UcsServiceProfile -Name CiscoLiveSP

Get-UcsOrg -Name CiscoLiveOrg | Get-UcsBootPolicy -Name CL_BP | Remove-UcsBootPolicy -Force
Get-UcsServiceProfile -Name CiscoLiveSP