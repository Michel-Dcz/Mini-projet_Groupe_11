USE mini_projet_groupe11;

ALTER TABLE Match_ DROP FOREIGN KEY Match__ibfk_1;

ALTER TABLE Match_ DROP INDEX Id_Arbitre;

ALTER TABLE Match_ 
ADD CONSTRAINT fk_match_arbitre 
FOREIGN KEY (Id_Arbitre) REFERENCES Arbitre(Id_Arbitre);

-- Insertion table Pays
INSERT INTO Pays VALUES
('FR', 'France'),
('ES', 'Espagne'),
('CH', 'Suisse'),
('DE', 'Allemagne'),
('GB', 'Grande-Bretagne'),
('AU', 'Australie'),
('US', 'États-Unis'),
('IT', 'Italie'),
('AR', 'Argentine'),
('RS', 'Serbie');

-- Insertion table Staff
INSERT INTO Staff VALUES
('ST001', 'Martin', 'Jean', 'Coordinateur'),
('ST002', 'Dupont', 'Claire', 'Superviseur'),
('ST003', 'Garcia', 'Luis', 'Coordinateur'),
('ST004', 'Müller', 'Hans', 'Superviseur'),
('ST005', 'Smith', 'John', 'Coordinateur'),
('ST006', 'Rossi', 'Marco', 'Superviseur'),
('ST007', 'Fernandez', 'Ana', 'Coordinateur'),
('ST008', 'Bernard', 'Sophie', 'Superviseur'),
('ST009', 'Wilson', 'Tom', 'Coordinateur'),
('ST010', 'Leroy', 'Paul', 'Superviseur'),
('ST011', 'Novak', 'Ivan', 'Coordinateur'),
('ST012', 'Torres', 'Maria', 'Superviseur'),
('ST013', 'Petit', 'Emma', 'Coordinateur'),
('ST014', 'Brown', 'James', 'Superviseur'),
('ST015', 'Bianchi', 'Luca', 'Coordinateur');

-- Insertion table Entrainement
INSERT INTO Entrainement VALUES
('EN001', '2023-01-10', '08:00:00', '10:00:00'),
('EN002', '2023-01-11', '09:00:00', '11:00:00'),
('EN003', '2023-02-05', '07:30:00', '09:30:00'),
('EN004', '2023-02-15', '10:00:00', '12:00:00'),
('EN005', '2023-03-01', '08:00:00', '10:30:00'),
('EN006', '2023-03-10', '14:00:00', '16:00:00'),
('EN007', '2023-04-05', '09:00:00', '11:00:00'),
('EN008', '2023-04-20', '07:00:00', '09:00:00'),
('EN009', '2023-05-03', '10:00:00', '12:30:00'),
('EN010', '2023-05-15', '08:30:00', '10:30:00'),
('EN011', '2023-06-01', '09:00:00', '11:00:00'),
('EN012', '2023-06-12', '14:00:00', '16:30:00'),
('EN013', '2023-07-04', '07:30:00', '09:30:00'),
('EN014', '2023-07-18', '10:00:00', '12:00:00'),
('EN015', '2023-08-02', '08:00:00', '10:00:00'),
('EN016', '2023-08-20', '09:30:00', '11:30:00'),
('EN017', '2023-09-05', '14:00:00', '16:00:00'),
('EN018', '2023-09-18', '08:00:00', '10:00:00'),
('EN019', '2023-10-03', '10:00:00', '12:00:00'),
('EN020', '2023-10-20', '09:00:00', '11:30:00');

-- Insertion table Ville
INSERT INTO Ville VALUES
('Paris', 'FR'),
('Madrid', 'ES'),
('Genève', 'CH'),
('Berlin', 'DE'),
('Londres', 'GB'),
('Melbourne', 'AU'),
('New York', 'US'),
('Rome', 'IT'),
('Buenos Aires', 'AR'),
('Belgrade', 'RS');

-- Insertion table Court
INSERT INTO Court VALUES
('C001', 'Court Philippe Chatrier', 15000, 'Paris'),
('C002', 'Court Suzanne Lenglen', 10000, 'Paris'),
('C003', 'Pista Central Mutua', 12500, 'Madrid'),
('C004', 'Centre Court Wimbledon', 14979, 'Londres'),
('C005', 'Rod Laver Arena', 14820, 'Melbourne'),
('C006', 'Arthur Ashe Stadium', 23771, 'New York'),
('C007', 'Foro Italico Campo Centrale', 10500, 'Rome'),
('C008', 'Court Central Genève', 6000, 'Genève'),
('C009', 'Estadio Buenos Aires', 8000, 'Buenos Aires'),
('C010', 'Novak Arena Belgrade', 7000, 'Belgrade');

