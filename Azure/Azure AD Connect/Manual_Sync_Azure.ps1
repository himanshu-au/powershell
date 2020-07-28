# Run following command on where "Azure AD Connect" Installed.
# install Module AzureAD
Install-Module -Name AzureAD

# import Module
Import-Module -Name AzureAD

# Connect to AzureAD
Connect-AzureAD

# Stop AD Sync Scheduler 
Set-ADSyncScheduler -SyncCycleEnabled $false

<# 
Define ConnectorName and RunProfileName Variables for ADSync Run manually
"Get-adsyncconnector | ft Name, ConnectorTypeName, Subtype -wrap" run this command to get connectorname
Put Active Directory Name first "xyz.com" and "abc.onmicrosoft.com - AAD" second in Varialbe Name $connectorName
#>

$ConnectorName = @("xyz.com","abc.onmicrosoft.com - AAD")
$RunProfileName = @("Delta Import","Delta Synchronization","Export")

# Run ADSyncRunProfile for each Connector Name for each Profile Name
foreach ($RunProfile in $RunProfileName)
{
    foreach ($Connector in $ConnectorName)
    {
        write-host " "
        write-host "$Connector connector sync with runprofile $RunProfile" -BackgroundColor Cyan -ForegroundColor Black
        write-host " "
        write-host "-----------------------------------------------------------" -ForegroundColor Yellow
        write-host " "
        Invoke-ADSyncRunProfile -ConnectorName $Connector -RunProfileName $RunProfile
        Start-Sleep -Seconds 1
    }
}

# Start AD Sync Scheduler
Set-ADSyncScheduler -SyncCycleEnabled $true