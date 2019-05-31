create database Tiyatro
use Tiyatro

create table Adres(
IlPlaka int primary key,
IlAdi varchar(25)
)

create table Salon(
SalonId int primary key identity(1,1),
SalonAdi varchar(50)
);

Create table UyeTipi(
TipId int primary key identity(1,1),
TipAdi varchar(50),
BiletTutari money
);

Create table Egitim(
EgitimId int primary key identity(1,1),
EgitimAdi varchar(50),
);

create table Oyunlar(
OyunId int primary key identity(1,1),
OyunAdi varchar(50),
SalonId int foreign key references Salon(SalonID),
OyunTarihi date,
OyunSaat time
);

Create table Uye(
UyeId int primary key identity(1,1),
UyeAdi varchar(30),
UyeSoyadi varchar(30),
UyeTipi int foreign key references UyeTipi(TipId),
Adres int foreign key references Adres(IlPlaka), 
);

Create table UyeFaaliyet(
FaliyetId int primary key identity(1,1),
UyeId int foreign key references Uye(UyeID),
Oyun int foreign key references Oyunlar(OyunId),
Egitim int foreign key references Egitim(EgitimId)
);
