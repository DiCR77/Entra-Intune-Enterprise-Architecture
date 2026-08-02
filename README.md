# 🛡️ Lab de Déploiement Modern Management (Microsoft Intune & Entra ID)

## 📌 Présentation
Mise en place d'une infrastructure Zero Trust et de gestion des postes de travail (Windows 11) via Microsoft Intune et Entra ID.

## 🛠️ Configurations réalisées

### 1. Identity & Enrollment
* Configuration de l'enrôlement automatique Intune.
* Jonction native Microsoft Entra ID (Entra ID Joined).
* Personnalisation de la Page d'état de la préparation (ESP).

### 2. Securité & Zero Trust
* **Stratégies de Conformité :** Exigence de BitLocker, Secure Boot, Defender et Pare-feu.
* **Accès Conditionnel :** Blocage des accès M365 si l'appareil est non conforme.
* **Settings Catalog :** Blocage des clés USB et des comptes OneDrive personnels.

### 3. Application Management
* Déploiement de Microsoft 365 Apps.
* Packaging et déploiement d'une application Win32 sur mesure avec script PowerShell de détection.

### 4. Updates Management
* Configuration des anneaux de mise à jour (Windows Update Rings) pour Windows 11.
