CREATE DATABASE OTELODEV

USE OTELODEV


create table OdaKategori(
KategoriId int primary key identity(1,1),
KategoriAdi varchar(25)
);

create table Oda(
OdaNumarasi int primary key identity(1,1),
KategoriId int foreign key references OdaKategori(KategoriId),
OdaTelefon varchar(13),
KiþiSayisi int,
OdaFiyat money
);

create table PersonelMevki(
MevkiId int primary key identity(1,1),
MevkiAdi varchar(25)
);

create table Personel(
PersonelTC bigint primary key,
Adi varchar(25),
Soyadi varchar(25),
MevkiId int foreign key references PersonelMevki(MevkiId)
);

create table Musteri(
MusteriTC bigint primary key,
MusteriAdi varchar(50),
MusteriSoyadi varchar(50),
GiriþTarihi Datetime,
ÇýkýþTarihi Datetime,
OdaNumarasý int foreign key references Oda(OdaNumarasi),
MusteriAdresi varchar(150),
MusteriTelefon varchar(13)
);

create table RezervasyonTur(
TurId int primary key identity(1,1),
TurAdi varchar(25)
);

create table Rezervasyon(
RezervasyonId int primary key identity(1,1),
TurId int foreign key references RezervasyonTur(TurId),
RezervasyonTarihi Datetime,
MusteriTC bigint foreign key references Musteri(MusteriTC)
);

create table Kayit(
KayitId int primary key identity(1,1),
MusteriTC bigint foreign key references Musteri(MusteriTC),
PersonelTC bigint foreign key references Personel(PersonelTC),
OdaNumarasi int,
RezervasyonVarmi bit,
);

create table EkHizmet(
EkHizmetId int primary key identity(1,1),
HizmetAdi varchar(25),
HizmetFiyati money
);

create table MusteriFatura(
FaturaId int primary key identity(1,1),
OdaNumarasi int foreign key references Oda(OdaNumarasi),
MusteriTC bigint foreign key references Musteri(MusteriTC)
);

create table MusteriFaturaDetay(
FaturaId int foreign key references MusteriFatura(FaturaId),
MusteriTC bigint foreign key references Musteri(MusteriTC),
EkHizmetId int foreign key references EkHizmet(EkHizmetId),
ToplamFiyat money
);

