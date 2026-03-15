USE mini_projet_groupe11;

ALTER TABLE Entrainement
ADD CONSTRAINT date_valide 
CHECK ( Fin_Créneau > Debut_Créneau );

ALTER TABLE Arbitre
ADD CONSTRAINT cohérence_date
CHECK (Date_naissance < Date_premier_match );

ALTER TABLE Tableau
ADD CONSTRAINT genre_tableau
CHECK (Genre_tableau IN ('SMO', 'SDA', 'DMO', 'DDA', 'SMI', 'DMI'));

ALTER TABLE Match_
ADD CONSTRAINT résultat
CHECK (Résultat_Match REGEXP '^[0-7]-[0-7](, [0-7]-[0-7]){1,4}$');

ALTER TABLE Match_
ADD CONSTRAINT sol_terrain
CHECK (Type_surface IN ('Terre Battue', 'Gazon','Dur','Moquette','Parquet','Synthétique'));

ALTER TABLE Ramasseur
ADD CONSTRAINT date_cohérente
CHECK (Date_naissance < Date_premier_match );

ALTER TABLE Billet
ADD CONSTRAINT numéro_valide
CHECK ( Numéro_Siège_billet > 0);

ALTER TABLE RESULTAT
ADD CONSTRAINT résultats
CHECK (Score_Match REGEXP '^[0-7]-[0-7](, [0-7]-[0-7]){1,4}$');

 