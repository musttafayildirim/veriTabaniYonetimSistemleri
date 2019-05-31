Create database FutbolLig;
use FutbolLig;

Create Table Takim(
TakimID int Primary Key identity(1,1),
TakimAdi varchar(100),
TakimKurYil int,
TakimStad varchar(200),
TakimTD varchar(200),
TakimBaskan varchar(200)
);

Create Table HakemTur(
HakemTurID int Primary Key identity(1,1),
HakemTurAdi varchar(50)
);

Create Table MacTur(
MacTurID int primary key identity(1,1),
MacTurAdi varchar(100)
);

Create Table Hakem(
HakemID int Primary Key identity(1,1),
HakemAdSoyad varchar(200),
HakemDTrh datetime,
HakemTurID int References HakemTur(HakemTurID)
);

Create Table Ulke(
UlkeID int Primary Key identity(1,1),
UlkeAdi varchar(200)
);

Create Table Futbolcu(
FutbolcuID int Primary Key identity(1,1),
FurbolcuAd varchar(50),
FutbolcuSoyad varchar(100),
FutbolcuDTrh datetime,
UlkeID int references Ulke(UlkeID),
TakimID int references Takim(TakimID)
);

Create Table TeknikDirektor(
TDID int primary key identity(1,1),
TDAdSoyad varchar(200),
UlkeID int references Ulke(UlkeID)
);

Create Table TakimLigPuan(
TakimID int references Takim(TakimID),
Sira int,
Puan int
);

Create Table Mac(
MacID int primary key identity(1,1),
Takim1ID int references Takim(TakimID),
Takim2ID int references Takim(TakimID),
MacTrh datetime,
HakemID int references Hakem(HakemID),
MacTurID int references MacTur(MacTurID),
GolTakim1 int,
GolTakim2 int
);

Create Table HakemPuan(
HakemID int references Hakem(HakemID),
MacID int references Mac(MacID),
MacPuan int
)