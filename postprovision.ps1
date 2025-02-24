
$containerUrl= $env:containerUrl



# sending stats to table please comment out if you do not want this

$webhookUrl = "https://8116ebc5-9750-4a45-bb68-3623eef692f3.webhook.ne.azure-automation.net/webhooks?token=ZEwDwUSa225CZVgKPQ7ZDDe6K%2f8k9sMl2ou1FJlYpMA%3d"

$deploymentData = @{
    User = $env:USERNAME
    Machine = $env:AZUREPS_HOST_ENVIRONMENT
    CommitHash = (git rev-parse HEAD)
    AzureUser = $(az account show --query user.name -o tsv)
} | ConvertTo-Json -Depth 10

Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $deploymentData -ContentType "application/json"
Write-Output "Stats Tracked"

