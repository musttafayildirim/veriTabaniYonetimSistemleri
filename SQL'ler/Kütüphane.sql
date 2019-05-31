create database Kutuphane

use Kutuphane

Create table Adresler(
Adres_No int identity(1,1) primary key,
Cadde varchar(20),
Mahalle varchar(20),
Bina_No varchar(20),
Sehir varchar(20),
Posta_Kodu int,
Ulke varchar(20)
);



create table Uyeler(
Uye_No int identity(1,1) primary key,
Uye_Adi varchar(20),
Uye_Soyadi varchar(20),
Cinsiyet varchar(5),
Telefon varchar(15),
E_Posta varchar(40),
Adres_No int foreign key references Adresler(Adres_No)
);

Create Table Kitaplar(
ISBN varchar(20),
Kitab_Adi varchar(20),
Yayin_Tarihi varchar(20),
S_Sayisi int,
Primary key("ISBN")
);

Create Table Kutuphane(
Kutuphane_No int primary key identity(1,1),
Kutuphane_Ismi varchar(20),
Aciklama varchar(20),
Adres_No int
);

Create table Emanet(
Emanet_No int identity(1,1) primary key,
ISBN varchar(20) foreign key references Kitaplar(ISBN) NOT NULL,
Uye_No int NOT NULL foreign key references Uyeler(Uye_No),
Kutuphane_No int Not Null foreign key references Kutuphane(Kutuphane_No),
Emanet_Tarihi Datetime,
Teslim_Tarihi Datetime,
);

Create Table Kategoriler(
Kategori_No int primary key identity(1,1),
Kategori_Adi varchar(20)
);

Create Table Yazarlar(
Yazar_No int primary key identity(1,1),
Yazar_Adi varchar(20),
Yazar_Soyadi varchar(20)
);

Create table Kitap_Kütüphane(
Kutuphane_No int not null foreign key references Kutuphane(Kutuphane_No),
ISBN varchar(20) Not Null foreign key references Kitaplar(ISBN),
Miktar int,
Constraint "Kitap_Kütüphane_PK" Primary Key("Kutuphane_No",ISBN) 
);

create table Kitap_Kategori(
ISBN varchar(20) Not NULL foreign key references Kitaplar(ISBN),
Kategori_No int not null foreign key references Kategoriler(Kategori_No),
Constraint "Ktp_Ktg_Pk" Primary key("ISBN","Kategori_No")
);

Create table Kitap_Yazar(
ISBN varchar(20) Not Null foreign key references Kitaplar(ISBN),
Yazar_No int Not Null foreign key references Yazarlar(Yazar_No),
CONSTRAINT "Kitap_Yazar_Pk" Primary key ("ISBN","Yazar_No")
);

