create database Kutuphane;

use Kutuphane;

create table YazarTipi(
YazarTipNo int primary key identity(1,1),
YazarTipAdi varchar(50)
);

create table Dil(
DilNo int primary key identity(1,1),
DilAdi varchar(50)
);

create table Yazar(
YazarNo int primary key identity(1,1),
YazarAdi varchar(50),
YazarTipi int foreign key references YazarTipi(YazarTipNo),
DilNo int foreign key references Dil(DilNo)
);

create table Unvan(
UnvanNo int primary key identity(1,1),
UnvanAdi varchar(50)
);

create table Notlar(
NotNo int primary key identity(1,1),
Notlar varchar(MAX),
DilNo int foreign key references Dil(DilNo)
);

create table KonuBaslik(
KonuBaslikNo int primary key identity(1,1),
KonuBaslik varchar(150),
DilNo int foreign key references Dil(DilNo)
);

create table Yapit(
YapitNo int primary key identity(1,1),
YapitAdi varchar(100),
DilNo int foreign key references Dil(DilNo)
);

create table Firma(
FirmaNo int primary key identity(1,1),
FirmaAdi varchar(100)
);

create table Bolum(
BolumNo int primary key identity(1,1),
BolumAdi varchar(50)
);

create table Grup(
GrupNo int primary key identity(1,1),
GrupAdi varchar(100)
);

create table Uye(
UyeNo int primary key identity(1,1),
AdSoyad varchar(200),
Bolum int foreign key references Bolum(BolumNo),
Grup int foreign key references Grup(GrupNo),
Unvan int foreign key references Unvan(UnvanNo),
Adres varchar(250),
Mail varchar(100),
Tel varchar(13),
GSM varchar(13)
);

create table Kitap();
