$Path = "C:\Program Files\FPSBoostPro\FPSBoostPro.exe"

if (Test-Path -Path $Path) {
    Write-Output "App détectée"
    Exit 0
} else {
    Exit 1
}
