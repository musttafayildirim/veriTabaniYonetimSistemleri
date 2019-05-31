create database EnvanterKontrol

use EnvanterKontrol

create table Urun(
UrunNo int primary key,
UrunAdi nvarchar(30),
UrunAciklama nvarchar(100)
);

create table UrunCesitlilik(
UrunCesitlilikNo int primary key,
UrunNo int foreign key references Urun(UrunNo),
UrunAdi nvarchar(30),
UrunAciklama nvarchar(100),
UrunFiyat money
);

create table Personel(
PersonelTC bigint primary key,
Adi nvarchar(30),
Soyadi nvarchar(30),
Adres nvarchar(150),
Telefon nvarchar(13)
);

create table Depo(
DepoNo int primary key identity(1,1),
PersonelTC bigint  foreign key references Personel(PersonelTC),
DepoKapasitesi int,
Tarih datetime
);

create table DepoDetay(
DepoNo int foreign key references Depo(DepoNo),
UrunCesitlilik int foreign key references UrunCesitlilik(UrunCesitlilikNo),
UrunNo int foreign key references Urun(UrunNo),
Adet int,
DepoKapasitesi int
);

create table Vergi(
VergiId int primary key identity(1,1),
PersonelTC bigint foreign key references Personel(PersonelTC),
UrunNo int foreign key references Urun(UrunNo),
UrunCesitlilik int foreign key references UrunCesitlilik(UrunCesitlilikNo),
VergiTutari money,
Tarih datetime
);


create table Sigorta(
SigortaId int primary key identity(1,1),
PersonelTC bigint foreign key references Personel(PersonelTC),
UrunNo int foreign key references Urun(UrunNo),
UrunCesitlilik int foreign key references UrunCesitlilik(UrunCesitlilikNo),
SigortaTutari money,
Tarih datetime
);

create table DepoGiris(
DepoNo int foreign key references Depo(DepoNo),
UrunCesitlilik int foreign key references UrunCesitlilik(UrunCesitlilikNo),
PersonelTC bigint foreign key references Personel(PersonelTC),
Adet int,
Kapasite int,
Tarih datetime
);

create table DepoCikis(
DepoNo int foreign key references Depo(DepoNo),
UrunCesitlilik int foreign key references UrunCesitlilik(UrunCesitlilikNo),
PersonelTC bigint foreign key references Personel(PersonelTC),
Adet int,
Kapasite int,
Tarih datetime
);