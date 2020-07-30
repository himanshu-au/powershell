# Stored Office 365 credential
$UserCredential = Get-Credential

# connect to Powershell Session  
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

# import Powershell Session
Import-PSSession $Session -DisableNameChecking

# store sharedmailbox and user's email to variable
$email = Read-host "Please Enter User e-mail ID: "
Write-Output ""
$sharedmailbox = Read-Host "Please Enter Sharedmailbox e-mail ID: "
$identity = $sharedmailbox + ":\calendar"

# Give Delegate and CanViewPrivateItems to John@contoso.com for Sharedmailbox@contoso.com.
Add-MailboxFolderPermission -Identity $identity -User $email -AccessRights Editor -SharingPermissionFlags Delegate,CanViewPrivateItems

# Print Command completed successfully
Write-Host "Now User has delegate and CanViewPrivateItems Permission for Sharedmailbox."  -BackgroundColor Cyan -ForegroundColor Black

# Get-MailboxFolderPermission
Get-MailboxFolderPermission -Identity $identity