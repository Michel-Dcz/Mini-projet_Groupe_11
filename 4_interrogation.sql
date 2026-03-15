USE mini_projet_groupe11;

-- SCÉNARIO 1 : Directeur Sportif du Tournoi
-- Rôle : Le directeur sportif de la fédération de tennis
--        consulte la BD pour analyser les performances des
--        joueurs, l'organisation des matchs et préparer
--        les prochains tournois.

-- A. PROJECTIONS ET SÉLECTIONS

-- Liste de tous les joueurs classés dans le top 10 mondial,
-- triés par classement croissant
SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, _Classement_Mondial_, Points_Classement
FROM Joueur
WHERE _Classement_Mondial_ <= 10
ORDER BY _Classement_Mondial_ ASC;

-- Liste des tournois de type Grand Chelem uniquement
SELECT Id_Tournoi, Nom_Tournoi, Année, Nom_Ville
FROM Tournoi
WHERE Division_Tournoi = 'Grand Chelem'
ORDER BY Année DESC;

-- Liste des matchs joués sur Terre Battue ou Gazon,
-- triés par heure de début
SELECT Id_Match, Résultat_Match, Type_Surface, Durée_Match, Heure_Début
FROM Match_
WHERE Type_Surface IN ('Terre Battue', 'Gazon')
ORDER BY Heure_Début ASC;

-- A4. Joueurs dont le nom commence par la lettre 'S' (masque LIKE)
SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, _Classement_Mondial_
FROM Joueur
WHERE Nom_Joueur LIKE 'S%'
ORDER BY Nom_Joueur ASC;

-- Matchs dont la durée est comprise entre 1.5h et 2.5h (BETWEEN)
SELECT Id_Match, Type_Surface, Durée_Match, Heure_Début
FROM Match_
WHERE Durée_Match BETWEEN 1.5 AND 2.5
ORDER BY Durée_Match ASC;

-- Liste des billets de type VIP ou Premium avec leur prix,
-- triés du plus cher au moins cher
SELECT Id_Billet, Id_Match, Type_Billet, Prix_Billet, Numéro_Siège_Billet
FROM Billet
WHERE Type_Billet IN ('VIP', 'Premium')
ORDER BY Prix_Billet DESC;

-- Classements mondiaux uniques présents dans la base (DISTINCT)
SELECT DISTINCT _Classement_Mondial_
FROM Joueur
ORDER BY _Classement_Mondial_ ASC;

-- Arbitres certifiés 'Or', triés par date de premier match
SELECT Id_Arbitre, Certification_Arbitre, Date_Naissance, Date_Premier_Match
FROM Arbitre
WHERE Certification_Arbitre = 'Or'
ORDER BY Date_Premier_Match ASC;

-- Joueurs avec des points de classement entre 3000 et 7000
SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, Points_Classement, _Classement_Mondial_
FROM Joueur
WHERE Points_Classement BETWEEN 3000 AND 7000
ORDER BY Points_Classement DESC;

-- Billets vendus entre janvier et juin 2023
SELECT Id_Billet, Id_Match, Prix_Billet, Type_Billet, Date_Billet
FROM Billet
WHERE Date_Billet BETWEEN '2023-01-01' AND '2023-06-30'
ORDER BY Date_Billet ASC;

-- B. FONCTIONS D'AGRÉGATION, GROUP BY, HAVING

-- Nombre de matchs joués par type de surface
SELECT Type_Surface, COUNT(*) AS Nombre_Matchs
FROM Match_
GROUP BY Type_Surface
ORDER BY Nombre_Matchs DESC;

-- Durée moyenne, minimale et maximale des matchs par surface
SELECT Type_Surface,
       ROUND(AVG(Durée_Match), 2) AS Durée_Moyenne,
       MIN(Durée_Match) AS Durée_Min,
       MAX(Durée_Match) AS Durée_Max
FROM Match_
GROUP BY Type_Surface;