-- Insertion table Arbitre
INSERT INTO Arbitre VALUES
('AR001', 'Or', '1975-03-12', '2000-06-01', 'FR', 'ST001'),
('AR002', 'Argent', '1980-07-22', '2005-04-15', 'ES', 'ST002'),
('AR003', 'Or', '1978-11-05', '2003-09-10', 'CH', 'ST003'),
('AR004', 'Bronze', '1985-02-18', '2010-03-20', 'DE', 'ST004'),
('AR005', 'Or', '1972-06-30', '1998-07-14', 'GB', 'ST005'),
('AR006', 'Argent', '1983-09-14', '2008-01-25', 'AU', 'ST006'),
('AR007', 'Bronze', '1990-04-02', '2015-05-30', 'US', 'ST007'),
('AR008', 'Or', '1976-12-19', '2001-11-08', 'IT', 'ST008'),
('AR009', 'Argent', '1982-08-27', '2007-02-17', 'AR', 'ST009'),
('AR010', 'Bronze', '1988-01-15', '2013-06-22', 'RS', 'ST010');

-- Insertion table Tournoi
INSERT INTO Tournoi VALUES
('TO001', 'Roland Garros', 2023, 'Grand Chelem', 'Paris'),
('TO002', 'Mutua Madrid Open', 2023, 'Masters 1000', 'Madrid'),
('TO003', 'Wimbledon', 2023, 'Grand Chelem', 'Londres'),
('TO004', 'Open dAustralie', 2024, 'Grand Chelem', 'Melbourne'),
('TO005', 'US Open', 2023, 'Grand Chelem', 'New York');

-- Insertion table Tableau
INSERT INTO Tableau VALUES
('TB001', 2000, 'SMO', 'Simple Homme', 'TO001'),
('TB002', 1300, 'SDA', 'Simple Dame', 'TO001'),
('TB003', 1000, 'SMO', 'Simple Homme', 'TO002'),
('TB004', 1000, 'SDA', 'Simple Dame', 'TO002'),
('TB005', 2000, 'SMO', 'Simple Homme', 'TO003'),
('TB006', 2000, 'SDA', 'Simple Dame', 'TO003'),
('TB007', 2000, 'SMO', 'Simple Homme', 'TO004'),
('TB008', 2000, 'SDA', 'Simple Dame', 'TO004'),
('TB009', 2000, 'SMO', 'Simple Homme', 'TO005'),
('TB010', 2000, 'SDA', 'Simple Dame', 'TO005');

-- Insertion table Match_
INSERT INTO Match_ VALUES
('MA001', '6-3, 6-4', 'Terre Battue', 1.5, '11:00:00', 'AR001'),
('MA002', '7-5, 6-3', 'Terre Battue', 1.75, '13:00:00', 'AR002'),
('MA003', '6-4, 3-6, 7-6', 'Terre Battue', 2.5, '15:00:00', 'AR003'),
('MA004', '6-1, 6-2', 'Terre Battue', 1.2, '10:00:00', 'AR004'),
('MA005', '6-7, 7-6, 6-4', 'Gazon', 2.75, '12:00:00', 'AR005'),
('MA006', '6-3, 7-5', 'Gazon', 1.8, '14:00:00', 'AR006'),
('MA007', '7-6, 6-4', 'Gazon', 2.0, '16:00:00', 'AR007'),
('MA008', '6-2, 6-3', 'Gazon', 1.3, '11:30:00', 'AR008'),
('MA009', '6-4, 6-4', 'Dur', 1.6, '10:30:00', 'AR009'),
('MA010', '7-5, 7-6', 'Dur', 2.1, '13:30:00', 'AR010'),
('MA011', '6-3, 6-2', 'Dur', 1.4, '09:00:00', 'AR001'),
('MA012', '6-4, 4-6, 6-3', 'Dur', 2.3, '11:00:00', 'AR002'),
('MA013', '6-1, 6-3', 'Terre Battue', 1.2, '14:00:00', 'AR003'),
('MA014', '7-6, 6-7, 6-4', 'Gazon', 2.9, '16:30:00', 'AR004'),
('MA015', '6-3, 6-4', 'Dur', 1.7, '10:00:00', 'AR005'),
('MA016', '6-2, 7-5', 'Synthétique', 1.9, '12:00:00', 'AR006'),
('MA017', '7-5, 6-3', 'Synthétique', 1.8, '14:30:00', 'AR007'),
('MA018', '6-4, 6-2', 'Dur', 1.5, '09:30:00', 'AR008'),
('MA019', '6-3, 6-1', 'Terre Battue', 1.3, '11:00:00', 'AR009'),
('MA020', '6-4, 7-5', 'Gazon', 1.95, '15:00:00', 'AR010');

