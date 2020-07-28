# Install Module MSOnline
Install-Module -Name Msonline

# Import Module MSOnline
Import-Module -name MSOnline

# Connect to MSOlservice
Connect-MSOlservice

# To get all license into you have on office 365 tenancy run following command
Get-MsolAccountSku

# Now we will get particular license for example, 
Get-MsolAccountSku | Where-Object {$_.SkuPartNumber -eq "O365_BUSINESS_ESSENTIALS" } 

# Now we will find which command for to apply license
Get-command *license*

# we find Set-MsOlUserLicense to set license to user
Set-MsolUserLicense -UserPrincipalName abc@xyz.com -AddLicenses <put license Name>

# get unlicensed users and set licese to each unlicensed user
Get-MsolUser -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses <put license Name>






  