-- Recettes totales par match (somme des billets vendus),
-- uniquement pour les matchs ayant rapporté plus de 300€
SELECT Id_Match,
       COUNT(Id_Billet) AS Nombre_Billets,
       SUM(Prix_Billet) AS Recette_Totale
FROM Billet
GROUP BY Id_Match
HAVING SUM(Prix_Billet) > 300
ORDER BY Recette_Totale DESC;

-- Nombre de joueurs par pays, uniquement les pays
-- ayant au moins 3 joueurs
SELECT Id_Pays_ISO,
       COUNT(*) AS Nombre_Joueurs
FROM Joueur
GROUP BY Id_Pays_ISO
HAVING COUNT(*) >= 3
ORDER BY Nombre_Joueurs DESC;

-- Points gagnés moyens par tableau
SELECT Id_Tableau,
       ROUND(AVG(Points_Gagnés), 2) AS Points_Moyens,
       SUM(Points_Gagnés) AS Points_Totaux,
       COUNT(Id_Joueur) AS Nombre_Joueurs
FROM APPARTENIR
GROUP BY Id_Tableau
ORDER BY Points_Totaux DESC;

-- Prix moyen des billets par type
SELECT Type_Billet,
       ROUND(AVG(Prix_Billet), 2) AS Prix_Moyen,
       MIN(Prix_Billet) AS Prix_Min,
       MAX(Prix_Billet) AS Prix_Max,
       COUNT(*) AS Nombre_Billets
FROM Billet
GROUP BY Type_Billet;

-- Nombre de tableaux par tournoi
SELECT Id_Tournoi,
       COUNT(*) AS Nombre_Tableaux
FROM Tableau
GROUP BY Id_Tournoi
HAVING COUNT(*) >= 2;

-- Nombre de matchs arbitrés par certification d'arbitre
SELECT A.Certification_Arbitre,
       COUNT(M.Id_Match) AS Nombre_Matchs
FROM Arbitre A
JOIN Match_ M ON A.Id_Arbitre = M.Id_Arbitre
GROUP BY A.Certification_Arbitre
ORDER BY Nombre_Matchs DESC;

-- C. JOINTURES

-- Jointure simple : liste des matchs avec le nom
-- et prénom de l'arbitre qui les dirige
SELECT M.Id_Match, M.Type_Surface, M.Durée_Match, M.Heure_Début,
       S.Nom_Staff AS Nom_Arbitre, S.Prenom_Staff AS Prenom_Arbitre,
       A.Certification_Arbitre
FROM Match_ M
JOIN Arbitre A ON M.Id_Arbitre = A.Id_Arbitre
JOIN Staff S ON A.Id_Staff = S.Id_Staff
ORDER BY M.Id_Match;

-- Jointure multiple : joueurs avec leur pays et
-- les points gagnés dans leur tableau
SELECT J.Id_Joueur, J.Nom_Joueur, J.Prenom_Joueur,
       P.Nom_Pays, J._Classement_Mondial_,
       AP.Points_Gagnés, T.Nom_Tableau
FROM Joueur J
JOIN Pays P ON J.Id_Pays_ISO = P.Id_Pays_ISO
JOIN APPARTENIR AP ON J.Id_Joueur = AP.Id_Joueur
JOIN Tableau T ON AP.Id_Tableau = T.Id_Tableau
ORDER BY J._Classement_Mondial_ ASC;

-- Jointure multiple : matchs avec le court et
-- la ville où ils se déroulent
SELECT M.Id_Match, M.Type_Surface, M.Heure_Début,
       C.Nom_Court, C.Capacité_Court, V.Nom_Ville, P.Nom_Pays
FROM Match_ M
JOIN SE_DEROULE SD ON M.Id_Match = SD.Id_Match
JOIN Court C ON SD.Id_Court = C.Id_Court
JOIN Ville V ON C.Nom_Ville = V.Nom_Ville
JOIN Pays P ON V.Id_Pays_ISO = P.Id_Pays_ISO
ORDER BY V.Nom_Ville;

