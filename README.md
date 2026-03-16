# Projet : Système de Gestion de tournoi de tennis

---

## 1. Démarche et Conception (Étape 1)

### Prompt Final utilisé

>Tu travailles dans le domaine de l’organisation de compétitions de tennis internationales. Ton organisation a comme activité de gérer intégralement le cycle de vie d'un tournoi professionnel, incluant la planification des matchs sur les courts, la vente de billets au public, le calcul des points pour le classement mondial, l'affectation du staff technique (arbitres, ramasseurs) et la gestion des créneaux d'entraînement des joueurs. C’est une organisation comme l’ATP (Association of Tennis Professionals), la WTA ou la Fédération Française de Tennis (FFT). Les données collectées concernent l'identité des joueurs et du staff, les caractéristiques physiques des infrastructures, les détails des transactions de billetterie, les feuilles de match et les journaux d'accès aux terrains d'entraînement. Inspire-toi des sites web officiels de l'ATP Tour (atptour.com) pour la structure des classements et du guide d'arbitrage de l'ITF (itftennis.com) suivant : Règlements officiels de l'arbitrage et du classement technique.<br>
>Ton organisation veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.<br>
>D’abord, établis les règles de gestions des données de ton organisation, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information.<br>
>Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.<br>
>Fournis donc les règles de gestion et le dictionnaire de données.



### Règles Métier Obtenues

*Voici les règles de gestion générées par l'IAG Gémini 3 :*

1. Identité et Staff : Chaque joueur et membre du staff technique (arbitre, ramasseur) possède un identifiant unique, un nom, un prénom, une nationalité et une date de naissance.

2. Classement Mondial : Un joueur possède un nombre de points total et un rang mondial qui évoluent après chaque tournoi.

3. Infrastructures : Un tournoi se déroule sur plusieurs courts. Chaque court a un nom (ex: "Philippe Chatrier"), une capacité de spectateurs et une surface spécifique (Terre battue, Gazon, Dur).

4. Planification des Matchs : Un match oppose soit deux joueurs (Simple), soit deux paires (Double). Il est programmé sur un court précis à une date et une heure données.

5. Arbitrage : Un match est supervisé par un arbitre de chaise principal. Un arbitre possède une certification (Bronze, Silver, Gold Badge).

6. Résultats : Pour chaque match, on enregistre le score par set (ex: 6-4, 3-6, 7-5) et la durée totale de la rencontre.

7. Billetterie : Un billet est vendu pour un court spécifique et une date précise. Il comporte un prix, un numéro de siège et un type de catégorie (Standard, VIP, Loge).

8. Logistique d'entraînement : Les joueurs réservent des créneaux d'entraînement. Un créneau est défini par une heure de début, une heure de fin et un court assigné.

9. Ramasseurs de balles : Une équipe de plusieurs ramasseurs est affectée à chaque match pour assister les joueurs.


### Dictionnaire de Données

| Signification de la donnée | Type | Taille (car.) |
| :--- | :--- | :--- |
| Identifiant unique du joueur | Alphanumérique | 10 |
| Nom du joueur | Texte | 50 |
| Prénom du joueur | Texte | 50 |
| Nationalité (Code ISO) | Texte | 3 |
| Date de naissance | Date | 10 |
| Nombre de points au classement ATP/WTA | Numérique | 6 |
| Rang mondial actuel | Numérique | 4 |
| Identifiant du membre du staff | Alphanumérique | 10 |
| "Rôle du staff (Arbitre, Ramasseur)" | Texte | 20 |
| Niveau de certification de l'arbitre | Texte | 15 |
| Identifiant du court | Alphanumérique | 5 |
| Nom du court | Texte | 30 |
| Type de surface (ex: Terre battue) | Texte | 20 |
| Capacité d'accueil du court | Numérique | 5 |
| Identifiant du match | Alphanumérique | 12 |
| Date du match | Date | 10 |
| Heure de début du match | Heure | 5 |
| Score final du match (format texte) | Texte | 30 |
| Durée du match (en minutes) | Numérique | 3 |
| Identifiant du billet | Alphanumérique | 15 |
| Prix du billet | Numérique (Décimal) | 7 |
| Numéro de siège | Alphanumérique | 5 |
| Catégorie du billet | Texte | 15 |
| Date de validité du billet | Date | 10 |
| Identifiant du créneau d'entraînement | Alphanumérique | 10 |
| Heure de début d'entraînement | Heure | 5 |
| Heure de fin d'entraînement | Heure | 5 |
| Point gagné par le vainqueur du match | Numérique | 4 |
| "Genre du tournoi (Simple Messieurs, Double Dames, etc.)" | Texte | 20 |
| "État du match (Programmé, En cours, Terminé)" | Texte | 15 |