-- Insertion table Joueur
INSERT INTO Joueur VALUES
('JO001', 'Djokovic', 'Novak', 9800, '1987-05-22', 1, 'RS', NULL),
('JO002', 'Alcaraz', 'Carlos', 8500, '2003-05-05', 2, 'ES', NULL),
('JO003', 'Medvedev', 'Daniil', 7200, '1996-02-11', 3, 'RS', NULL),
('JO004', 'Zverev', 'Alexander', 6800, '1997-04-20', 4, 'DE', NULL),
('JO005', 'Rune', 'Holger', 4500, '2003-04-29', 5, 'FR', NULL),
('JO006', 'Tsitsipas', 'Stefanos', 5200, '1998-08-12', 6, 'IT', NULL),
('JO007', 'Ruud', 'Casper', 4800, '1998-12-27', 7, 'FR', NULL),
('JO008', 'Hurkacz', 'Hubert', 3900, '1997-02-11', 8, 'DE', NULL),
('JO009', 'Fritz', 'Taylor', 3500, '1997-10-28', 9, 'US', NULL),
('JO010', 'Paul', 'Tommy', 3200, '1997-05-17', 10, 'US', NULL),
('JO011', 'Swiatek', 'Iga', 9500, '2001-05-31', 1, 'FR', NULL),
('JO012', 'Sabalenka', 'Aryna', 8200, '1998-05-05', 2, 'RS', NULL),
('JO013', 'Gauff', 'Coco', 7100, '2004-03-13', 3, 'US', NULL),
('JO014', 'Rybakina', 'Elena', 6500, '1999-06-17', 4, 'GB', NULL),
('JO015', 'Pegula', 'Jessica', 5800, '1994-02-24', 5, 'US', NULL),
('JO016', 'Sakkari', 'Maria', 4600, '1995-07-26', 6, 'IT', NULL),
('JO017', 'Kasatkina', 'Daria', 3900, '1997-05-07', 7, 'RS', NULL),
('JO018', 'Kvitova', 'Petra', 3400, '1990-03-08', 8, 'DE', NULL),
('JO019', 'Muchova', 'Karolina', 4100, '1996-08-21', 9, 'FR', NULL),
('JO020', 'Jabeur', 'Ons', 5100, '1994-08-28', 10, 'FR', NULL),
('JO021', 'Nadal', 'Rafael', 8900, '1986-06-03', 12, 'ES', NULL),
('JO022', 'Federer', 'Roger', 7500, '1981-08-08', 20, 'CH', NULL),
('JO023', 'Murray', 'Andy', 3100, '1987-05-15', 35, 'GB', NULL),
('JO024', 'Wawrinka', 'Stan', 2800, '1985-03-28', 45, 'CH', NULL),
('JO025', 'Cilic', 'Marin', 2200, '1988-09-28', 60, 'IT', NULL),
('JO026', 'Thiem', 'Dominic', 3600, '1993-09-03', 30, 'DE', NULL),
('JO027', 'Bautista', 'Roberto', 2900, '1988-04-14', 40, 'ES', NULL),
('JO028', 'Shapovalov', 'Denis', 3300, '1999-04-15', 28, 'US', NULL),
('JO029', 'Auger-Aliassime', 'Felix', 3700, '2000-08-08', 22, 'AU', NULL),
('JO030', 'Berrettini', 'Matteo', 4200, '1996-04-12', 18, 'IT', NULL);

