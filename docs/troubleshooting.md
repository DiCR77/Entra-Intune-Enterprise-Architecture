# 🛠️ Guide de Dépannage (Troubleshooting)

## 📌 1. Erreur d'enrôlement Autopilot / ESP (ex: 0x80041326)
* **Cause :** Conflit lors de l'inscription de la tâche planifiée d'enrôlement ou tentative de Workplace Join au lieu d'un Entra ID Join.
* **Résolution :** 
  1. Préférer l'enrôlement OOBE natif lors de l'initialisation de la VM.
  2. Forcer une réinitialisation propre (`Shift + F10` > `sysprep` ou menu Récupération Windows > Tout supprimer).

## 📌 2. Application Win32 bloquée en "En attente" (ESP)
* **Cause :** Script de détection PowerShell renvoyant un code d'erreur (`exit 1`) ou binaire d'installation trop lourd qui dépasse le timeout.
* **Résolution :**
  1. Ouvrir le prompt de commande sur la Page d'état (`Shift + F10`).
  2. Consulter les logs Intune Management Extension dans `C:\ProgramData\Microsoft\IntuneManagementExtension\Logs\IntuneManagementExtension.log`.

## 📌 3. Appareil bloqué en "Non Conforme" (Non-Compliant)
* **Cause :** BitLocker ou Defender non encore synchronisés avec le tenant.
* **Résolution :** Forcer la synchro depuis l'appareil : *Paramètres > Comptes > Accès professionnel ou scolaire > Infos > Synchroniser*.
