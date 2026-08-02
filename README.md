# 🌐 Entra-Intune-Enterprise-Architecture : Lab de Déploiement Modern Workplace & Zéro Trust

## 📌 Présentation du Projet
Ce projet documente la conception et le déploiement complet d'une architecture **Microsoft 365 / Entra ID / Intune** pour une entreprise moderne. 
L'objectif est de gérer, sécuriser et automatiser le cycle de vie complet des postes de travail Windows 11 selon les exigences de sécurité **Zéro Trust** et les standards de l'examen **Microsoft MD-102 (Endpoint Administrator)**.

---

## 🏗️ Architecture & Flux de Gestion

[Création Tenant M365]
│
├──> [Identité Entra ID] ──> Utilisateurs & Groupes Dynamiques
│
├──> [Provisioning] ────────> Windows Autopilot + ESP
│
├──> [Zéro Trust] ──────────> Stratégie de Conformité + Accès Conditionnel
│
├──> [Applications] ────────> Microsoft 365 Apps + Packaging Win32 (PowerShell)
│
└──> [Maintenance] ─────────> Windows Update Rings (WUfB)


---

## 🛠️ Étapes de Mise en Œuvre & Configurations Réalisées

### 1. Initialisation de l'Infrastructure Cloud & Identité (Microsoft Entra ID)
* **Création du Tenant M365 :** Configuration initiale du locataire cloud et attribution des licences **Microsoft 365 E5**.
* **Gestion des Identités :**
  * Création d'utilisateurs de test et d'administration.
  * Mise en place de **Groupes Dynamiques** (`Diae_Groupe`) basés sur des règles d'appartenance d'attributs utilisateurs (ex : département, poste) afin d'automatiser le ciblage des stratégies.

---

### 2. Provisioning & Enrôlement Automatisé (Windows Autopilot)
* **Configuration de la Page d'état de la préparation (ESP - Enrollment Status Page) :**
  * Blocage de l'accès au bureau Windows tant que les applications critiques et les profils de sécurité ne sont pas installés.
  * Activation des options de dépannage et de réinitialisation pour l'utilisateur.
* **Profil de Déploiement Autopilot (`AP_WIN11_UserDriven`) :**
  * Mode de déploiement : **Piloté par l'utilisateur (User-Driven)**.
  * Jonction native : **Microsoft Entra ID Join**.
  * Masquage automatique des écrans EULA et des paramètres de confidentialité (OOBE optimisé).
  * Attribution des comptes en droits **Standard** pour respecter le principe de moindre privilège.

---

### 3. Architecture Zéro Trust : Conformité & Accès Conditionnel
* **Stratégie de Conformité Windows 11 (`COMP_WIN11_ExigenceSecurite`) :**
  * **Sécurité du système :** Exigence d'activation du chiffrement **BitLocker**, du **Pare-feu Windows** et de l'antivirus **Microsoft Defender**.
  * **Santé de l'appareil (Device Health) :** Exigence du **Démarrage sécurisé (Secure Boot)**.
* **Accès Conditionnel Entra ID (`CA_WIN11_ExigerAppareilConforme`) :**
  * Règle Zéro Trust ciblant les applications cloud Microsoft 365.
  * **Condition d'accès :** Blocage de l'accès aux données d'entreprise si l'appareil n'est pas évalué et marqué comme **Conforme** dans Microsoft Intune.

---

### 4. Sécurité du Poste de Travail (Settings Catalog)
* **Profil de Configuration Administrative :**
  * Durcissement du système via le catalogue de paramètres Intune.
  * **Restrictions appliquées :** Restriction d'accès aux supports amovibles (clés USB) et interdiction de synchronisation de comptes cloud personnels (OneDrive personnel bloqué sur le poste d'entreprise).

---

### 5. Gestion & Déploiement d'Applications (MAM / MDM)
* **Microsoft 365 Apps for Enterprise :**
  * Déploiement automatisé de la suite Office (Word, Excel, Teams, Outlook) via le moteur de configuration Office de Microsoft Intune.
* **Application Métier Win32 Custom (`FPSBoostPro`) :**
  * Packaging de l'application avec l'outil **Microsoft Win32 Content Prep Tool** (`.intunewin`).
  * **Script de détection personnalisé en PowerShell :** Écriture d'un script `.ps1` permettant à Intune de vérifier de manière dynamique la présence, la version et l'intégrité de l'application installée sur le poste client.

---

### 6. Gestion du Cycle de Vie & Patch Management (Update Rings)
* **Stratégie Windows Update for Business (`UPD_WIN11_AnneauTest`) :**
  * **Mises à jour qualité (Sécurité) :** Période de report définie à **0 jour** pour une application immédiate des correctifs critiques.
  * **Mises à jour de fonctionnalités (Feature Updates) :** Période de report définie à **2 jours** pour valider la stabilité.
  * **Expérience utilisateur :** Installation automatique pendant les heures de maintenance, sans possibilité pour l'utilisateur de mettre en pause ou de désactiver Windows Update.

---

## 🧪 Validation & Preuve de Concept (PoC)
Le déploiement a été validé sur des machines virtuelles **Windows 11 Professionnel/Entreprise** :
1. **Jonction Entra ID Join :** Authentification de l'utilisateur sur la mire Windows sans intervention IT.
2. **Synchronisation MDM :** Application silencieuse des restrictions de sécurité, d'Autopilot et de l'ESP.
3. **Audit Intune :** Appareil validé avec le statut **Conforme (Compliant)** dans le centre d'administration Microsoft Intune, autorisant l'accès aux ressources M365.

---

## 📁 Structure du Dépôt

```text
├── docs/
│   ├── autopilot-esp-progress.png       # Capture de la page ESP
│   ├── intune-device-compliant.png      # Capture du PC conforme dans Intune
│   └── conditional-access-rule.png      # Capture de la règle d'accès conditionnel
├── scripts/
│   └── Detect-FPSBoostPro.ps1           # Script PowerShell de détection Win32
└── README.md                            # Documentation complète de l'architecture

---