-- Insertion table Ramasseur
INSERT INTO Ramasseur VALUES
('RA001', 'Dubois', 'Lucas', '2005-06-10', '2019-05-26', 'FR', 'MA001', 'ST011'),
('RA002', 'Lopez', 'Miguel', '2006-03-15', '2021-05-03', 'ES', 'MA002', 'ST012'),
('RA003', 'Fischer', 'Anna', '2007-08-22', '2022-06-27', 'DE', 'MA003', 'ST013'),
('RA004', 'Johnson', 'Emily', '2005-11-30', '2020-06-29', 'GB', 'MA004', 'ST014'),
('RA005', 'Conti', 'Giulia', '2006-04-18', '2021-05-10', 'IT', 'MA005', 'ST015'),
('RA006', 'Moreau', 'Hugo', '2007-01-25', '2022-07-03', 'FR', 'MA006', 'ST001'),
('RA007', 'Santos', 'Pedro', '2005-09-12', '2019-08-17', 'AR', 'MA007', 'ST002'),
('RA008', 'Weber', 'Julia', '2006-07-08', '2021-01-18', 'CH', 'MA008', 'ST003'),
('RA009', 'Popovic', 'Stefan', '2007-02-14', '2022-05-23', 'RS', 'MA009', 'ST004'),
('RA010', 'Carter', 'Olivia', '2005-12-03', '2020-08-31', 'AU', 'MA010', 'ST005');

-- Insertion table Billet
INSERT INTO Billet VALUES
('MA001', 'BI001', 85.00, 1245, 'Standard', '2023-05-28'),
('MA001', 'BI002', 120.00, 3456, 'Premium', '2023-05-28'),
('MA002', 'BI003', 95.00, 2134, 'Standard', '2023-05-29'),
('MA002', 'BI004', 150.00, 4567, 'Premium', '2023-05-29'),
('MA003', 'BI005', 200.00, 5678, 'VIP', '2023-06-04'),
('MA003', 'BI006', 75.00, 1023, 'Standard', '2023-06-04'),
('MA004', 'BI007', 110.00, 2345, 'Premium', '2023-05-30'),
('MA004', 'BI008', 180.00, 6789, 'VIP', '2023-05-30'),
('MA005', 'BI009', 250.00, 7890, 'VIP', '2023-07-04'),
('MA005', 'BI010', 90.00, 1567, 'Standard', '2023-07-04'),
('MA006', 'BI011', 130.00, 3210, 'Premium', '2023-07-05'),
('MA006', 'BI012', 300.00, 8901, 'VIP', '2023-07-05'),
('MA007', 'BI013', 85.00, 2109, 'Standard', '2023-07-08'),
('MA007', 'BI014', 160.00, 5432, 'Premium', '2023-07-08'),
('MA008', 'BI015', 220.00, 9012, 'VIP', '2023-07-10'),
('MA009', 'BI016', 70.00, 1890, 'Standard', '2024-01-15'),
('MA009', 'BI017', 140.00, 4321, 'Premium', '2024-01-15'),
('MA010', 'BI018', 350.00, 10234, 'VIP', '2024-01-16'),
('MA010', 'BI019', 80.00, 2678, 'Standard', '2024-01-16'),
('MA011', 'BI020', 120.00, 3890, 'Premium', '2024-01-20'),
('MA012', 'BI021', 400.00, 11234, 'VIP', '2023-09-02'),
('MA012', 'BI022', 95.00, 1789, 'Standard', '2023-09-02'),
('MA013', 'BI023', 110.00, 2890, 'Premium', '2023-06-07'),
('MA014', 'BI024', 500.00, 12345, 'VIP', '2023-07-14'),
('MA015', 'BI025', 60.00, 1456, 'Standard', '2024-01-18'),
('MA016', 'BI026', 130.00, 3567, 'Premium', '2023-10-25'),
('MA017', 'BI027', 280.00, 9876, 'VIP', '2023-10-26'),
('MA018', 'BI028', 75.00, 2012, 'Standard', '2024-01-22'),
('MA019', 'BI029', 145.00, 4678, 'Premium', '2023-06-09'),
('MA020', 'BI030', 320.00, 10567, 'VIP', '2023-07-12'),
('MA001', 'BI031', 88.00, 1346, 'Standard', '2023-05-28'),
('MA003', 'BI032', 175.00, 5890, 'Premium', '2023-06-04'),
('MA005', 'BI033', 240.00, 7234, 'VIP', '2023-07-04'),
('MA008', 'BI034', 65.00, 1123, 'Standard', '2023-07-10'),
('MA010', 'BI035', 135.00, 4012, 'Premium', '2024-01-16'),
('MA013', 'BI036', 290.00, 9345, 'VIP', '2023-06-07'),
('MA015', 'BI037', 72.00, 1678, 'Standard', '2024-01-18'),
('MA017', 'BI038', 155.00, 5123, 'Premium', '2023-10-26'),
('MA019', 'BI039', 450.00, 13456, 'VIP', '2023-06-09'),
('MA020', 'BI040', 82.00, 2234, 'Standard', '2023-07-12');

