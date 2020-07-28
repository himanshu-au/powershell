# Stored Office 365 credential
$UserCredential = Get-Credential

# connect to Powershell Session  
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

# import Powershell Session
Import-PSSession $Session -DisableNameChecking

#  Cmdlet References for Microsoft 365 Services 
#  https://docs.microsoft.com/en-us/office365/enterprise/powershell/cmdlet-references-for-office-365-services