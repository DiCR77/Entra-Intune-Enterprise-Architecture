$AppName = "FPSBoostPro"
$ExpectedVersion = "2.5.1"
$InstallPath = "${env:ProgramFiles}\FPSBoostPro\FPSBoostPro.exe"

try {
    if (Test-Path $InstallPath) {
        $FileVersion = (Get-ItemProperty $InstallPath).VersionInfo.FileVersion
        if ($FileVersion -ge $ExpectedVersion) {
            Write-Output "Application detectee - Version: $FileVersion"
            exit 0  # Conforme
        } else {
            Write-Output "Version obsolete: $FileVersion (attendue: $ExpectedVersion)"
            exit 1  # Non conforme
        }
    } else {
        Write-Output "Application non installee"
        exit 1  # Non installee
    }
} catch {
    Write-Output "Erreur de detection: $_"
    exit 1
}