---

## 2. Modélisation (Étape 2 et Étape 3)

### Modèle Conceptuel des Données (MCD)

![MCD du Mini-Projet](./mini-projet-tennis.png)

*Le fichier source au format '.loo' est disponible dans le dépôt : [Voir le fichier source](./Looping_Mini-Projet.loo)*

### Modèle Logique des Données (MLD)

```sql

Pays = (Id_Pays_ISO CHAR(2), Nom_Pays VARCHAR(50));
Staff = (Id_Staff VARCHAR(10), Nom_Staff VARCHAR(50), Prenom_Staff VARCHAR(50), Role_Staff VARCHAR(20));
Entrainement = (Id_Entrainement VARCHAR(10), Date_Entrainement DATE, Debut_Créneau TIME, Fin_Créneau TIME);
Arbitre = (Id_Arbitre VARCHAR(10), Certification_Arbitre VARCHAR(15), Date_Naissance DATE, Date_Premier_Match DATE, #Id_Pays_ISO, #Id_Staff);
Ville = (Nom_Ville VARCHAR(50), #Id_Pays_ISO);
Tournoi = (Id_Tournoi VARCHAR(10), Nom_Tournoi VARCHAR(50), Année SMALLINT, Division_Tournoi VARCHAR(20), #Nom_Ville);
Tableau = (Id_Tableau VARCHAR(10), Nombre_Points_Max SMALLINT, Genre_Tableau VARCHAR(3), Nom_Tableau VARCHAR(20), #Id_Tournoi);
Court = (Id_Court VARCHAR(5), Nom_Court VARCHAR(30), Capacité_Court SMALLINT, #NomVille);
Match = (Id_Match VARCHAR(12), Résultat_Match VARCHAR(50), Type_Surface VARCHAR(20), Durée_Match REAL, Heure_Début TIME, #Id_Arbitre);
Joueur = (Id_Joueur VARCHAR(10), Nom_Joueur VARCHAR(50), Prenom_Joueur VARCHAR(50), Points_Classement INT, Date_Naissance DATE, _ClassementMondial SMALLINT, #Id_Match, #Id_Pays_ISO);
Ramasseur = (Id_Ramasseur VARCHAR(10), Nom_Ramasseur VARCHAR(50), Prenom_Ramasseur VARCHAR(50), Date_Naissance DATE, Date_Premier_Match DATE, #Id_Pays_ISO, #Id_Match, #Id_Staff);
Billet = (#Id_Match, Id_Billet VARCHAR(15), Prix_Billet DOUBLE, Numéro_Siège_Billet SMALLINT, Type_Billet VARCHAR(15), Date_Billet DATE);
S_ENTRAINER = (#Id_Joueur, #Id_Court, #Id_Entrainement);
SE_DEROULE = (#Id_Court, #Id_Match);
APPARTENIR = (#Id_Joueur, Points_Gagnés BYTE, #Id_Tableau);
RESULTAT = (#Id_Match, Gagnant VARCHAR(50), Score_Match VARCHAR(30), #Id_Tableau);

```

---

## 3. Scénarios d'utilisation (Étape 4 et Étape 5)

### Directeur Sportif de la Fédération