-- Jointure avec résultats : gagnants des matchs
-- avec le tournoi correspondant
SELECT R.Id_Match, R.Gagnant, R.Score_Match,
       T.Nom_Tableau, TO_.Nom_Tournoi, TO_.Année
FROM RESULTAT R
JOIN Tableau T ON R.Id_Tableau = T.Id_Tableau
JOIN Tournoi TO_ ON T.Id_Tournoi = TO_.Id_Tournoi
ORDER BY TO_.Nom_Tournoi;

-- Jointure externe gauche : tous les joueurs,
-- même ceux sans tableau assigné
SELECT J.Id_Joueur, J.Nom_Joueur, J.Prenom_Joueur,
       J._Classement_Mondial_, AP.Id_Tableau, AP.Points_Gagnés
FROM Joueur J
LEFT JOIN APPARTENIR AP ON J.Id_Joueur = AP.Id_Joueur
ORDER BY J._Classement_Mondial_ ASC;

-- Jointure multiple : entraînements des joueurs
-- avec le court et la ville d'entraînement
SELECT J.Nom_Joueur, J.Prenom_Joueur,
       E.Date_Entrainement, E.Debut_Créneau, E.Fin_Créneau,
       C.Nom_Court, V.Nom_Ville
FROM Joueur J
JOIN S_ENTRAINER SE ON J.Id_Joueur = SE.Id_Joueur
JOIN Entrainement E ON SE.Id_Entrainement = E.Id_Entrainement
JOIN Court C ON SE.Id_Court = C.Id_Court
JOIN Ville V ON C.Nom_Ville = V.Nom_Ville
ORDER BY E.Date_Entrainement;

-- Jointure externe : tous les courts avec leurs matchs
-- (y compris les courts sans match)
SELECT C.Id_Court, C.Nom_Court, C.Capacité_Court,
       SD.Id_Match, M.Type_Surface
FROM Court C
LEFT JOIN SE_DEROULE SD ON C.Id_Court = SD.Id_Court
LEFT JOIN Match_ M ON SD.Id_Match = M.Id_Match
ORDER BY C.Id_Court;

-- D. REQUÊTES IMBRIQUÉES

-- Joueurs qui ont participé à au moins un tableau
-- (IN avec sous-requête)
SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, _Classement_Mondial_
FROM Joueur
WHERE Id_Joueur IN (
    SELECT Id_Joueur FROM APPARTENIR
)
ORDER BY _Classement_Mondial_ ASC;

-- Joueurs qui n'ont participé à aucun tableau
-- (NOT IN avec sous-requête)
SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, _Classement_Mondial_
FROM Joueur
WHERE Id_Joueur NOT IN (
    SELECT Id_Joueur FROM APPARTENIR
)
ORDER BY _Classement_Mondial_ ASC;

-- Matchs qui se sont déroulés dans un court
-- situé en France (EXISTS)
SELECT M.Id_Match, M.Type_Surface, M.Durée_Match, M.Heure_Début
FROM Match_ M
WHERE EXISTS (
    SELECT 1
    FROM SE_DEROULE SD
    JOIN Court C ON SD.Id_Court = C.Id_Court
    JOIN Ville V ON C.Nom_Ville = V.Nom_Ville
    WHERE SD.Id_Match = M.Id_Match
    AND V.Id_Pays_ISO = 'FR'
);

-- Joueurs ayant plus de points que la moyenne
-- de tous les joueurs (ALL / sous-requête scalaire)
SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, Points_Classement
FROM Joueur
WHERE Points_Classement > (
    SELECT AVG(Points_Classement) FROM Joueur
)
ORDER BY Points_Classement DESC;

