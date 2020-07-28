<#  
Change a specific user's OneDrive storage space
 
https://docs.microsoft.com/en-us/onedrive/change-user-storage

To connect with a user name and password

$adminUPN="<the full email address of a SharePoint administrator account, example: jdoe@contosotoycompany.onmicrosoft.com>"
$orgName="<name of your Office 365 organization, example: contosotoycompany>"
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential 

#>

# To connect with Sharepoint Site

$adminUPN="user@domain.com"
$orgName="my365"
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential

# To get the storage Quota for user

$iden = "https://my365-my.sharepoint.com/personal/user_domain_com"
Get-SPOsite -Identity $iden | Format-list Owner, StorageQuota

# To configure the storage Quota for user

Set-SPOSite -Identity $iden -StorageQuota "1048576"