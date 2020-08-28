# Install Module MSOnline
Install-Module -Name Msonline

# Import Module MSOnline
Import-Module -name MSOnline

# Connect to MSOlservice
Connect-MSOlservice

# To get all licenses into office 365 tenancy, run following command
Get-MsolAccountSku

<# for example you get following result. 
AccountSkuId                                ActiveUnits WarningUnits ConsumedUnits
------------                                ----------- ------------ -------------
WINDOWS_STORE                               25          0            0            
ENTERPRISEPACK                              1           0            1            
FLOW_FREE                                   10000       0            4            
RIGHTSMANAGEMENT                            8           0            4            
POWER_BI_STANDARD                           1000000     0            1            
TEAMS_EXPLORATORY                           100         0            1            
MCOMEETADV                                  1           0            0            
SPE_E3                                      0           0            0            
O365_BUSINESS_ESSENTIALS                    37          0            37           
PROJECTPROFESSIONAL                         2           0            2            
ATP_ENTERPRISE                              37          0            37   
#>


$luser = Get-MsolUser

$licename = Read-Host "Please Enter License Name from above list your want to get userlist: "

foreach ($u in $luser)
{
    $lic = $u.Licenses.accountskuid
    if ($lic -match $licename)
    {
        write-host $u.UserPrincipalName `t $licename
    }  
}