**Rôle :** Le directeur sportif d'une fédération de tennis professionnelle utilise la base de données pour suivre l'organisation des tournois, analyser les performances des joueurs et préparer les prochaines compétitions.

**Contexte :** En fin de saison, le directeur sportif doit produire un bilan complet des tournois disputés. Il a besoin de savoir quels joueurs ont performé, sur quelles surfaces les matchs ont été les plus longs, quels arbitres ont officié, et quels joueurs ne sont pas encore inscrits dans un tableau pour la prochaine édition.

**Données extraites :**
* **Top 10 :** Liste des joueurs classés dans le top 10 mondial, triés par classement.
* **Grands Chelems :** Liste des tournois de type Grand Chelem.
* **Surfaces :** Matchs joués sur Terre Battue ou Gazon, triés par heure de début.
* **Filtres noms :** Joueurs dont le nom commence par une lettre donnée.
* **Durée :** Matchs dont la durée est comprise entre 1h30 et 2h30.
* **Stats surfaces :** Nombre de matchs joués par surface et durée moyenne par surface.
* **Géographie :** Nombre de joueurs par pays (uniquement les pays avec au moins 3 joueurs).
* **Points :** Points gagnés moyens et totaux par tableau.
* **Localisation :** Matchs avec le nom de l'arbitre et la ville où ils se déroulent.
* **Détails joueurs :** Joueurs avec leur pays et les points gagnés dans leur tableau.
* **Résultats :** Gagnants des matchs avec le tournoi correspondant.
* **Inscriptions :** Tous les joueurs, y compris ceux sans tableau assigné (`LEFT JOIN`).
* **Absences :** Joueurs qui ne participent à aucun tableau (`NOT IN`).
* **Niveau :** Joueurs ayant plus de points que la moyenne générale (sous-requête).
* **Pays hôte :** Matchs disputés dans un court situé en France (`EXISTS`).
* **Records :** Matchs dont la durée dépasse tous les matchs joués sur Gazon (`ALL`).

<br>

### Responsable billetterie  

**Rôle :** Le responsable billetterie d'une organisation de tournois de tennis utilise la base de données pour analyser les ventes de billets, identifier les matchs les plus rentables et optimiser la politique tarifaire pour les prochaines éditions.

**Contexte :** À chaque fin de tournoi, le responsable billetterie doit produire un rapport financier. Il analyse les recettes par tournoi, par mois, et par type de billet. Il identifie les matchs qui ont généré le plus de revenus et ceux pour lesquels aucun billet n'a été vendu, afin d'adapter la stratégie commerciale.

**Données extraites :**
* **Bilan financier :** Recettes totales, nombre de billets vendus et prix moyen par tournoi.
* **Rentabilité :** Top 5 des matchs les plus rentables.
* **Saisonnalité :** Billets vendus et recettes par mois sur l'année 2023.
* **Optimisation :** Courts les plus rentables via les matchs qu'ils ont accueillis.
* **Audit :** Matchs pour lesquels aucun billet n'a été vendu (`NOT EXISTS`).

---

## Contenu du Répertoire

### Scripts SQL
* **1_création.sql** : Script de création de la structure des tables.
* **2_contraintes.sql** : Définition des clés étrangères et contraintes d'intégrité.
* **3_insertion.sql** : Jeu de données de test.
* **4_interrogation.sql** : Requêtes correspondant aux scénarios d'utilisation.
* **5_test_vidéo.sql** : Scripts spécifiques pour la démonstration.
* **structure.sql** : Vue d'ensemble de la base de données.

### Modélisation et Conception
* **mini-projet-tennis.png** (ou **MCD_Mini-Projet.png**) : Image du Modèle Conceptuel des Données.
* **mini-projet-tennis.loo** : Fichier source Looping.
* **Prompt_Conception_Base.docx** : Document détaillant la phase de réflexion initiale.
* **Prompt_insertion_base.docx** : Instructions utilisées pour la génération des données.

### Configuration
* **.gitignore** : Fichiers à exclure du versionnage Git.
* **README.md** : Documentation générale du projet.
