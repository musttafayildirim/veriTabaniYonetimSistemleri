create database ligVeritabani

use ligVeritabani

create table tblMusabaka(
musabakaId int primary key identity(1,1),
musabakaAdi nvarchar(100)
);

create table tblPozisyon(
pozisyonId int primary key identity(1,1),
pozisyonBilgisi nvarchar(100)
);

create table tblTakim(
takimId int primary key identity(1,1),
takimAdi nvarchar(100)
);

create table tblFutbolcu(
futbolcuId int primary key identity(1,1),
futbolcuTakimId int foreign key references tblTakim(takimId),
futbolcuAdi nvarchar(100),
futbolcuFormaNo tinyint,
futbolcuPozisyonId int foreign key references tblPozisyon(pozisyonId)
);

create table tblFikstur(
fiksturId int primary key identity(1,1),
fiksturMusabakaTarihi date,
fiksturMusabakaZamani time(0),
fiksturEvSahibiTakimId int foreign key references tblTakim(takimId),
fiksturKonukTakimId int foreign key references tblTakim(takimId),
fiksturMusabakaId int foreign key references tblMusabaka(musabakaId)
);

create table tblFutbolcuFikstur(
fiksturId int foreign key references tblFikstur(fiksturId),
futbolcuId int foreign key references tblFutbolcu(futbolcuId),
golSayisi int 
);


