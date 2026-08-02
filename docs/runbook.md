# 📖 Runbook Opérationnel (Procédures Admin)

## 📌 Procédure 1 : Onboarding d'un nouvel utilisateur
1. Créer le compte dans **Microsoft Entra ID**.
2. Renseigner les attributs obligatoires (Ex: `Department = IT`).
3. Attribuer la licence **Microsoft 365 E5**.
4. L'utilisateur est automatiquement ajouté au groupe dynamique `Diae_Groupe`.

## 📌 Procédure 2 : Déploiement d'un nouveau poste Windows 11
1. Récupérer le Hash matériel (HWID) du poste via PowerShell si nécessaire :
   `Get-WindowsAutoPilotInfo.ps1 -OutputFile HWID.csv`
2. Importer le Hash dans Intune (*Appareils > Inscription > Appareils Autopilot*).
3. Assigner l'appareil au profil `AP_WIN11_UserDriven`.
4. Livrer le PC directement à l'utilisateur final.

## 📌 Procédure 3 : Offboarding / Réinitialisation d'un poste
1. Aller sur **Intune > Appareils > Tous les appareils**.
2. Sélectionner l'appareil et cliquer sur **Wipe** (Effacer) ou **Autopilot Reset**.
