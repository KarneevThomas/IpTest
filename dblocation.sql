-- Creation BD Location airbnb
use thomaskarneev_wp
CREATE Table Client (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(255) NOT NULL,
    Mdp VARCHAR(255) NOT NULL,
    Adresse VARCHAR(255) NOT NULL,
    Hote INT NOT NULL,
        Constraint CHK_Hote check(Hote=0 or Hote=1),
    DateCreation DATETIME NOT NULL,
    DateModification DATETIME NOT NULL
);

CREATE Table Region (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nom Varchar(50) NOT NULL
);

CREATE Table TypeImmo (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Lib VARCHAR(255) NOT NULL,
    PrixMin INT NULL
);

CREATE Table Services (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Libelle Varchar(255) NOT NULL
);

CREATE TABLE annonce (
    Id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    publication int NOT NULL,
        Constraint CHK_Publication check(Publication=0 or Publication=1),

    PrixHT FLOAT NOT NULL,
    Adresse VARCHAR(255) NOT NULL,
    DateCreation DATETIME NOT NULL,
    DateModification DATETIME NOT NULL,
    Client_Id INT NOT NULL,
    TypeImmo_Id INT NOT NULL,
    Region_Id INT NOT NULL,
    constraint FK_annonceClient FOREIGN KEY(Client_Id) REFERENCES Client(Id),
    constraint FK_annonceTypeImmo FOREIGN KEY(TypeImmo_Id) REFERENCES TypeImmo(Id),
    constraint FK_annonceRegion FOREIGN KEY(Region_Id) REFERENCES Region(Id)

);

CREATE Table Piece (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(255) NOT NULL
);

CREATE TABLE commentaire (
    Id int NOT NULL PRIMARY KEY auto_increment, 
    avis varchar(255) NOT NULL, 
    note int NOT NULL, 
    DateModification datetime NOT NULL, 
    Client_Id int NOT NULL, 
    annonce_Id int NOT NULL,
    constraint commentaireClient FOREIGN KEY(Client_Id) REFERENCES Client(Id),
    constraint commentaireannonce FOREIGN KEY(annonce_Id) REFERENCES annonce(Id)
);

CREATE Table Posseder (
    Piece_Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Annonce_Id INT NOT NULL,
    Quantite INT NOT NULL,
    constraint CHK_Quantite check(Quantite = 1),
    constraint FK_PossederPiece FOREIGN KEY(Piece_Id) REFERENCES Piece(Id),
    constraint FK_Possederannonce FOREIGN KEY(annonce_Id) REFERENCES annonce(Id)

);

CREATE Table Reservation(
    annonce_Id INT NOT NULL,
    Client_Id INT NOT NULL,
    DateDebut DATETIME NOT NULL,
    DateFin DATETIME NOT NULL,
    constraint FK_reservation
    FOREIGN KEY (annonce_Id) REFERENCES annonce (Id),
    constraint FK_reservation2
    FOREIGN KEY (Client_Id) REFERENCES Client (Id),
    PRIMARY KEY (annonce_Id, Client_Id, DateDebut, DateFin),
    constraint FK_Reservationannonce FOREIGN KEY(annonce_Id) REFERENCES annonce(Id),
    constraint FK_ReservationClient FOREIGN KEY(Client_Id) REFERENCES Client(Id)
);


CREATE Table Photo (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Chemin VARCHAR(255) NOT NULL,
    Annonce_Id INT NOT NULL
);

CREATE Table Fournir (
    Services_Id INT NOT NULL,
    annonce_Id INT NOT NULL,
    constraint FK_FournirServices FOREIGN KEY(Services_Id) REFERENCES Services(Id),
    constraint FK_FournirAnnonce FOREIGN KEY(annonce_Id) REFERENCES annonce(Id)
);

CREATE Table TVA (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Taux INT NOT NULL,
    DateDepart DATETIME NOT NULL
);

INSERT INTO Client (Nom,Prenom,Email,Phone,Mdp,Adresse,Hote,DateCreation,DateModification) VALUES ('Karneev','Thomas','thomas.karneev.pro@gmail.com','0723654879','motdepasse','15 rue de champs',0,'2022-06-12','2024-03-29');

SELECT * FROM Client ORDER BY Id ASC;

INSERT INTO Region(Nom) VALUES ('île de France');

SELECT * FROM Region ORDER BY Id ASC;

INSERT INTO TypeImmo (Lib,PrixMin) VALUES ('Maison', 50);

SELECT * FROM TypeImmo ORDER BY Id ASC;

INSERT INTO Services(Libelle) VALUES (1);
SELECT * FROM Services ORDER BY Id ASC;

INSERT INTO annonce (publication,PrixHT,Adresse,DateCreation,DateModification,CLient_Id,TypeImmo_Id,Region_Id) VALUES (0, 20, '17 rue de champs', '2022-05-15', '2025-12-25', 1, 1, 1);

SELECT * FROM annonce ORDER BY Id ASC;

INSERT INTO Piece(Nom) VALUES ('Chambre');

SELECT * FROM Piece ORDER BY Id ASC;

INSERT INTO Reservation(annonce_Id,Client_Id,DateDebut,DateFin) VALUES (1,1,'2022-07-14','2023-07-14');

SELECT * FROM Reservation ORDER BY Id ASC;

INSERT INTO Fournir(Services_Id,annonce_Id) VALUES (1,1);

SELECT * FROM Fournir ORDER BY Id ASC;

INSERT INTO TVA(Taux,DateDepart) VALUES (50,'2022-05-12');

SELECT * FROM TVA ORDER BY Id ASC;
