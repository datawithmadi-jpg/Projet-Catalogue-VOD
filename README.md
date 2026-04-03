# 🎬 Catalogue VOD — Scripts SQL

Projet fil rouge de la série **SQL Débutant** par [Madi CONDÉ](https://github.com/[ton-username])

Scripts SQL pour la création d'un système de location de DVD sous **Microsoft SQL Server**.

---

## 📁 Contenu du repository

```
CatalogueVOD_SQL/
│
└── 01_creation_tables_catalogue_vod.sql   ← Script de création des tables
```

---

## ▶️ Ordre d'exécution

### Étape 1 — Se connecter à master

```sql
USE master;
```

### Étape 2 — Créer la base de données

```sql
CREATE DATABASE catalogue_vod_final;
```

### Étape 3 — Se connecter à la nouvelle base

```sql
USE catalogue_vod_final;
```

### Étape 4 — Exécuter le script complet

Sélectionner le reste : de la table genre_film jusqu'à la fin  et exécuter.

Le script crée les 7 tables + insertion dans le bon ordre :

| Ordre | Table | Dépendances |
|-------|-------|-------------|
| 1 | `genres_film` | aucune (parent) |
| 2 | `realisateurs` | aucune (parent) |
| 3 | `dvd` | genres_film · realisateurs |
| 4 | `types_location` | aucune (parent) |
| 5 | `clients` | aucune (parent) |
| 6 | `factures` | clients |
| 7 | `locations` | factures · dvd · types_location |

---

## ⚙️ Prérequis

- Microsoft SQL Server (toute version récente)
- SQL Server Management Studio (SSMS)

---

## 📺 Série YouTube / TikTok

Ce projet est le fil rouge de la série **SQL Débutant** sur Amescript.

| Short | Sujet |
|-------|-------|
| Short A | Présentation du projet + modèle de données |
| Short B | Création des tables 1 à 4 |
| Short C | Création des tables clients et factures |
| Short D | Création de la table locations + GitHub Portfolio |

👉 Retrouvez tous les Shorts sur [TikTok](https://www.tiktok.com/@amescript?_r=1&_t=ZN-92xDkswUdZG) · [YouTube](https://youtube.com/@ame.script?si=uf8Vm8hx21DMsLSw)

---

## 👤 Auteur

**Madi CONDÉ — AmeScript**
Contenu data · SQL · Power BI · Business Intelligence


---

*Script créé dans le cadre de la série SQL Débutant — Madi CONDÉ*
