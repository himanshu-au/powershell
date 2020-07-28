# Stored Office 365 credential
$UserCredential = Get-Credential

# connect to Powershell Session  
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

# import Powershell Session
Import-PSSession $Session -DisableNameChecking

# "Get-mailbox -RecipientTypeDetails sharedmailbox" will give all shared mailbox in Office 365 tenant. 
$sharedmailbox = Get-Mailbox -RecipientTypeDetails sharedmailbox | Get-MailboxPermission
 
# Find all sharedmailbox which has Email like format  then pipe to 
$sharedmailbox | Where-Object {$_.user -like '*@*'} | Format-Table Identity, User, AccessRights -Autosize 

#  Cmdlet References for Microsoft 365 Services 
#  https://docs.microsoft.com/en-us/office365/enterprise/powershell/cmdlet-references-for-office-365-services



