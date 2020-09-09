# How to add additional Domain Controller to existing Active Directory Domain.

# To install Active Directory Domain Service role on server

Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# To import Active Directory Domain Service Deployment Module

Import-Module ADDSDeployment

# To store UserName and DomainName into Variable

$User = Read-Host "Enter Enterprise Administrator"
$DomainName = Read-Host "Enter Domain Name"
$EnterpriseAdmin = "$DomainName\$User"
$ReplicationSourceServeName = Read-Host "Enter ReplicationSourceServerName (FQDN):" 

# To configure the new server as an additional domain controller

Install-ADDSDomainController `
    -NoGlobalCatalog:$false `
    -CreateDnsDelegation:$false `
    -Credential (Get-Credential $EnterpriseAdmin) `
    -CriticalReplicationOnly:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainName $DomainName `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SiteName "Default-First-Site-Name" `
    -ReplicationSourceDC $ReplicationSourceServeName `
    -SysvolPath "C:\Windows\SYSVOL" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force) `
    -Force:$true