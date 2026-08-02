# 1. Créer le dossier de destination dans Program Files
$Destination = "C:\Program Files\FPSBoostPro"
if (!(Test-Path -Path $Destination)) {
    New-Item -ItemType Directory -Path $Destination -Force
}

# 2. Copier l'exécutable dans le dossier
Copy-Item -Path "$PSScriptRoot\FPSBoostPro.exe" -Destination "$Destination\FPSBoostPro.exe" -Force

# 3. Créer un raccourci sur le Bureau pour tous les utilisateurs
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut("C:\Users\Public\Desktop\FPS Boost Pro.lnk")
$Shortcut.TargetPath = "$Destination\FPSBoostPro.exe"
$Shortcut.Save()
