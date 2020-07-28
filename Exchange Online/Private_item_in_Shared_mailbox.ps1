# MSOnline module must be installed.
install-module msonline

# Connect to MSOnline services
Connect-MsolService

# Connect to Exchange Online
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

# Give Delegate and CanViewPrivateItems to John@contoso.com for Sharedmailbox@contoso.com.
Add-MailboxFolderPermission -Identity sharedmailbox@Contoso.com:\Calendar -User John@contoso.com -AccessRights Editor -SharingPermissionFlags Delegate,CanViewPrivateItems