-- Insertion table S_ENTRAINER
INSERT INTO S_ENTRAINER VALUES
('JO001', 'C001', 'EN001'),
('JO002', 'C003', 'EN002'),
('JO003', 'C001', 'EN003'),
('JO004', 'C008', 'EN004'),
('JO005', 'C001', 'EN005'),
('JO006', 'C007', 'EN006'),
('JO007', 'C001', 'EN007'),
('JO008', 'C001', 'EN008'),
('JO009', 'C006', 'EN009'),
('JO010', 'C006', 'EN010'),
('JO011', 'C001', 'EN011'),
('JO012', 'C010', 'EN012'),
('JO013', 'C006', 'EN013'),
('JO014', 'C004', 'EN014'),
('JO015', 'C006', 'EN015'),
('JO021', 'C003', 'EN016'),
('JO022', 'C008', 'EN017'),
('JO023', 'C004', 'EN018'),
('JO029', 'C005', 'EN019'),
('JO030', 'C007', 'EN020');

-- Insertion table SE_DEROULE
INSERT INTO SE_DEROULE VALUES
('C001', 'MA001'),
('C001', 'MA002'),
('C001', 'MA003'),
('C001', 'MA004'),
('C003', 'MA005'),
('C004', 'MA006'),
('C004', 'MA007'),
('C004', 'MA008'),
('C005', 'MA009'),
('C005', 'MA010'),
('C006', 'MA011'),
('C006', 'MA012'),
('C001', 'MA013'),
('C004', 'MA014'),
('C005', 'MA015'),
('C006', 'MA016'),
('C006', 'MA017'),
('C005', 'MA018'),
('C001', 'MA019'),
('C004', 'MA020');

-- Insertion table APPARTENIR
INSERT INTO APPARTENIR VALUES
('JO001', 360, 'TB001'),
('JO002', 180, 'TB001'),
('JO003', 90, 'TB001'),
('JO004', 90, 'TB001'),
('JO005', 45, 'TB001'),
('JO006', 45, 'TB001'),
('JO007', 10, 'TB001'),
('JO008', 360, 'TB002'),
('JO009', 180, 'TB002'),
('JO010', 90, 'TB002'),
('JO011', 360, 'TB005'),
('JO012', 180, 'TB005'),
('JO013', 360, 'TB006'),
('JO014', 180, 'TB006'),
('JO015', 90, 'TB006'),
('JO016', 360, 'TB007'),
('JO017', 180, 'TB007'),
('JO018', 360, 'TB008'),
('JO019', 180, 'TB008'),
('JO020', 90, 'TB008'),
('JO021', 360, 'TB009'),
('JO022', 180, 'TB009'),
('JO023', 360, 'TB010'),
('JO024', 90, 'TB003'),
('JO025', 45, 'TB004');

-- Insertion table RESULTAT
INSERT INTO RESULTAT VALUES
('MA001', 'Djokovic Novak', '6-3, 6-4', 'TB001'),
('MA002', 'Alcaraz Carlos', '7-5, 6-3', 'TB001'),
('MA003', 'Djokovic Novak', '6-4, 3-6, 7-6', 'TB001'),
('MA004', 'Nadal Rafael', '6-1, 6-2', 'TB001'),
('MA005', 'Alcaraz Carlos', '6-7, 7-6, 6-4', 'TB005'),
('MA006', 'Murray Andy', '6-3, 7-5', 'TB005'),
('MA007', 'Alcaraz Carlos', '7-6, 6-4', 'TB005'),
('MA008', 'Federer Roger', '6-2, 6-3', 'TB005'),
('MA009', 'Djokovic Novak', '6-4, 6-4', 'TB007'),
('MA010', 'Sabalenka Aryna', '7-5, 7-6', 'TB008'),
('MA011', 'Gauff Coco', '6-3, 6-2', 'TB010'),
('MA012', 'Medvedev Daniil', '6-4, 4-6, 6-3', 'TB009'),
('MA013', 'Swiatek Iga', '6-1, 6-3', 'TB002'),
('MA014', 'Rybakina Elena', '7-6, 6-7, 6-4', 'TB006'),
('MA015', 'Djokovic Novak', '6-3, 6-4', 'TB007'),
('MA016', 'Zverev Alexander', '6-2, 7-5', 'TB003'),
('MA017', 'Pegula Jessica', '7-5, 6-3', 'TB004'),
('MA018', 'Sabalenka Aryna', '6-4, 6-2', 'TB008'),
('MA019', 'Swiatek Iga', '6-3, 6-1', 'TB002'),
('MA020', 'Alcaraz Carlos', '6-4, 7-5', 'TB005');