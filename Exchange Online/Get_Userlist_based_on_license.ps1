# Install Module MSOnline
Install-Module -Name Msonline

# Import Module MSOnline
Import-Module -name MSOnline

# Connect to MSOlservice
Connect-MSOlservice

# To get all the SKUs that the company owns (Office 365 tenancy) run following command.
Get-MsolAccountSku

<# Get-MsolAccountSku output: for example 
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

# 1) To see the Userlist on Screen.
$luser = Get-MsolUser

$licename = Read-Host "Please Enter License Name from above list your want to get userlist: "

Foreach ($u in $luser)
{
    $lic = $u.Licenses.accountskuid
    if ($lic -match $licename)
    {
        write-host $u.UserPrincipalName `t $licename
    }  
}

# 2) To save the Userlist on Computer

$luser = get-msoluser

$licename = Read-Host "Please Enter License Name from above list you want to get userlist: "

$Output =  foreach ($u in $luser)
{
    $lic = $u.Licenses.accountskuid
    if ($lic -match $licename)
    {
        New-Object -TypeName PSObject -Property @{
        DisplayName =  $u.DisplayName 
        UserPrincipalName =  $u.UserPrincipalName 
        LicenseName =  $licename 
        } | Select-Object DisplayName, UserPrincipalName, LicenseName
    }  
} 
     # save to .csv file. Use following command and use your preferred location to save the file. 
$Output | Export-Csv $env:USERPROFILE\Desktop\liceuserlist.csv

     # save to .html file. Use following command and use your preferred location to save the file. 
$Output | ConvertTo-Html | Out-File $env:USERPROFILE\Desktop\liceuser.htm