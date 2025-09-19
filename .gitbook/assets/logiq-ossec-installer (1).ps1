param(
    [Parameter(Mandatory=$true)]
    [string]$LOGIQ_OSSEC_MANAGER,

    [Parameter(Mandatory=$true)]
    [string]$LOGIQ_OSSEC_PASSWORD
)

Invoke-WebRequest 'https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.10-1.msi' -OutFile logiq-ossec-agent.msi

$hostname = hostname
.\logiq-ossec-agent.msi /q WAZUH_MANAGER=$LOGIQ_OSSEC_MANAGER WAZUH_REGISTRATION_PASSWORD=$LOGIQ_OSSEC_PASSWORD WAZUH_AGENT_NAME=$hostname

Start-Sleep -Seconds 20

$serviceName = (Get-Service | Where-Object {$_.Name -like "Wazu*"}).Name
Start-Service $serviceName -PassThru

$hostname = hostname
$macAddress = (Get-WmiObject -Class Win32_NetworkAdapter -Filter "NetEnabled='True'").MACAddress
$macAddress = $macAddress -replace ":", ""
$agentName = "$hostname-$macAddress"
echo "Agentname: $agentName"

cd 'C:\Program Files (x86)\ossec-agent\'

.\agent-auth.exe -m $LOGIQ_OSSEC_MANAGER -p 1515 -P $LOGIQ_OSSEC_PASSWORD -A $agentName

Restart-Service $serviceName -PassThru
