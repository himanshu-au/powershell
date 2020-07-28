# Stored Office 365 credential
$UserCredential = Get-Credential

# connect to Powershell Session  
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

# import Powershell Session
Import-PSSession $Session -DisableNameChecking

# Run following cmdlet to find each mailbox sizes.
Get-mailbox | Get-MailboxStatistics | Format-Table DisplayName, TotalItemSize -AutoSize

# Sort above command base on TotalItemSize with the help of "sort-object"
Get-mailbox | Get-MailboxStatistics | sort-object TotalItemSize | Format-Table DisplayName, TotalItemSize -AutoSize