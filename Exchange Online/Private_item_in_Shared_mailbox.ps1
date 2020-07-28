# MSOnline module must be installed.
install-module msonline

# Connect to MSOnline services
Connect-MsolService

# Connect to Exchange Online
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

# Import Powershell Session
Import-PSSession $Session

# store sharedmailbox and user's email to variable
$email = Read-host "Please Enter User e-mail ID: "
Write-Output ""
$sharedmailbox = Read-Host "Please Enter Sharedmailbox e-mail ID: "

# Give Delegate and CanViewPrivateItems to John@contoso.com for Sharedmailbox@contoso.com.
Add-MailboxFolderPermission -Identity $sharedmailbox:\Calendar -User $email -AccessRights Editor -SharingPermissionFlags Delegate,CanViewPrivateItems

# Print Command completed successfully
Write-Host "Now User has delegate and CanViewPrivateItems Permission for Sharedmailbox."  -BackgroundColor Cyan -ForegroundColor Black