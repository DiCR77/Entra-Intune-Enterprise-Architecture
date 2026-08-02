[CmdletBinding()]
param (
    [string]$Path = ".\backup"
)

# 1. Vérification / Installation du module Microsoft.Graph
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph.Authentication)) {
    Write-Host "Installation du module Microsoft.Graph..." -ForegroundColor Yellow
    Install-Module Microsoft.Graph.Authentication -Scope CurrentUser -Force
}

# 2. Connexion à Microsoft Graph avec les permissions nécessaires
Write-Host "Connexion à Microsoft Graph..." -ForegroundColor Cyan
Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All", "DeviceManagementManagedDevices.Read.All"

# 3. Création du dossier de destination
if (-not (Test-Path $Path)) {
    New-Item -ItemType Directory -Path $Path | Out-Null
}

# 4. Export des stratégies de conformité
Write-Host "Exportation des stratégies de conformité..." -ForegroundColor Green
$CompliancePolicies = Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/v1.0/deviceManagement/deviceCompliancePolicies"
$CompliancePolicies.value | ForEach-Object {
    $_ | ConvertTo-Json -Depth 10 | Set-Content -Path "$Path\Compliance_$($_.displayName -replace '[\\/:*?"<>|]', '_').json"
}

# 5. Export des profils de configuration
Write-Host "Exportation des profils de configuration..." -ForegroundColor Green
$DeviceConfigs = Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/v1.0/deviceManagement/deviceConfigurations"
$DeviceConfigs.value | ForEach-Object {
    $_ | ConvertTo-Json -Depth 10 | Set-Content -Path "$Path\Config_$($_.displayName -replace '[\\/:*?"<>|]', '_').json"
}

Write-Host "Export terminé avec succès dans le dossier : $Path" -ForegroundColor Cyan
