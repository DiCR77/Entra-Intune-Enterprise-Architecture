# Supprimer le dossier de l'application et le raccourci du bureau
Remove-Item -Path "C:\Program Files\FPSBoostPro" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\Public\Desktop\FPS Boost Pro.lnk" -Force -ErrorAction SilentlyContinue