-- Tournois qui ont au moins un tableau de type 'SMO'
-- (IN avec sous-requête)
SELECT Id_Tournoi, Nom_Tournoi, Année, Division_Tournoi
FROM Tournoi
WHERE Id_Tournoi IN (
    SELECT Id_Tournoi
    FROM Tableau
    WHERE Genre_Tableau = 'SMO'
);

-- Matchs dont la durée est supérieure à tous
-- les matchs sur Gazon (ALL)
SELECT Id_Match, Type_Surface, Durée_Match
FROM Match_
WHERE Durée_Match > ALL (
    SELECT Durée_Match
    FROM Match_
    WHERE Type_Surface = 'Gazon'
);

-- Courts qui ont accueilli au moins un match
-- (EXISTS)
SELECT C.Id_Court, C.Nom_Court, C.Capacité_Court, C.Nom_Ville
FROM Court C
WHERE EXISTS (
    SELECT 1 FROM SE_DEROULE SD
    WHERE SD.Id_Court = C.Id_Court
);

-- Joueurs dont les points sont supérieurs à au moins
-- un joueur espagnol (ANY)
SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, Points_Classement
FROM Joueur
WHERE Points_Classement > ANY (
    SELECT Points_Classement
    FROM Joueur
    WHERE Id_Pays_ISO = 'ES'
)
AND Id_Pays_ISO != 'ES'
ORDER BY Points_Classement DESC;

-- SCÉNARIO 2 : Responsable Billetterie
-- Rôle : Le responsable billetterie analyse les ventes
--        pour optimiser les prix et maximiser les recettes
--        des prochains tournois.

-- Recette totale et nombre de billets vendus par tournoi
SELECT TO_.Nom_Tournoi, TO_.Année,
       COUNT(B.Id_Billet) AS Billets_Vendus,
       SUM(B.Prix_Billet) AS Recette_Totale,
       ROUND(AVG(B.Prix_Billet), 2) AS Prix_Moyen
FROM Billet B
JOIN Match_ M ON B.Id_Match = M.Id_Match
JOIN RESULTAT R ON M.Id_Match = R.Id_Match
JOIN Tableau T ON R.Id_Tableau = T.Id_Tableau
JOIN Tournoi TO_ ON T.Id_Tournoi = TO_.Id_Tournoi
GROUP BY TO_.Nom_Tournoi, TO_.Année
ORDER BY Recette_Totale DESC;

-- Matchs les plus rentables (top 5)
SELECT B.Id_Match,
       COUNT(B.Id_Billet) AS Nombre_Billets,
       SUM(B.Prix_Billet) AS Recette,
       M.Type_Surface
FROM Billet B
JOIN Match_ M ON B.Id_Match = M.Id_Match
GROUP BY B.Id_Match, M.Type_Surface
ORDER BY Recette DESC
LIMIT 5;

-- Billets vendus par mois en 2023
SELECT MONTH(Date_Billet) AS Mois,
       COUNT(*) AS Nombre_Billets,
       SUM(Prix_Billet) AS Recette_Mensuelle
FROM Billet
WHERE YEAR(Date_Billet) = 2023
GROUP BY MONTH(Date_Billet)
ORDER BY Mois;

-- Courts les plus rentables via leurs matchs
SELECT C.Nom_Court, C.Capacité_Court, V.Nom_Ville,
       SUM(B.Prix_Billet) AS Recette_Totale
FROM Court C
JOIN SE_DEROULE SD ON C.Id_Court = SD.Id_Court
JOIN Billet B ON SD.Id_Match = B.Id_Match
JOIN Ville V ON C.Nom_Ville = V.Nom_Ville
GROUP BY C.Nom_Court, C.Capacité_Court, V.Nom_Ville
ORDER BY Recette_Totale DESC;

-- Matchs sans aucun billet vendu (NOT EXISTS)
SELECT M.Id_Match, M.Type_Surface, M.Heure_Début
FROM Match_ M
WHERE NOT EXISTS (
    SELECT 1 FROM Billet B
    WHERE B.Id_Match = M.Id_Match
);