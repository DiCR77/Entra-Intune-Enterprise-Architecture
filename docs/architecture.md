# 🏗️ Architecture Technique M365 & Zero Trust

## 📌 Modèle d'Architecture Cloud-Native
L'infrastucture repose sur un modèle 100 % Cloud (sans Active Directory On-Premises) axé sur la sécurité **Zero Trust** ("Never Trust, Always Verify").

## 🔄 Flux de Gestion et d'Enrôlement
1. **Identité (Entra ID) :** Provisioning des comptes utilisateurs et attribution des licences M365 E5.
2. **Ciblage (Dynamic Groups) :** Attribution automatique des appareils selon les attributs (`department`, `userType`).
3. **Provisioning (Windows Autopilot) :**
   * Enrôlement OOBE via la jonction native Entra ID.
   * Blocage de la session utilisateur via l'ESP jusqu'à l'application complète des stratégies et applications critiques.
4. **Sécurisation (Intune & Conditional Access) :**
   * Évaluation continue de la conformité (BitLocker, Defender, Secure Boot).
   * L'accès aux applications M365 est conditionné à l'état `Compliant` de l'appareil.
