create database yarisma
use yarisma

create table Uye(
id int primary key,
Ad varchar(20),
Soyad varchar(20),
Sifre varchar(20),
GunlukGiris int CHECK(GunlukGiris<=5), /*En fazla 5 kere giriþ yapýlabilir*/ 
SonGirisPuan int,
IL int ,
)

create table Kategori(
KategoriId int primary key,
KategoriAdi varchar(20),
)

create table Sorular(
SoruId int primary key,
SoruBaslik varchar(20),
Soru varchar(100),
A varchar(20),
B varchar(20),
C varchar(20),
D varchar(20),
Dogru varchar(20),
SoruPuan int,
id int foreign key references Uye(id),  /*Soruyu Göderen üye id*/
KategoriId int foreign key references Kategori(KategoriId),
)

create table Puan(
SoruId int foreign key references Sorular(SoruId)
Puan int,

)