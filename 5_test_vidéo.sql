USE mini_projet_groupe11;

SELECT * FROM joueur LIMIT 10;

SELECT * FROM Match_;

SELECT * FROM Billet LIMIT 10;

INSERT INTO Match_ VALUES ('MA999', '6-3, 6-4', 'Sable', 1.5, '10:00:00', 'AR001');

INSERT INTO Match_ VALUES ('MA999', '15-3, 6-4', 'Gazon', 1.5, '10:00:00', 'AR001');

INSERT INTO Joueur VALUES ('JO999', 'Test', 'Test', 1000, '1990-01-01', 50, NULL, NULL);

DELETE FROM Pays WHERE Id_Pays_ISO = 'FR';


SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, 
       _Classement_Mondial_, Points_Classement
FROM Joueur
WHERE _Classement_Mondial_ <= 10
ORDER BY _Classement_Mondial_ ASC;


SELECT Type_Surface,
       COUNT(*) AS Nombre_Matchs,
       ROUND(AVG(Durée_Match), 2) AS Durée_Moyenne
FROM Match_
GROUP BY Type_Surface
ORDER BY Nombre_Matchs DESC;


SELECT M.Id_Match, M.Type_Surface, M.Heure_Début,
       S.Nom_Staff AS Nom_Arbitre, S.Prenom_Staff AS Prenom_Arbitre,
       C.Nom_Court, V.Nom_Ville
FROM Match_ M
JOIN Arbitre A ON M.Id_Arbitre = A.Id_Arbitre
JOIN Staff S ON A.Id_Staff = S.Id_Staff
JOIN SE_DEROULE SD ON M.Id_Match = SD.Id_Match
JOIN Court C ON SD.Id_Court = C.Id_Court
JOIN Ville V ON C.Nom_Ville = V.Nom_Ville
ORDER BY V.Nom_Ville;


SELECT J.Id_Joueur, J.Nom_Joueur, J.Prenom_Joueur,
       J._Classement_Mondial_, AP.Id_Tableau, AP.Points_Gagnés
FROM Joueur J
LEFT JOIN APPARTENIR AP ON J.Id_Joueur = AP.Id_Joueur
ORDER BY J._Classement_Mondial_ ASC;


SELECT Id_Joueur, Nom_Joueur, Prenom_Joueur, _Classement_Mondial_
FROM Joueur
WHERE Id_Joueur NOT IN (
    SELECT Id_Joueur FROM APPARTENIR
)
ORDER BY _Classement_Mondial_ ASC;


SELECT M.Id_Match, M.Type_Surface, M.Durée_Match
FROM Match_ M
WHERE EXISTS (
    SELECT 1
    FROM SE_DEROULE SD
    JOIN Court C ON SD.Id_Court = C.Id_Court
    JOIN Ville V ON C.Nom_Ville = V.Nom_Ville
    WHERE SD.Id_Match = M.Id_Match
    AND V.Id_Pays_ISO = 'FR'
);


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

