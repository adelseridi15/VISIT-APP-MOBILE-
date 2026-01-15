<<<<<<< HEAD
# Visit - Guide Touristique Algérien

Application mobile ultra-moderne pour découvrir les régions algériennes, leur patrimoine et leur gastronomie.

## Configuration Supabase

### 1. Créer un projet Supabase
- Allez sur [supabase.com](https://supabase.com) et créez un compte
- Créez un nouveau projet

### 2. Appliquer les migrations
Les migrations SQL contiennent :
- Table `regions` avec 6 régions algériennes
- Table `heritage_sites` avec sites patrimoniaux
- Table `gastronomy` avec spécialités culinaires
- Table `favorites` pour la gestion des favoris
- Table `user_profiles` pour les profils utilisateur
- Configuration d'authentification email/password

### 3. Récupérer les identifiants Supabase
- Allez dans Project Settings > API
- Copiez `Project URL` et `anon/public key`

### 4. Configurer les variables d'environnement
Créez un fichier `.env` à la racine du projet :
```
EXPO_PUBLIC_SUPABASE_URL=votre_url_supabase
EXPO_PUBLIC_SUPABASE_ANON_KEY=votre_anon_key
```

## Installation

```bash
npm install
```

## Lancement

```bash
npm run dev
```

## Fonctionnalités

### Authentification
- Inscription avec email et password
- Connexion sécurisée
- Gestion des profils utilisateur
- Déconnexion

### Navigation
- **Menu Drawer** - Accédez facilement à tous les écrans
- **Onglets** - Accueil, Explorer, Favoris
- **Détails des régions** - Pages détaillées par région

### Contenu
- Découverte des 6 régions algériennes
- Patrimoine culturel et historique
- Gastronomie traditionnelle avec ingrédients
- Système de favoris personnalisés

### Écrans
- **Login/Register** - Authentification
- **Accueil** - Présentation des régions
- **Explorer** - Navigation par Patrimoine/Gastronomie
- **Favoris** - Gestion personnelle des découvertes
- **Mon Profil** - Informations utilisateur
- **Paramètres** - Préférences et confidentialité
- **À propos** - Informations et contacts

### Design
- Interface ultra-moderne avec gradients verts
- Typographie audacieuse et lisible
- Animations fluides et microinteractions
- Responsive sur tous les appareils
- Support bilingue (Français/Arabe)
=======
# VISIT-APP-MOBILE-
>>>>>>> 6108a7ce34cd2afc932dc5b6c4a8d9b287e14062
