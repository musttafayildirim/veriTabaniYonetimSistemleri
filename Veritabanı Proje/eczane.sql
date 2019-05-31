create database EczaneSon

use EczaneSon 

create table Adres(
IlPlaka int primary key,
Il nvarchar(50)
 );

create table Uretici(
UreticiId int primary key identity(1,1),
UreticiAdi nvarchar(50),
TelNo nvarchar(13),
Aciklama nvarchar(250)
);

create table MalzemeFormu(
MalzemeFormId int primary key identity(1,1),
FormAdi nvarchar(25)
);

create table MalzemeAmbalaj(
MalzemeAmbalajId int primary key identity(1,1),
AmbalajAdi nvarchar(25)
);

create table MalzemeKategori(
MalzemeKategoriId int primary key identity(1,1),
KategoriAdi nvarchar(25)
);

create table Kampanya(
KampanyaId int primary key identity(1,1),
KampanyaAdi nvarchar(25),
KampanyaOrani tinyint,
BaslangicTarihi Date,
BitisTarihi Date
);

create table Fiyat(
FiyatId int primary key identity(1,1),
AlisFiyati money,
KDV tinyint,
KarOrani tinyint,
KampanyaId int foreign key references Kampanya(KampanyaId),
SatisFiyati money
);

create table Malzeme(
MalzemeKodu int primary key identity(1,1),
MalzemeAdi nvarchar(25),
UreticiId int foreign key references Uretici(UreticiId),
MalzemeAmbalajId int foreign key references MalzemeAmbalaj(MalzemeAmbalajId),
MalzemeFormId int foreign key references MalzemeFormu(MalzemeFormId),
MalzemeKategoriId int foreign key references MalzemeKategori(MalzemeKategoriId),
MalzemeBilgisi nvarchar(300),
FiyatId int foreign key references Fiyat(FiyatId)
);

create table MalzemeStok(
StokId int primary key identity(1,1),
MalzemeId int foreign key references Malzeme(MalzemeKodu),
MalzemeMiktari int
);

create table PersonelUnvan(
UnvanId int primary key identity(1,1),
UnvanAdi nvarchar(25)
);

create table PersonelBirimi(
BirimNo int primary key identity(1,1),
BirimAdi nvarchar(25)
);

create table Personel(
PersonelTCNo bigint primary key,
PersonelAdi nvarchar(30),
PersonelSoyadi nvarchar(30),
Adres int foreign key references Adres(IlPlaka),
Cinsiyet bit,
DogumTarihi date,
IseBaslamaTarihi date,
AktifMi bit,
BirimNo int foreign key references PersonelBirimi(BirimNo),
UnvanId int foreign key references PersonelUnvan(UnvanId),
Evlimi bit,
CocukSayisi int,
Maas money,
Prim money,
);

create table Hasta(
HastaTC bigint primary key,
HastaAdi Nvarchar(30),
HastaSoyadi nvarchar(30),
Adres int foreign key references Adres(IlPlaka),
Cinsiyeti bit,
DogumTarihi date
);

create table SaglikKurumu(
KurumNo int primary key,
Adi nvarchar(50),
Adresi int foreign key references Adres(IlPlaka)
);

create table Doktor(
DoktorKurumSicilNo int primary key identity,
DoktorAdi nvarchar(25),
DoktorSoyadi nvarchar(25),
Adres int foreign key references Adres(IlPlaka),
KurumNo int foreign key references SaglikKurumu(KurumNo)
);

create table Recete(
ReceteId int primary key identity(1,1),
DoktorKurumSicilNo int foreign key references Doktor(DoktorKurumSicilNo),
HastaTc bigint foreign key references Hasta(HastaTC), 
);

create table ReceteDetay(
ReceteId int foreign key references Recete(ReceteId),
MalzemeKodu int foreign key references Malzeme(MalzemeKodu),
Adet int
);

create table OdemeTipi(
OdemeTipId int primary key identity(1,1),
OdemeTipAdi varchar(25),
TaksitVarmi bit
);

create table SatisFatura(
SatisFaturaId int primary key identity(1,1),
HastaTc bigint foreign key references Hasta(HastaTC),
PersonelTcNo bigint foreign key references Personel(PersonelTCNo),
ReceteID int foreign key references Recete(ReceteID),
FaturaTarihi datetime,
OdemeTipId int foreign key references OdemeTipi(OdemeTipId),
ToplamTutar money
);

create table MalzemeAlim(
MalzemeAlimId int primary key identity(1,1),
UreticiId int foreign key references Uretici(UreticiId),
PersonelTCNo bigint foreign key references Personel(PersonelTCNo),
);

create table MalzemeAlimDetay(
AlimId int foreign key references MalzemeAlim(MalzemeAlimId),
MalzemeKodu int foreign key references Malzeme(MalzemeKodu),
UreticiId int foreign key references Uretici(UreticiId)
);

create table AlimFatura(
AlimFaturaId int primary key identity(1,1),
PersonelId bigint foreign key references Personel(PersonelTCNo),
MalzemeAlimId int foreign key references MalzemeAlim(MalzemeAlimId),
FaturaTarihi datetime,
OdemeTipId int foreign key references OdemeTipi(OdemeTipId),
ToplamTutar money
);

create table OdemeTipDetay(
OdemeTipId int foreign key references OdemeTipi(OdemeTipId),
SatisFaturaId int foreign key references SatisFatura(SatisFaturaId),
AlisFaturaId int foreign key references AlimFatura(AlimFaturaId),
TaksitSayisi int,
KalanTaksitSayisi int
);





-----------------------Kayýtlar

----- ADRES TABLOSU -------------

insert into Adres values (01,'Adana');
insert into Adres values (34,'Istanbul');
insert into Adres values (11,'Bilecik');
insert into Adres values (26,'Eskiþehir');
insert into Adres values (41,'Kocaeli');
insert into Adres values (57,'Sinop');
insert into Adres values (55,'Samsun');
insert into Adres values (53,'Rize');
insert into Adres values (61,'Trabzon');
insert into Adres values (07,'Antalya');
insert into Adres values (06,'Ankara');
insert into Adres values (52,'Ordu');
insert into Adres values (44,'Kütahya')
select * from Adres


-----------  HASTA TABLOSU ---------

insert into Hasta Values (36350134690,'Mustafa','YILDIRIM',34,1,'05-12-1997')
insert into Hasta Values (19952458475,'Ahmet','KARA',61,1,'11-11-2007')
insert into Hasta Values (12345975413,'Fatma','YILDIZ',34,0,'01-09-1997')
insert into Hasta Values (36658874125,'Mikail','YILDIRIM',34,1,'12-31-1997')
insert into Hasta Values (15648512312,'Hakan','ÇELÝK',57,1,'2-22-1995')
insert into Hasta Values (36350464545,'Nurettin','DURAN',55,1,'3-26-2001')
insert into Hasta Values (36345645212,'Salih','AKYOL',7,1,'12-12-1997')
insert into Hasta Values (34465132155,'Gökhan','ÇOLAK',53,1,'07-21-1997')
insert into Hasta Values (36552244646,'Veli','FÝLÝZ',61,1,'01-25-1994')
insert into Hasta Values (45415646455,'Melis','YILDIRIM',57,0,'11-05-1997')
insert into Hasta Values (45645465451,'Ceyda','HIZ',34,0,'01-06-1995')
insert into Hasta Values (45465545612,'Hüsniye','YAÞAR',6,0,'02-01-1987')
insert into Hasta Values (15646587521,'Nurdan','DURAL',7,0,'12-05-1967')
insert into Hasta Values (56123154657,'Nurcan','DURAN',11,0,'05-04-1997')
insert into Hasta Values (24546875413,'Fadime','MUTLU',26,0,'07-09-1977')
insert into Hasta Values (36578645623,'Hümeyra','TOPRAK',34,0,'02-08-1996')
insert into Hasta Values (45642132345,'Þeyma','CANAN',41,0,'02-22-1992')
insert into Hasta Values (58675423123,'Cansu','YÜCEL',53,0,'05-25-1993')
insert into Hasta Values (65413214523,'Ece','DEÐÝRMENCÝ',55,0,'08-12-1994')
insert into Hasta Values (46513246542,'Ýrem','DEÐÝRMEN',57,0,'09-10-1999')
insert into Hasta Values (45613254652,'Merve','ILGAZ',61,0,'11-09-2008')
insert into Hasta Values (54642314623,'Ayça','YILMAZ',1,0,'10-26-2012')
insert into Hasta Values (23654653212,'Melike','YAREN',6,0,'10-19-2016')
insert into Hasta Values (32654354522,'Meltem','YASAL',7,0,'9-18-2017')
insert into Hasta Values (12345645156,'Ayþe','TEMUR',26,0,'8-17-1998')
insert into Hasta Values (45613245468,'Burcu','ERGEN',11,0,'07-16-1999')
insert into Hasta Values (45645132135,'Berivan','DURMUÞ',26,0,'05-15-2000')
insert into Hasta Values (54985645312,'Beril','HATIRLI',6,0,'01-16-2001')
insert into Hasta Values (56497856453,'Canan','HAYIRLI',34,0,'05-13-2002')
insert into Hasta Values (45643213542,'Cemre','HAYIRSIZ',41,0,'01-09-2003')
insert into Hasta Values (15645787345,'Ceren','ÞÝMÞEK',53,0,'01-12-2004')
insert into Hasta Values (45648972315,'Derya','DÝREK',55,0,'01-10-2005')
insert into Hasta Values (45642134546,'Deniz','DERYA',57,0,'03-08-2006')
insert into Hasta Values (45641357878,'Dilara','YÜKSEL',61,0,'04-09-2007')
insert into Hasta Values (45489731213,'Eda','YÜKSEK',1,0,'06-07-2015')
insert into Hasta Values (12345954653,'Eslem','GÖREN',6,0,'07-30-2016')
insert into Hasta Values (12354654233,'Gülsüm','GÖRÜR',11,0,'08-29-1975')
insert into Hasta Values (48974654123,'Güler','ÝYÝGÖR',57,0,'09-28-1977')
insert into Hasta Values (45643125455,'Hanife','ASLANTÜRK',34,0,'01-27-1974')
insert into Hasta Values (34654678652,'Handan','AKTÜRK',34,0,'11-26-1965')
insert into Hasta Values (34549787564,'Huriye','DURAN',34,0,'01-25-1994')
insert into Hasta Values (34567897812,'Jale','SATILMIÞ',34,0,'12-24-1993')
insert into Hasta Values (49787545342,'Kübra','HASTÜRK',34,0,'12-09-1992')
insert into Hasta Values (48945645245,'Lale','CANDEMÝR',41,0,'01-09-1991')
insert into Hasta Values (46546243546,'Leyla','DEMÝR',1,0,'01-26-1990')
insert into Hasta Values (45674897415,'Melek','YILDIZ',41,0,'10-22-1997')
insert into Hasta Values (48978534347,'Nuray','YILDIRIM',41,0,'01-13-1997')
insert into Hasta Values (54897534245,'Sevim','DURAN',34,0,'01-15-1997')
insert into Hasta Values (56489753425,'Seçil','DURMUÞ',57,0,'12-17-1997')
insert into Hasta Values (85798465435,'Seren','YIL',34,0,'01-21-1995')
insert into Hasta Values (54543242123,'Sertap','AYDEMÝR',34,0,'11-10-1986')
insert into Hasta Values (52323454566,'Þükran','KÝBAR',57,0,'10-08-1986')
insert into Hasta Values (64531245462,'Türkan','TAKAR',34,0,'05-22-1982')
insert into Hasta Values (11354655645,'Ünzile','MUTLU',34,0,'06-29-1984')
insert into Hasta Values (54654523424,'Öznur','HAYIRLI',11,0,'07-19-1983')
insert into Hasta Values (53456462342,'Yeter','ÖZTÜRK',34,0,'06-09-1981')
insert into Hasta Values (45465687562,'Yeliz','YAÞLI',34,0,'05-05-1988')
insert into Hasta Values (23456487855,'Yeþim','YEÞÝL',11,0,'05-04-1998')
insert into Hasta Values (35465456465,'Zeynep','ZEYTÝN',34,0,'01-09-2000')
insert into Hasta Values (12133454561,'Sümeyye','YALÇIN',52,0,'12-02-1998')

select * from Hasta


insert into SaglikKurumu values (11000,'Bilecik Devlet Hastanesi',11);
insert into SaglikKurumu values (34100,'Beykoz Devlet Hastanesi',34);
insert into SaglikKurumu values (34200,'Ümraniye Araþtýrma Hastanesi',34);
insert into SaglikKurumu values (34300,'Kartal Devlet Hastanesi',34);
insert into SaglikKurumu values (52000,'Ordu Devlet Hastanesi',52);
insert into SaglikKurumu values (57000,'Sinop Devlet Hastanesi',57);
insert into SaglikKurumu values (01000,'Adana Devlet Hastanesi',01);
insert into SaglikKurumu values (44000,'Kütahya Devlet Hastanesi',44);
insert into SaglikKurumu values (44100,'Tavþanlý Devlet Hastanesi',44);
insert into SaglikKurumu values (41000,'Kocaeli Devlet Hastanesi',41);
insert into SaglikKurumu values (41100,'Gebze Devlet Hastanesi',41);
insert into SaglikKurumu values (26100,'Tepebaþý Araþtýrma Hastanesi',26);
insert into SaglikKurumu values (53000,'Rize Devlet Hastanesi',53);
insert into SaglikKurumu values (61000,'Trabzon Devlet Hastanesi',61);
insert into SaglikKurumu values (55000,'Samsun Devlet Hastanesi',55);
insert into SaglikKurumu values (07000,'Antalya Devlet Hastanesi',07);

select * from SaglikKurumu


insert into Doktor values ('Mustafa','YILDIRIM',34,34100);
insert into Doktor values ('Ahmet','SEZER',34,34100);
insert into Doktor values ('Nuri','YAZAR',34,34100);
insert into Doktor values ('Sezen','SÖYLER',11,11000);
insert into Doktor values ('Sümeyye','YALÇIN',52,52000);
insert into Doktor values ('Kader','ALLI',57,57000)
insert into Doktor values ('Nurgül','YEÞÝM',01,01000)
insert into Doktor values ('Fehmi','BAKAR',44,44000);
insert into Doktor values ('Ömer','HAKKI',44,44100);
insert into Doktor values ('Ýrem','BOZOK',41,41100);
insert into Doktor values ('Nurdan','AKTAÞ',41,41000);
insert into Doktor values ('Merve','ÞENGÜL',26,26100);
insert into Doktor values ('Merve','MERT',53,53000);
insert into Doktor values ('Mustafa','YILMAZ',61,61000);
insert into Doktor values ('Mikail','YILDIRIM',55,55000);
insert into Doktor values ('Fethi','ÇOKTAN',7,07000);
insert into Doktor values ('Enes','YÜKSEL',34,34300);
insert into Doktor values ('Emin','ÝNANÇ',34,34200);
insert into Doktor values ('Salih','DURAN',34,34100);

select * from Doktor order by Adres

insert into PersonelUnvan values ('Eczane Teknisyeni');
insert into PersonelUnvan values ('Temizlik Görevlisi');
insert into PersonelUnvan values ('Genel Yönetici');
insert into PersonelUnvan values ('Eczacý');
insert into PersonelUnvan values ('Eczacý Kalfasý');
insert into PersonelUnvan values ('Muhasebe Sorumlusu')

select * from PersonelUnvan


insert into PersonelBirimi values('Muhasebe');
insert into PersonelBirimi values ('Temizlik');
insert into PersonelBirimi values ('Ýlaç Satýþý');
insert into PersonelBirimi values ('Depo');

select * from PersonelBirimi


insert into Personel values (36350134525,'Kemal','ZENGÝN',34,1,'12-05-1972','01-01-2015',1,3,3,1,3,4000,300)
insert into Personel values (41565121324,'Ayþe','KARA',34,0,'12-05-1986','01-01-2017',1,2,2,0,0,1350,0)
insert into Personel values (45413456451,'Sezen','TEKÝN',34,0,'01-01-1993','01-01-2016',1,4,4,0,0,4000,0)
insert into Personel values (12312313213,'Ahmet','DURMUÞ',34,1,'12-12-1990','01-01-2015',1,1,6,1,1,3000,100)
insert into Personel values (32546521354,'Sýla','GENÇ',34,1,'04-25-1992','01-01-2016',1,3,1,0,0,4000,0)
insert into Personel values (21324546231,'Nazlý','DURU',34,1,'04-13-1991','01-01-2016',1,3,4,0,0,4000,0)
insert into Personel values (34654513214,'Kazým','PARLAK',34,1,'06-30-1982','01-01-2016',1,3,5,0,0,4000,0)
insert into Personel values (35465468742,'Mahmut','VERGÝLÝ',34,1,'07-28-1978','01-01-2016',0,3,1,1,0,4000,0)

select * from Personel

insert into Uretici values ('ABBOTT ÝLAÇ VE ECZ. TÝC. LTD. ÞTÝ.','+902122541526','');
insert into Uretici values ('ABFEN FARMA SAN. VE TÝC. LTD.ÞTÝ.','+902164521565','');
insert into Uretici values ('ACTAVÝS ÝLAÇLARI A.Þ.','+902122256595','');
insert into Uretici values ('ALCON LABORATUVARLARI TÝC. A.Þ.','+902162541526','');
insert into Uretici values ('ALÝ RAÝF ÝLAÇ SAN. A.Þ.','+902124523542','');
insert into Uretici values ('ATABAY KÝMYA SAN. VE TÝC. A.Þ.','+902165986532','');
insert into Uretici values ('BECTON DÝCKÝNSON MEDÝKAL ÝTH.ÝHR.LTD.ÞTÝ.','+902165541526','');
insert into Uretici values ('BÝEM TIBBÝ CÝHAZ VE ÝLAÇ SAN. LTD. ÞTÝ.','+902165986532','');
insert into Uretici values ('BÝOFARMA ÝLAÇ SAN VE TÝC A.Þ.','+902162356232','');
insert into Uretici values ('ER-KÝM ÝLAÇ SAN. VE TÝC. A.Þ.','+902124585236','');
insert into Uretici values ('GÝLEAD SCÝENCES ÝLAÇ TÝC. LTD. ÞTÝ.','+902164512365','');
insert into Uretici values ('MECOM SAÐLIK ÜRÜNLERÝ SAN. VE TÝC. A.Þ.','+902164512585','');
insert into Uretici values ('MERKEZ ÝLAÇ SANAYÝ VE TÝCARET A.Þ.','+902161234585','');
insert into Uretici values ('SERVÝER ÝLAÇ VE ARAÞTIRMA A.Þ.','+902124562236','');

select * from Uretici

insert into MalzemeKategori values ('Aðýz-Diþ Saðlýðý');
insert into MalzemeKategori values ('Anne Bebek');
insert into MalzemeKategori values ('Bitkisel');
insert into MalzemeKategori values ('+18');
insert into MalzemeKategori values ('Güneþ');
insert into MalzemeKategori values ('Medikal');
insert into MalzemeKategori values ('Saç Bakýmý');
insert into MalzemeKategori values ('Vücut Bakýmý');
insert into MalzemeKategori values ('Cilt Bakýmý');
insert into MalzemeKategori values ('Göz Saðlýðý');
insert into MalzemeKategori values ('Burun Saðlýðý');
insert into MalzemeKategori values ('Ýlkyardým');
insert into MalzemeKategori values ('Spesifik Kremler');
insert into MalzemeKategori values ('Aðrý Kesiciler');

select * from MalzemeKategori


insert into MalzemeFormu values ('Kapsül');
insert into MalzemeFormu values ('Krem');
insert into MalzemeFormu values ('Yað');
insert into MalzemeFormu values ('Sabun');
insert into MalzemeFormu values ('Þampuan');
insert into MalzemeFormu values ('Tablet');
insert into MalzemeFormu values ('Ampul');
insert into MalzemeFormu values ('Sprey');
insert into MalzemeFormu values ('Þurup');
insert into MalzemeFormu values ('Solüsyon');
insert into MalzemeFormu values ('Gel');
insert into MalzemeFormu values ('Damla');
insert into MalzemeFormu values ('Macun');
insert into MalzemeFormu values ('Diðer');

select * from MalzemeFormu


insert into MalzemeAmbalaj values ('Kavanoz');
insert into MalzemeAmbalaj values ('Paket');
insert into MalzemeAmbalaj values ('Kutu');
insert into MalzemeAmbalaj values ('Þiþe');
insert into MalzemeAmbalaj values ('Plastik');

select * from MalzemeAmbalaj


insert into Kampanya values ('%10 Kampanyasý',10,'04-23-2015','12-31-2022');
insert into Kampanya values ('%20 Kampanyasý',20,'04-23-2015','12-31-2022');
insert into Kampanya values ('%30 Kampanyasý',30,'06-23-2016','12-31-2022');
insert into Kampanya values ('%50 Yaz Kampanyasý',50,'06-23-2016','12-31-2022');
insert into Kampanya values ('%25 Yaz Kampanyasý',25,'06-23-2016','12-31-2022');
insert into Kampanya values ('%33 Yaz Kampanyasý',33,'06-23-2016','12-31-2022');
insert into Kampanya values ('%50 Kampanyasý',50,'04-23-2015','12-31-2022');


select * from Kampanya;


insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (50,8,8,1,52);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (11,8,8,16);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (25,8,10,30);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (20,8,8,28);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (30,8,8,50);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (10,8,8,28);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (100,8,8,2,106);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (120,8,8,3,113);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (5,8,8,4,6);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (20,8,8,5,22.5);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (25,8,8,6,27);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (30,8,8,7,34);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (300,8,8,326.40);


select * from Fiyat;

insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId) values ('White Glo Pure',1,2,13,1,'White Glo Pure Saf & Doðal Diþ Macunu 85ml + %100 Doðal Bambu Diþ Fýrçasý HEDÝYE',12);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)   values ('Curaprox Anne ve Çocuk',1,5,14,1,'Curaprox Anne ve Çocuk Ýçin Özel Diþ Fýrçasý Seti',1);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Signal White Now Touch',2,2,13,1,'Diþ minesine zarar vermeyen formülüyle anýnda beyazlýk saðlar
Diþ macunua,diþ fýrçasýna,hatta suya bile gerek kalmadan artýk anýnda beyazlýk çantanýzda.',1);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Lierac Phytolastil',3,5,11,2,'Karýn, basen ve göðüs bölgesinde hýzlý kilo alýmý ve vb. sebeplere baðlý oluþan çatlaklara karþý bakým jeli. ',7);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Lansinoh Göðüs Pedleri',4,3,14,2,'Göðsünüzün þeklini alarak doðal bir görünüm saðlar.
Hijyenik nedenlerle, teker teker paketlenmiþlerdir ve tek kullanýmlýktýr.',4);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Dermo Oil 3lü Avantaj',5,3,3,2,'Dermo Oil, oluþabilecek çatlaklarýn görünümünün azaltýlmasýnda yardýmcý olabilmek için kullanýlan çatlak bakým ürünüdür.
Mevcut çatlaklarýn gürünümlerinin azaltýlmasý ve cilt tonundaki farklýlýklarýn giderilmesinde de yardýmcýdýr.',1);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Oro Çinko Krem',6,3,2,2,'Bez Bölgesi Bakýmýndada kullanýlabilen el ve vücut kremi',9);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Babe Pediatri',7,3,14,2,'Su Bazlý Piþik Patý 100ml 
Ekstra Yumuþak Þampuan 200ml Banyo Jeli 500ml',8);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Babe Güneþ Koruyucu',8,3,8,5,'Güneþe hassas cilt tiplerinde kullanýmý önerilir.',13);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Dr. Murad Water Resistant',9,5,2,5,'Tüm ciltlerin kullanýmýna uygun, suya dayanýklý formülü ile güneþ ýþýnlarýna karþý gün boyu maksimum koruma saðlayan, yüz ve vücut için güneþ koruma kremidir.',14);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Chicco Latte',10,5,8,5,'Cildi güneþ ýþýnlarýndan UVA ve UVB koruyarak besler. Suya dayanýklýdýr.',1);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Bioderma Photoderm',11,5,2,5,'Hassas ve reaktif ciltler için yüksek koruma saðlayan güneþ koruyucu.',16);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Durex Yakýn Hisset',12,2,14,4,'Daha özel bir his için ekstra kayganlaþtýrýcýlý ve ince prezervatif',11);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Zorah BIOLala',13,5,11,4,'Dünyada ilk ve tek probiyotik içeren organik kayganlaþtýcý ',16);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('TTO Lubricant Gel',14,3,11,4,'Bayanlarýn genital bölge bakýmýný saðlar.  10ml daha eklenmiþtir.',10);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Silikon Kulak Týkacý',1,5,14,6,'Daha iyi uyumayý saðlayan ve suyun kulaða girmesini önleyen yumuþak bir silikonlu kulak koruyucudur',17);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Termometre',2,5,14,6,'Wee Baby Bebek Odasý Termometresi',18);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('92 Filtreli Aðýzlýk',3,2,14,6,'Filtreli Aðýzlýk',19);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Beyaz Hava Nemlendirici',4,3,14,6,'Hava nemlendirici',20);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Sarý Bidon',5,4,14,6,'PowerBar Sarý Bidon',21);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Aile Tartýsý',7,2,14,6,'Beurer Aile Tartýsý ',22);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Babe Saç Losyonu',6,3,8,7,'Saç dökülmesine karþý kullanýlýr. Kepek ve sebuma karþý etkili bir þekilde dengeler.',23);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Floxia Enerji Þampuaný',8,5,5,7,'Kuru saçlar için dökülmeyi önlemeye yardýmcý þampuan.',24);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Saç Dökülmesine Karþý',9,5,5,7,'Babe Saç Dökülmesine Karþý Þampuan 250ml 
Babe Saç Dökülmesine Karþý Losyon 125ml',25);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Aubrey Gpb',9,5,5,7,'Saçlarýnýzýn güçlü, dolgun ve parlak görünmesine yardýmcý olur',26);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Nivea Baby',10,5,5,7,'Bebeðinizin hem saç hem vücut temizliði için kullanýlabilen özel bir þampuandýr.',27);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Capicade Saç Dökülmesine',11,5,3,7,'Saç dökülmesine karþý bakým losyonu.',28);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Mineralizing Water',11,4,8,9,'%89 Vichy Termal Suyu ve doðal hyalüronik asit içeren serum',29);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Ultra Sheer Grapefruit',12,4,15,9,'Nemlendirici cilt bakým losyonu.',30);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Pore Purifying Clay Mask',12,2,15,9,'Gözenekleri arýndýrmaya yardýmcý kil maskesi',31);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Clairial Crema',13,3,2,9,'Yaygýn kahverengi lekelerin aydýnlatýlmasýna yardýmcý olur. Cilt tonunu eþitler. Yüz, boyun, dekolte bölgelerinde uygulanabilir.',32);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Pharma Bodytone Reveal',14,3,2,9,'El ve vücuttaki koyu cilt lekerinin giderilmesine yardýmcý olur, cildi üst düzeyde nemlendirir.',33);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Opti-Free Express',10,4,10,10,'Opti-Free Express Lens Solüsyonu kullananlar hakkýnda detaylý bilgi sahip olmak isteyenler yorumlar bölümünü inceleyebilirler.',34);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Biotrue Multi-purpose',9,4,10,10,'Bausch Lomb Biotrue multi-purpose Lens Solüsyonu kullananlar hakkýnda detaylý bilgi sahip olmak isteyenler yorumlar bölümünü inceleyebilirler.',35);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Adrusen Crono',9,3,6,10,'Ýlaç deðildir. Hastalýklarýn önlenmesinde veya tedavi edilmesi amacýyla kullanýlmaz. Hamilelik, emzirme dönemi, hastalýk veya ilaç kullanýlmasý durumlarýnda doktorunuza danýþýnýz.Ürünlerimiz ilaç deðildir, destek ürünleridir.',36);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Nutrasea Deniz Suyu',10,3,8,11,'Nutrasea Deniz Suyu Burun Spreyi burun mukozasýný nemlendirerek, havadaki mikroorganizmalara ve çeþitli zararlý maddelere karþý burun mukozasýný korur.
Týkanmýþ burun deliklerinin açýlmasýnda, burun boþluðunu yýkamada, burun boþluklarýnýn korunmasýn da yardýmcý olur.',35);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Quixx Extra',10,3,8,11,'Quixx extra hipertonik bir burun spreyidir. Deðerli mineraller ve eser elementlere sahip Atlantik okyanus suyu ve okaliptüs yaðý içermektedir.',37);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Baby Drops Steril',10,2,13,11,'Bebeklerin burun boþluklarý dardýr ve týkanmasý kolaydýr. Ayrýca sümkürme refleksleri de yoktur.',38);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Lamiderm Yanýk Kremi',9,5,2,13,'Ýnsan vücudunun dýþ kýsýmlarýna tek veya temel amacý bu kýsýmlarý temizlemek, koku vermek, görünümünü deðiþtirmek, bunlarý korumak, iyi bir durumda tutmak veya vücut kokularýný düzeltmek olan bütün madde veya karýþýmlarý ifade eder.',39);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('TTO Uçuk Kremi',8,5,2,13,'TTO Ucux Kremi 10 ml',19);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Cosakondrin MSM',8,4,6,3,'Tavsiye edilen günlük porsiyon miktarý yetiþkinler için tok karnýna 2 tablet tüketilmesi þeklindedir. Diyabet Hastalarýnýn Hekimlerine Danýþarak Kullanmalarý önerilir.',40);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('New Life EFA-Vit Fruity',6,4,9,3,'Kullanmadan önce çalkalayýnýz. Bu ürün direkt olarak tüketilebileceði gibi, su, meyve suyu ya da yoðurda karýþtýrýlarak da tüketilebilir.',41);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Mega Joint',2,2,6,3,'Gýda takviyesi olarak günde 1 Tablet kullanýlmasý önerilir.',42);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Redoxon Kids',5,3,6,3,'4-10 yaþ arasý çocuklar için günde 2 adet, 10 yaþ üstü çocuklar için günde 3 adet tüketilmesi önerilir.
25 adet',43);

insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Sunlife Zenergade',11,1,6,3,'Günde 1 efervesan tableti bir bardak suda (250ml) eriterek içiniz.',26);

insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('ARFEN',10,3,7,14,'Ýlacýn etken maddesi Deksketoprofen‘ dir. ARFEN 50 mg/2 ml Enjeksiyonluk Çözelti Ampul, vücutta  iltihap ve aðrýya sebep olan belirli biyolojik etkenleri azaltan, iltihap giderici ve aðrý kesici bir ilaçtýr.',44);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('ARTHROTEC',14,3,6,14,'Diklofenak sodyum ve Misoprostol‘ dur.  Ýlacýn içeriðinde bulunan Diklofenak sodyum, vücutta iltihaba ve aðrýya sebep olan belirli biyolojik faktörleri azaltarak, iltihap giderici ve aðrý kesici etki gösterir.',43);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('ATASPIN',2,2,6,14,'Asetilsalisilik asit‘ dir.ATASPIN 80 mg Tablet, vücutta iltihaba, ateþ ve aðrýya sebep olan maddeleri azaltan iltihap önleyici, aðrý kesici ve ateþ düþürücü bir ilaçtýr.',39);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('LINCAINE % 10 Sprey',4,4,8,14,'LINCAINE % 10 Sprey, hücre zarýndaki sinirsel uyarýlarýn oluþumunu ve iletimini engelleyerek bölgesel uyuþma (lokal anestezik) saðlar.',35);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('PRECOXIN % 10 Sprey',4,4,8,14,'PRECOXIN % 10 Sprey, hücre zarýndaki sinirsel uyarýlarýn oluþumunu ve iletimini engelleyerek bölgesel uyuþma (lokal anestezik) saðlar.',36);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('KLORHEX Plus Oral Sprey',5,4,8,14,'KLORHEX Plus Oral Sprey, aðýz boþluðu ve boðaz bölgesinde iltihap giderici/aðrý kesici etkilerinin yaný sýra aðýz içindeki mikroplarý öldürücü ve geliþmelerini engelleyici (antiseptik) etkilere de sahiptir.',37);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('DENTA-CLAR',6,3,6,15,'DENTA-CLAR 250 mg Film Tablet, vücuttaki bakterilerle savaþarak , bakterilerin sebep olduðu enfeksiyonlarý tedavi eden güçlü bir antibiyotiktir.',38);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('UNIKLAR',6,4,7,15,'UNIKLAR IV 500 mg Flakon, vücuttaki bakterilerle savaþarak , bakterilerin sebep olduðu enfeksiyonlarý tedavi eden güçlü bir antibiyotiktir. ',34);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('LARICID',5,2,6,15,'LARICID 125 mg/5 ml Oral Süspansiyon, vücuttaki bakterilerle savaþarak , bakterilerin sebep olduðu enfeksiyonlarý tedavi eden güçlü bir antibiyotiktir. ',39);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('ORADRO',3,3,7,15,'ORADRO 500 mg IV Flakon, vücuttaki bakterilerle savaþarak , bakterilerin sebep olduðu enfeksiyonlarý tedavi eden güçlü bir antibiyotiktir.',30);


select * from Malzeme order by UreticiId

insert into MalzemeAlim(UreticiId,PersonelTCNo) values (1,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (2,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (3,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (4,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (5,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (6,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (7,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (8,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (9,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (10,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (11,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (12,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (13,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (14,45413456451);

select * from MalzemeAlim

insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (1,1,6,10);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (1,1,7,10);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (1,1,21,25);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (2,2,22,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (2,2,8,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (2,2,50,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (2,2,55,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (3,3,62,150);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (3,3,9,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (3,3,23,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (4,4,24,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (4,4,10,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (4,4,56,75);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (4,4,57,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,51,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,58,25);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,61,30);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,25,60);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,13,90);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,11,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,27,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,49,60);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,59,60);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,60,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (7,7,12,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (8,8,14,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (8,8,28,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (8,8,47,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (8,8,48,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,26,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,46,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,39,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,40,150);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,29,70);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,15,170);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,30,75);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,16,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,31,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,41,300);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,42,500);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,45,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,38,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,53,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (11,11,52,250);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (11,11,32,300);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (11,11,33,150);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (11,11,17,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (12,12,18,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (12,12,34,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (12,12,35,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (18,13,36,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (18,13,19,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (19,14,20,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (19,14,37,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (19,14,54,100);


select * from MalzemeAlimDetay


insert into MalzemeStok values(6,10);
insert into MalzemeStok values(7,10);
insert into MalzemeStok values(21,25);
insert into MalzemeStok values(22,100);
insert into MalzemeStok values(8,100);
insert into MalzemeStok values(50,100);
insert into MalzemeStok values(55,100);
insert into MalzemeStok values(62,150);
insert into MalzemeStok values(9,100);
insert into MalzemeStok values(23,200);
insert into MalzemeStok values(24,50);
insert into MalzemeStok values(10,50);
insert into MalzemeStok values(56,75);
insert into MalzemeStok values(57,50);
insert into MalzemeStok values(51,100);
insert into MalzemeStok values(58,25);
insert into MalzemeStok values(61,30);
insert into MalzemeStok values(25,60);
insert into MalzemeStok values(13,90);
insert into MalzemeStok values(11,100);
insert into MalzemeStok values(27,50);
insert into MalzemeStok values(49,60);
insert into MalzemeStok values(59,60);
insert into MalzemeStok values(60,100);
insert into MalzemeStok values(12,100);
insert into MalzemeStok values(14,200);
insert into MalzemeStok values(28,200);
insert into MalzemeStok values(47,200);
insert into MalzemeStok values(48,200);
insert into MalzemeStok values(26,200);
insert into MalzemeStok values(46,100);
insert into MalzemeStok values(39,100);
insert into MalzemeStok values(40,150);
insert into MalzemeStok values(29,70);
insert into MalzemeStok values(30,75);
insert into MalzemeStok values(16,100);
insert into MalzemeStok values(31,200);
insert into MalzemeStok values(41,300);
insert into MalzemeStok values(42,500);
insert into MalzemeStok values(45,50);
insert into MalzemeStok values(38,100);
insert into MalzemeStok values(53,100);
insert into MalzemeStok values(52,250);
insert into MalzemeStok values(32,300);
insert into MalzemeStok values(33,150);
insert into MalzemeStok values(17,100);
insert into MalzemeStok values(18,100);
insert into MalzemeStok values(34,100);
insert into MalzemeStok values(35,100);
insert into MalzemeStok values(36,100);
insert into MalzemeStok values(19,100);
insert into MalzemeStok values(20,100);
insert into MalzemeStok values(37,100);
insert into MalzemeStok values(54,100);
insert into MalzemeStok values(15,170);


select * from MalzemeStok

insert into OdemeTipi values('Nakit',0);
insert into OdemeTipi values('Kredi Peþin',0);
insert into OdemeTipi values('Kredi 3 Taksit',1);
insert into OdemeTipi values('Kredi 4 Taksit',1);
insert into OdemeTipi values('Kredi 6 Taksit',1);

select * from OdemeTipi


insert into AlimFatura values(21324546231,1,'05-04-2017',1,1500);
insert into AlimFatura values(21324546231,2,'03-03-2017',2,1500);
insert into AlimFatura values(21324546231,3,'01-04-2016',1,1500);
insert into AlimFatura values(21324546231,4,'08-05-2015',3,1500);
insert into AlimFatura values(21324546231,5,'07-09-2017',1,1500);
insert into AlimFatura values(21324546231,6,'06-10-2015',4,1500);
insert into AlimFatura values(21324546231,7,'11-15-2017',1,1500);
insert into AlimFatura values(45413456451,8,'05-12-2015',5,3000);
insert into AlimFatura values(45413456451,9,'05-12-2015',4,1500);
insert into AlimFatura values(45413456451,10,'06-13-2015',2,300);
insert into AlimFatura values(45413456451,11,'06-14-2015',1,3000);
insert into AlimFatura values(45413456451,12,'06-25-2016',1,1500);
insert into AlimFatura values(45413456451,18,'02-13-2015',1,1000);
insert into AlimFatura values(45413456451,19,'09-19-2016',1,1000);


select * from AlimFatura

insert into Recete values(1,11354655645);
insert into Recete values(1,12133454561);
insert into Recete values(1,12345645156);
insert into Recete values(2,12345954653);
insert into Recete values(2,12345975413);
insert into Recete values(2,12354654233);
insert into Recete values(3,15645787345);
insert into Recete values(3,15646587521);
insert into Recete values(3,15648512312);
insert into Recete values(4,19952458475);
insert into Recete values(4,23456487855);
insert into Recete values(4,23654653212);
insert into Recete values(5,24546875413);
insert into Recete values(5,32654354522);
insert into Recete values(5,34465132155);
insert into Recete values(6,34549787564);
insert into Recete values(6,34567897812);
insert into Recete values(6,34654678652);
insert into Recete values(7,35465456465);
insert into Recete values(7,36345645212);
insert into Recete values(7,36350134690);
insert into Recete values(8,36350464545);
insert into Recete values(8,36552244646);
insert into Recete values(8,36578645623);
insert into Recete values(9,36658874125);
insert into Recete values(9,45415646455);
insert into Recete values(9,45465545612);
insert into Recete values(10,45465687562);
insert into Recete values(10,45489731213);
insert into Recete values(10,45613245468);
insert into Recete values(10,45613254652);
insert into Recete values(11,45641357878);
insert into Recete values(11,45642132345);
insert into Recete values(11,45642134546);
insert into Recete values(12,45643125455);
insert into Recete values(12,45643213542);
insert into Recete values(12,45645132135);
insert into Recete values(13,45645465451);
insert into Recete values(13,45648972315);
insert into Recete values(13,45674897415);
insert into Recete values(14,46513246542);
insert into Recete values(14,46546243546);
insert into Recete values(14,48945645245);
insert into Recete values(15,48974654123);
insert into Recete values(15,48978534347);
insert into Recete values(15,49787545342);
insert into Recete values(16,52323454566);
insert into Recete values(16,53456462342);
insert into Recete values(16,54543242123);
insert into Recete values(17,54642314623);
insert into Recete values(17,54654523424);
insert into Recete values(17,54897534245);
insert into Recete values(18,54985645312);
insert into Recete values(18,56123154657);
insert into Recete values(18,56489753425);
insert into Recete values(19,56497856453);
insert into Recete values(19,58675423123);
insert into Recete values(19,64531245462);
insert into Recete values(19,65413214523);
insert into Recete values(19,85798465435);

select * from Recete

insert into ReceteDetay values(1,6,1);
insert into ReceteDetay values(1,7,2);
insert into ReceteDetay values(2,8,1);
insert into ReceteDetay values(2,9,2);
insert into ReceteDetay values(2,10,2);
insert into ReceteDetay values(3,11,3);
insert into ReceteDetay values(3,12,3);
insert into ReceteDetay values(3,14,3);
insert into ReceteDetay values(4,11,3);
insert into ReceteDetay values(4,15,2);
insert into ReceteDetay values(5,16,2);
insert into ReceteDetay values(5,17,2);
insert into ReceteDetay values(5,18,2);
insert into ReceteDetay values(6,18,2);
insert into ReceteDetay values(6,19,1);
insert into ReceteDetay values(6,20,1);
insert into ReceteDetay values(6,21,1);
insert into ReceteDetay values(6,22,1);
insert into ReceteDetay values(7,23,2);
insert into ReceteDetay values(7,24,1);
insert into ReceteDetay values(7,25,3);
insert into ReceteDetay values(7,26,1);
insert into ReceteDetay values(8,26,1);
insert into ReceteDetay values(8,27,1);
insert into ReceteDetay values(9,28,1);
insert into ReceteDetay values(9,29,2);
insert into ReceteDetay values(10,30,2);
insert into ReceteDetay values(11,31,2);
insert into ReceteDetay values(12,32,2);
insert into ReceteDetay values(13,33,1);
insert into ReceteDetay values(14,34,3);
insert into ReceteDetay values(14,35,1);
insert into ReceteDetay values(15,36,1);
insert into ReceteDetay values(15,37,1);
insert into ReceteDetay values(16,38,1);
insert into ReceteDetay values(16,39,1);
insert into ReceteDetay values(16,40,1);
insert into ReceteDetay values(17,41,1);
insert into ReceteDetay values(18,42,2);
insert into ReceteDetay values(19,43,1);
insert into ReceteDetay values(20,44,1);
insert into ReceteDetay values(21,45,1);
insert into ReceteDetay values(22,46,1);
insert into ReceteDetay values(23,47,1);
insert into ReceteDetay values(24,48,2);
insert into ReceteDetay values(24,49,3);
insert into ReceteDetay values(24,50,3);
insert into ReceteDetay values(24,51,3);
insert into ReceteDetay values(25,52,3);
insert into ReceteDetay values(26,53,3);
insert into ReceteDetay values(27,54,1);
insert into ReceteDetay values(28,55,2);
insert into ReceteDetay values(28,56,2);
insert into ReceteDetay values(29,57,2);
insert into ReceteDetay values(29,58,1);
insert into ReceteDetay values(30,59,1);
insert into ReceteDetay values(30,60,1);
insert into ReceteDetay values(31,61,1);
insert into ReceteDetay values(32,62,1);
insert into ReceteDetay values(33,1,1);
insert into ReceteDetay values(34,1,2);
insert into ReceteDetay values(35,1,2);
insert into ReceteDetay values(36,2,2);
insert into ReceteDetay values(37,3,2);
insert into ReceteDetay values(38,16,1);
insert into ReceteDetay values(39,54,2);
insert into ReceteDetay values(40,21,2);
insert into ReceteDetay values(40,12,1);
insert into ReceteDetay values(41,18,1);
insert into ReceteDetay values(42,32,1);
insert into ReceteDetay values(43,18,1);
insert into ReceteDetay values(44,22,1);
insert into ReceteDetay values(45,19,2);
insert into ReceteDetay values(46,20,3);
insert into ReceteDetay values(46,21,3);
insert into ReceteDetay values(46,22,1);
insert into ReceteDetay values(47,23,1);
insert into ReceteDetay values(48,24,1);
insert into ReceteDetay values(49,25,4);
insert into ReceteDetay values(50,26,5);
insert into ReceteDetay values(51,27,1);
insert into ReceteDetay values(52,28,1);
insert into ReceteDetay values(53,29,2);
insert into ReceteDetay values(54,30,2);
insert into ReceteDetay values(54,31,2);
insert into ReceteDetay values(55,33,1);
insert into ReceteDetay values(55,35,1);
insert into ReceteDetay values(56,36,3);
insert into ReceteDetay values(56,37,1);
insert into ReceteDetay values(57,39,1);
insert into ReceteDetay values(57,40,1);
insert into ReceteDetay values(58,41,1);
insert into ReceteDetay values(58,45,1);
insert into ReceteDetay values(58,56,2);
insert into ReceteDetay values(58,57,2);
insert into ReceteDetay values(59,58,2);
insert into ReceteDetay values(59,20,1);
insert into ReceteDetay values(59,35,1);
insert into ReceteDetay values(59,12,3);
insert into ReceteDetay values(60,16,3);
insert into ReceteDetay values(60,17,3);


select * from ReceteDetay


insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(11354655645,21324546231,1,'01-01-2017',1,84);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12133454561,21324546231,2,'01-02-2017',1,320);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12345645156,21324546231,3,'01-03-2017',1,1335);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12345954653,21324546231,4,'01-04-2017',1,279);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12345975413,21324546231,5,'01-05-2017',1,310.16);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12354654233,21324546231,6,'01-05-2017',1,171.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(15645787345,21324546231,7,'01-05-2017',1,654.65);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(15646587521,21324546231,8,'01-05-2017',1,209.78);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(15648512312,21324546231,9,'01-05-2017',1,278.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(19952458475,21324546231,10,'01-05-2017',1,110);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(23456487855,32546521354,11,'01-06-2017',1,39.54);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(23654653212,32546521354,12,'01-06-2017',2,125.1);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(24546875413,32546521354,13,'01-06-2017',2,83.3);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(32654354522,32546521354,14,'01-06-2017',2,462.37);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(34465132155,32546521354,15,'01-06-2017',2,358.17);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(34549787564,32546521354,16,'01-06-2017',2,107.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(34567897812,32546521354,17,'01-06-2017',2,23.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(34654678652,32546521354,18,'01-07-2017',1,50);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(35465456465,32546521354,19,'01-07-2017',1,338);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36345645212,32546521354,20,'01-07-2017',1,171);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36350134690,32546521354,21,'01-08-2017',1,18);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36350464545,34654513214,22,'01-08-2017',1,35);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36552244646,34654513214,23,'01-08-2017',1,8);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36578645623,34654513214,24,'02-09-2017',1,793.8);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36658874125,34654513214,25,'02-10-2017',1,165);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45415646455,34654513214,26,'03-11-2017',1,45);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45465545612,34654513214,27,'03-12-2017',3,33.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45465687562,34654513214,28,'04-13-2017',3,187);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45489731213,34654513214,29,'04-14-2017',3,105);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45613245468,34654513214,30,'05-15-2017',1,62);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45613254652,34654513214,31,'05-16-2017',1,35);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45641357878,35465468742,32,'06-17-2017',1,149.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,33,'04-04-2018',5,14.84);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,34,'04-04-2018',5,67.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,35,'04-04-2018',5,22.26);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,36,'04-04-2018',5,11.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,37,'04-04-2018',5,110);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45645465451,35465468742,38,'08-23-2017',1,52);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45648972315,35465468742,39,'08-24-2017',1,34.8);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45674897415,35465468742,40,'09-25-2017',1,133);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(46513246542,36350134525,41,'09-26-2017',1,27);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(46546243546,36350134525,42,'09-27-2017',4,62.55);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(48945645245,36350134525,43,'09-28-2017',4,27);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(48974654123,36350134525,44,'09-29-2017',4,11.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(48978534347,36350134525,45,'10-30-2017',1,76.08);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(49787545342,36350134525,46,'11-01-2017',1,12.67);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(52323454566,36350134525,47,'12-02-2017',1,8);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(53456462342,36350134525,48,'01-02-2018',1,512.12);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54543242123,36350134525,49,'01-03-2018',1,57);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54642314623,36350134525,50,'01-04-2018',1,275);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54654523424,35465468742,51,'02-05-2018',1,126.42);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54897534245,35465468742,52,'02-06-2018',1,29.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54985645312,35465468742,53,'02-07-2018',1,249);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(56123154657,35465468742,54,'03-08-2018',1,39.54);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(56489753425,35465468742,55,'03-08-2018',1,83.3);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(56497856453,21324546231,56,'03-08-2018',1,551.76);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(58675423123,35465468742,57,'04-01-2018',1,23.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(64531245462,35465468742,58,'04-02-2018',5,127);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(65413214523,35465468742,59,'04-03-2018',5,233.92);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,60,'04-04-2018',5,696.24);

select * from SatisFatura where SatisFatura.OdemeTipId=3


insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,1);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,2);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,3);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,4);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,5);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,6);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,7);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,8);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,9);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,10);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,11);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,18);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,19);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,20);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,21);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,22);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,23);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,24);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,25);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,26);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,30);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,31);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,32);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,38);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,39);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,40);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,41);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,45);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,46);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,47);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,49);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,50);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,51);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,52);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,53);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,54);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,55);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,56);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,57);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,58);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,12);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,13);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,14);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,15);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,16);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,17);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,27,3,2,'04-12-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,28,3,2,'05-13-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,29,3,2,'04-14-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,27,3,1,'05-12-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,28,3,1,'06-13-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,29,3,1,'05-14-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,27,3,0,'06-14-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,42,4,3,'10-27-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,43,4,3,'10-28-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,44,4,3,'10-29-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,33,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,34,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,35,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,36,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,37,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,59,6,5,'05-02-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,60,6,5,'05-03-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,61,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,15);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,17);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,19);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,21);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,25);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,26);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,27);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,28);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(2,16);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(2,24);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,18,3,2,'09-05-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,18,3,1,'10-05-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,18,3,1,'11-05-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,20,4,3,'10-07-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,20,4,2,'10-08-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,20,4,1,'10-09-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,20,4,0,'10-10-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,23,4,3,'12-06-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,23,4,2,'12-07-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,23,4,1,'12-08-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,23,4,0,'12-09-2015');

select * from OdemeTipDetay

****Firmanýn yapmýþ olduðu tüm satýþlarýn faturalarýný listeleyen sql sorgusu*********
1
select * from OdemeTipDetay,OdemeTipi,SatisFatura where OdemeTipi.OdemeTipId=OdemeTipDetay.OdemeTipId and OdemeTipi.OdemeTipId=SatisFatura.OdemeTipId and OdemeTipDetay.SatisFaturaId=SatisFatura.SatisFaturaId
***************
Firmanýn yapmýþ olduðu tüm alým iþlemlerinin faturalarýný listeleyen sql sorgusu
2
select * from OdemeTipDetay,OdemeTipi,AlimFatura where OdemeTipi.OdemeTipId=OdemeTipDetay.OdemeTipId and OdemeTipi.OdemeTipId=AlimFatura.OdemeTipId and OdemeTipDetay.AlisFaturaId=AlimFatura.AlimFaturaId
******************************************************
3
Her ürünün hangi firmadan olduðunu ve her ürünün formunu bilgisini, kategorisini, ambalaj bilgisini,malzeme bilgisini, üreticinin telefon numarasýný listeleyecek sql sorgusunu yazýnýz.

select Malzeme.MalzemeKodu,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.FormAdi,MalzemeKategori.KategoriAdi,Uretici.UreticiAdi,Uretici.TelNo,Uretici.Aciklama from Malzeme,MalzemeKategori,MalzemeFormu,MalzemeAmbalaj,MalzemeStok,Uretici where Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeStok.MalzemeId=Malzeme.MalzemeKodu and Malzeme.UreticiId=Uretici.UreticiId

*********************************************************************
4
Personelleri unvanlarýný ve birimlerini yazacak þekilde tüm özellikleriyle listeleyiniz


select Personel.PersonelTCNo,Personel.PersonelAdi,Personel.PersonelSoyadi,Adres.Il,Personel.Cinsiyet,Personel.IseBaslamaTarihi,Personel.AktifMi,Personel.Evlimi,Personel.CocukSayisi,Personel.Maas,Personel.Prim,PersonelUnvan.UnvanAdi,PersonelBirimi.BirimAdi from Personel,PersonelUnvan,PersonelBirimi,Adres where Personel.BirimNo=PersonelBirimi.BirimNo and Personel.UnvanId=PersonelUnvan.UnvanId and Personel.Adres=Adres.IlPlaka

*************************************************************************************************
5
bugüne kadar reçete yazmýþ olan tüm doktorlarý listeleyiniz..

select * from Doktor,Recete,ReceteDetay where Doktor.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and Recete.ReceteId=ReceteDetay.ReceteId 

***************************************
6
Recete yazýlmýþ olan tüm hastalarý listeleyiniz...

select Hasta.HastaTC,Hasta.HastaAdi,Hasta.HastaSoyadi,Adres.Il,Hasta.Cinsiyeti,Hasta.DogumTarihi,Recete.ReceteId,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,Fiyat.SatisFiyati from Hasta,Recete,ReceteDetay,Malzeme,Fiyat,Adres where Hasta.HastaTC=Recete.HastaTc and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Malzeme.FiyatId=Fiyat.FiyatId and Adres.IlPlaka=Hasta.Adres

*****************************************************
7
Bugüne kadar hangi hastaya hangi doktor tarafýndan hangi ilaçlar yazýlmýþ ise bunlarý listeleyecek olan sql sorgusunu yazýnýz ve sýralama ölçüþü olarak doktorun adýný baz alýnýz...

select Hasta.HastaTC,Hasta.HastaAdi,Hasta.HastaSoyadi,Adres.Il,Hasta.Cinsiyeti,Hasta.DogumTarihi,Recete.ReceteId,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,Fiyat.SatisFiyati,Doktor.DoktorAdi,Doktor.DoktorSoyadi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.MalzemeFormId,MalzemeKategori.KategoriAdi from Hasta,Recete,ReceteDetay,Malzeme,Fiyat,Adres,Doktor,MalzemeKategori,MalzemeAmbalaj,MalzemeFormu where Hasta.HastaTC=Recete.HastaTc and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Malzeme.FiyatId=Fiyat.FiyatId and Adres.IlPlaka=Hasta.Adres and Doktor.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId order by Doktor.DoktorAdi

*******************************************************
8
Anne bebek kategorisinde verilmiþ olan ilaçlarýn sahiplerini ve hangi doktor tarafýndan verildiðini listeleyecek sql sorgusunu yazýnýz...


select Hasta.HastaTC,Hasta.HastaAdi,Hasta.HastaSoyadi,Adres.Il,Hasta.Cinsiyeti,Hasta.DogumTarihi,Recete.ReceteId,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,Fiyat.SatisFiyati,Doktor.DoktorAdi,Doktor.DoktorSoyadi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.MalzemeFormId,MalzemeKategori.KategoriAdi from Hasta,Recete,ReceteDetay,Malzeme,Fiyat,Adres,Doktor,MalzemeKategori,MalzemeAmbalaj,MalzemeFormu where Hasta.HastaTC=Recete.HastaTc and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Malzeme.FiyatId=Fiyat.FiyatId and Adres.IlPlaka=Hasta.Adres and Doktor.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and MalzemeKategori.KategoriAdi='Anne Bebek' order by Doktor.DoktorAdi
***************************************************************
9
kampanyaya girmiþ olan ilaclarý listeleyiniz.

select * from Kampanya,Fiyat,Malzeme,MalzemeAmbalaj,MalzemeFormu,MalzemeKategori,MalzemeStok where Kampanya.KampanyaId=Fiyat.FiyatId and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and Malzeme.MalzemeFormId=MalzemeFormu.MalzemeFormId and MalzemeKategori.MalzemeKategoriId=Malzeme.MalzemeKategoriId and MalzemeStok.MalzemeId=Malzeme.MalzemeKodu and (Fiyat.KampanyaId=1 or Fiyat.KampanyaId=2 or Fiyat.KampanyaId=3 or Fiyat.KampanyaId=4 or Fiyat.KampanyaId=5 or Fiyat.KampanyaId=6 or Fiyat.KampanyaId=7)

******************************************************************************
10
Ýçerisinde e harfi geçen doktorlarý listeleyiniz..

select * from Doktor where Doktor.DoktorAdi LIKE '%e%'


*****************************************************
11
içerisinde can geçen isimleri listeleyiniz hastalar arasýndan

select * from Hasta where Hasta.HastaAdi LIKE '%can%'


***********************************************************
12
hastalardan 18 yaþýndan küçük olanlarý isim sýralamasýna göre listeleyiniz

select * from Hasta where Hasta.DogumTarihi>'01-01-1999' order by Hasta.HastaAdi


**************************************************************************************
13
yapýlan toplam satýþ tutarýný listeleyiniz..

select SUM(SatisFatura.ToplamTutar) AS 'Bugüne Kadar Yapýlan Toplam Satýþ Tutarý' from SatisFatura

********************************************************
14
yapýlan satýþ sayýsýný listeleyiniz.

select Count(SatisFatura.SatisFaturaId) AS 'Satis Sayisi' from SatisFatura

**********************************************************************************
15
stokta olan antibiyotikleri listeleyiniz


select Malzeme.MalzemeKodu,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeKategori.KategoriAdi,MalzemeStok.MalzemeMiktari from MalzemeStok,MalzemeKategori,Malzeme where Malzeme.MalzemeKodu=MalzemeStok.MalzemeId and MalzemeKategori.MalzemeKategoriId=Malzeme.MalzemeKategoriId and MalzemeKategori.KategoriAdi='Antibiyotik' and MalzemeStok.MalzemeMiktari>0

**************************************************************************************************
16
eczanenin bugüne kadar almýþ olduðu malzemelerin kim tarafýndan hangi üretici tarafýndan alýndýklarýný hangi tarihte alýndýklarýný listeleyiniz..

select Malzeme.MalzemeKodu,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.FormAdi,MalzemeKategori.KategoriAdi,Fiyat.SatisFiyati,Uretici.UreticiAdi,Personel.PersonelAdi,Personel.PersonelSoyadi,Personel.PersonelTCNo,PersonelBirimi.BirimAdi,PersonelUnvan.UnvanAdi,AlimFatura.FaturaTarihi from Malzeme,MalzemeAlimDetay,MalzemeAlim,AlimFatura,MalzemeAmbalaj,MalzemeFormu,MalzemeKategori,Uretici,Fiyat,Personel,PersonelBirimi,PersonelUnvan where MalzemeAlim.MalzemeAlimId=MalzemeAlimDetay.AlimId and Malzeme.MalzemeKodu=MalzemeAlimDetay.MalzemeKodu and AlimFatura.MalzemeAlimId=MalzemeAlim.MalzemeAlimId and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and Malzeme.MalzemeFormId=MalzemeFormu.MalzemeFormId and MalzemeKategori.MalzemeKategoriId=Malzeme.MalzemeKategoriId and Malzeme.UreticiId=Uretici.UreticiId and Malzeme.FiyatId=Fiyat.FiyatId and Personel.BirimNo=PersonelBirimi.BirimNo and Personel.UnvanId=PersonelUnvan.UnvanId and AlimFatura.PersonelId=Personel.PersonelTCNo order by Malzeme.MalzemeKodu 




******************************
17
bugüne kadar yapýlan alýmlarýn ortalama fiyatý nedir??

select AVG(AlimFatura.ToplamTutar) from AlimFatura,Malzeme,MalzemeAlim,MalzemeAlimDetay where Malzeme.MalzemeKodu=MalzemeAlimDetay.MalzemeKodu and MalzemeAlim.MalzemeAlimId=MalzemeAlimDetay.AlimId 



******************************************************
18
eczanenin bugüne kadar kazanmýþ olduðu net gelir ne kadardýr??

select Sum(SatisFatura.ToplamTutar)-Sum(AlimFatura.ToplamTutar) from AlimFatura,Malzeme,MalzemeAlim,MalzemeAlimDetay,SatisFatura,Recete,ReceteDetay where Malzeme.MalzemeKodu=MalzemeAlimDetay.MalzemeKodu and MalzemeAlim.MalzemeAlimId=MalzemeAlimDetay.AlimId and AlimFatura.MalzemeAlimId=MalzemeAlim.MalzemeAlimId and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and SatisFatura.ReceteID=Recete.ReceteId

*****************************************************************************************
19
Personellere ödenen toplam ücret ne kadardýr.

select SUM(Personel.Maas) AS 'Personellerin Ana Para Toplamý',Sum(Personel.Prim) as 'Toplam Prim',SUM(Personel.Maas)+Sum(Personel.Prim) AS 'Toplam Maaþlarý' from Personel 


*******************************************************
20
satýlan malzemelerin herbirine %kaç kdv eklendiðini gösterecek sql sorgusunu yazýnýz.


select Fiyat.KDV,Malzeme.MalzemeAdi,Fiyat.AlisFiyati,Fiyat.SatisFiyati from Fiyat,Malzeme where Malzeme.FiyatId=Fiyat.FiyatId


******************************************************
21
Doktorlarýn çalýþmakta olduklarý hastaneleri ve hangi hastalara baktýklarýný listeleyiniz..

select Doktor.DoktorAdi,Doktor.DoktorSoyadi,Adres.Il,Doktor.DoktorKurumSicilNo,Doktor.KurumNo,SaglikKurumu.Adi,Hasta.HastaTC,Hasta.HastaAdi,Hasta.HastaSoyadi from Doktor,SaglikKurumu,Hasta,Recete,Adres where Doktor.KurumNo=SaglikKurumu.KurumNo and Recete.HastaTc=Hasta.HastaTC and Doktor.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and Doktor.Adres=Adres.IlPlaka

************************************************************
22
Hastalardan soyadlarý en az altý harf olanlarý soyadlarýna göre azalan sýrada listeleyecek sql sorgusunu yazýnýz.

select * from Hasta where Hasta.HastaSoyadi LIKE '%______%' order by Hasta.HastaSoyadi desc


***************************************************************************************************
23
doktorlardan istanbullu olup beykoz devlet hastanesinde çalýþmakta olanlarýn hastalarýnýn reçelerinde bulunan en pahalý ilacý listeleyiniz


select Doktor.DoktorAdi,Doktor.DoktorSoyadi,Doktor.KurumNo,Doktor.DoktorKurumSicilNo,Hasta.HastaAdi,Hasta.HastaSoyadi,Hasta.HastaTC,Hasta.DogumTarihi,Hasta.Cinsiyeti,Adres.Il,SaglikKurumu.Adi,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeKategori.KategoriAdi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.FormAdi,Fiyat.SatisFiyati from Doktor,SaglikKurumu,Adres,Hasta,Recete,ReceteDetay,Malzeme,Fiyat,MalzemeAmbalaj,MalzemeFormu,MalzemeKategori where Doktor.KurumNo=SaglikKurumu.KurumNo and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Recete.HastaTc=Hasta.HastaTC and Recete.DoktorKurumSicilNo=Doktor.DoktorKurumSicilNo and Hasta.Adres=Adres.IlPlaka and SaglikKurumu.Adresi=Adres.IlPlaka and Doktor.Adres=Adres.IlPlaka and SaglikKurumu.Adi LIKE'%Beykoz%' and Doktor.Adres=34 and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and Fiyat.FiyatId=Malzeme.FiyatId and Fiyat.SatisFiyati=(Select Max(Fiyat.SatisFiyati) from Doktor,SaglikKurumu,Adres,Hasta,Recete,ReceteDetay,Malzeme,Fiyat,MalzemeAmbalaj,MalzemeKategori,MalzemeFormu where Doktor.KurumNo=SaglikKurumu.KurumNo and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Recete.HastaTc=Hasta.HastaTC and Recete.DoktorKurumSicilNo=Doktor.DoktorKurumSicilNo and Hasta.Adres=Adres.IlPlaka and SaglikKurumu.Adresi=Adres.IlPlaka and Doktor.Adres=Adres.IlPlaka and SaglikKurumu.Adi LIKE'%Beykoz%' and Doktor.Adres=34 and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and Fiyat.FiyatId=Malzeme.FiyatId)


*****************************************************************************************************

24

Malzemelerden ortalamanýn üzerinde bir fiyata sahip olanlarý listeleyecek olan sql sorgusunu yazýnýz..

select Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,Fiyat.SatisFiyati from Fiyat,Malzeme where Malzeme.FiyatId=Fiyat.FiyatId and Fiyat.SatisFiyati>(
select AVG(Fiyat.SatisFiyati) from Fiyat,Malzeme where Malzeme.FiyatId=Fiyat.FiyatId)



*****************************************************************************************************
25
malzemelerin kategorilerine göre ortalama fiyatlarýný listeleyiniz.

select MalzemeKategori.KategoriAdi,AVG(Fiyat.SatisFiyati) AS [Ortalama Satýs] from Malzeme,Fiyat,MalzemeKategori where Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and Fiyat.FiyatId=Malzeme.FiyatId group by MalzemeKategori.KategoriAdi order by MalzemeKategori.KategoriAdi DESC


******************************************************************************************************
26

BEGIN TRANSACTION
UPDATE Fiyat set Fiyat.KarOrani=0
select * from Fiyat
ROLLBACK
************************************************************

27

DECLARE @say1 INT, @say2 INT, @toplam INT
SET @say1=10
SET @say2=20
SET @toplam=@say1+@say2
Select @toplam AS 'TOPLAM'

****************************************************************

28

DECLARE @enyuksekmaas MONEY
Select @enyuksekmaas=MAX(Personel.Maas) From Personel
Select @enyuksekmaas

*****************************************************************
29

SELECT @@SERVICENAME,@@SERVERNAME,@@ERROR,@@VERSION,@@LANGUAGE

SELECT * FROM sys.messages


Select 5/0
Select * from master.dbo.sysmessages where error = @@ERROR

********************************************************************
30

Declare @Personel Table(
PersonelTcNo bigint
)
insert into @Personel values(12312313213)

select Personel.PersonelTCNo,Personel.PersonelAdi,Personel.PersonelSoyadi from Personel where Personel.PersonelTCNo in (select * from @Personel)

***************************************************************

31

DECLARE @eklenen table(
ad varchar(30),
soyad varchar(30),
maas money)

insert into Personel 
Output inserted.PersonelAdi,inserted.PersonelSoyadi,inserted.Maas
into @eklenen values (32563214586,'Zek','Soyda','34','','','','','1','1','','',3000,'')

select * from @eklenen



*****************************************************************************************

32

--Maaþý 3000'e eþit olup hiç prim almayan kayýtlarý silen tsql ifadesini yazalým

DECLARE @silinenler TABLE(
ad varchar(30),
soyad varchar(30),
maas MONEY)
DELETE FROM Personel
OUTPUT deleted.PersonelAdi,deleted.PersonelSoyadi,deleted.Maas
into @silinenler
where Personel.Maas=3000 and Personel.Evlimi=0
Select * from @silinenler


********************************************************************************************

33

maaþý 1500 den az olan personelleri listeler eðer 1500den az olan personel yoksa personel yoktur diye mesaj verir.

if (select MIN(Personel.Maas) from Personel)>=1500
PRINT 'Maaþý 1500 den küçük olan perseonel yoktur.'
else 
select Personel.PersonelAdi,Personel.PersonelSoyadi,Personel.Maas from Personel where Personel.Maas<1500




***********************************************************************************************************
34
Declare @KategoridekiCesitlilikSayisi varchar(20)
select @KategoridekiCesitlilikSayisi = Count(MalzemeStok.MalzemeMiktari) from MalzemeStok,Malzeme,MalzemeKategori where Malzeme.MalzemeKodu=MalzemeStok.MalzemeId and MalzemeKategori.MalzemeKategoriId=Malzeme.MalzemeKategoriId group by MalzemeKategori.KategoriAdi order by MalzemeKategori.KategoriAdi DESC

IF(@KategoridekiCesitlilikSayisi<2)
BEGIN 
	PRINT 'Çeþitlilik Sayýsý: '+ @KategoridekiCesitlilikSayisi
	PRINT 'Çeþitlik yetersiz'
	END
ELSE IF(@KategoridekiCesitlilikSayisi>=2 AND @KategoridekiCesitlilikSayisi<=5)
BEGIN
	PRINT 'Çeþitli malzeme sayýsý: '+ @KategoridekiCesitlilikSayisi
	PRINT 'Yeterli'
END
ELSE
BEGIN 
PRINT 'Çeþitlilik sayýsý '+ @KategoridekiCesitlilikSayisi
PRINT 'Aþýrý çeþitlilik var!!!!'
END

**********************************************************************
35
Personellerin cinsiyetlerini yazdýrdým..

Use EczaneSon
GO 
Select Personel.PersonelAdi,Personel.PersonelSoyadi,'Personel.Cinsiyet'=
CASE Personel.Cinsiyet 
WHEN '1' THEN 'ERKEK'
WHEN '0' THEN 'KADIN'
END
FROM Personel order by Personel.PersonelAdi
GO


****************************************************************************
36
Urunlerin fiyatlarýndan fiyatlarý 100 altýnda olanlarda %20 artýþ 100 lira ve 200 lira arasýnda olanlarda %10 artýþ 200 lira ve 300 lira arasýnda olanlarda %15 artýþ diðer durumlar için %5 artýþ yapan tsql sorgusu

USE EczaneSon
GO
Update Fiyat
SET Fiyat.SatisFiyati = (
CASE 
	WHEN Fiyat.SatisFiyati <100 THEN Fiyat.SatisFiyati+((Fiyat.SatisFiyati*20)/100)
	WHEN Fiyat.SatisFiyati >=100 and Fiyat.SatisFiyati<=200 THEN Fiyat.SatisFiyati+((Fiyat.SatisFiyati*10)/100)
	WHEN Fiyat.SatisFiyati >200 and Fiyat.SatisFiyati<=300 THEN Fiyat.SatisFiyati+((Fiyat.SatisFiyati*15)/100)
	Else Fiyat.SatisFiyati + ((Fiyat.SatisFiyati*5)/100)
	END
)GO


Select * from Fiyat


************************************************************************************************************
37

Personellerin maaþ ortalamasý 4000 den büyük yada eþit olana kadar maaþlarýný %20 artýran t-sql ifadesini yazalým

Select 'Maas Ortalamasi= '+CAST(AVG(Personel.Maas) AS varchar(20)) from Personel
While (select AVG(Personel.Maas) From Personel)<4000 BEGIN
UPDATE Personel SET Maas=Maas*20/100+Maas
Select Personel.PersonelAdi+' '+Personel.PersonelSoyadi,Personel.Maas from Personel
END
Select 'Son Durum= '+CAST(AVG(Personel.Maas) AS varchar(20)) from Personel


**************************************************************************************************************
38
--hangi hastaya hangi malzemenin verildiðini belirten store procedure yazýnýz..

Create Procedure HastaRecete
AS
select Hasta.HastaAdi+' '+Hasta.HastaSoyadi AS 'Hasta Adý ve Soyadý',Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeKategori.KategoriAdi from Hasta,Recete,ReceteDetay,Malzeme,MalzemeAmbalaj,MalzemeFormu,MalzemeKategori where Hasta.HastaTC=Recete.HastaTc and Recete.ReceteId=ReceteDetay.ReceteId and Malzeme.MalzemeKodu=ReceteDetay.MalzemeKodu and Malzeme.MalzemeFormId=MalzemeFormu.MalzemeFormId and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId
GO

HastaRecete


**************************************************************************************************************
39

Parametre olarak TC si verilen Hastanýn adýný soyadýný ve doðum tarihini bulunuz...

Create Procedure HastaBul(
@HastaTC bigint=NULL,
@HastaAdi varchar(30)=NULL OUTPUT,
@HastaSoyadi varchar(30)=NULL OUTPUT,
@DogumTarihi date OUTPUT)
AS 
IF @HastaTC IS NOT NULL 
Select @HastaAdi=Hasta.HastaAdi,
		@HastaSoyadi=Hasta.HastaSoyadi,
		@DogumTarihi=Hasta.DogumTarihi
   from Hasta Where Hasta.HastaTC=@HastaTC
ELSE
   PRINT 'TC DEGERI BOS OLAMAZ'
GO
   Declare @HAdi varchar(30)
   Declare @Hsoyadi varchar(30)
   Declare @Tarih date
   EXECUTE HastaBul '12133454561',
@HAdi OUTPUT,
@Hsoyadi OUTPUT,@Tarih OUTPUT
Select @HAdi,@Hsoyadi,@Tarih

***************************************************************************************
40

Büyük Harfe çevirme fonksiyonu

Create Function BuyukHarf(@veri VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS 
BEGIN
	RETURN UPPER(@veri)
END


select dbo.BuyukHarf(Personel.PersonelAdi),dbo.BuyukHarf(Personel.PersonelSoyadi) from Personel



*******************************************************************************************
41

create table aaa(
sss int
)

CREATE TRIGGER silme_Engeli
ON DATABASE
FOR DROP_TABLE
AS BEGIN
PRINT 'Tablo Silme Ýþlemi yasaklanmýþtýr.'
ROLLBACK
END


drop table aaa

****************************************************************************************************
42

Create Trigger StokKontrol
on MalzemeAlimDetay
AFTER INSERT 
AS
Declare @AlimMiktari int
Declare @MalzemeKodu int
Select @AlimMiktari=MalzemeAlimDetay.Adet,@MalzemeKodu=MalzemeAlimDetay.MalzemeKodu
From MalzemeAlimDetay
UPDATE MalzemeStok SET MalzemeMiktari=MalzemeStok.MalzemeMiktari+@AlimMiktari
Where MalzemeStok.MalzemeId=@MalzemeKodu


select * from MalzemeAlim
insert into MalzemeAlim values(1,21324546231)

insert into MalzemeAlimDetay values(20,6,1,10)


select * from MalzemeAlimDetay
select * from MalzemeStok


*************************************************************************************
Create Trigger StokKontrolSatis
On ReceteDetay
AFTER INSERT 
AS
Declare @SatisMiktari int
Declare @StokMiktari int
Declare @MalzemeKodu int

Select @SatisMiktari=ReceteDetay.Adet, @MalzemeKodu=ReceteDetay.MalzemeKodu
from MalzemeStok

Select @StokMiktari=MalzemeStok.MalzemeMiktari from MalzemeStok where MalzemeStok.MalzemeId=@MalzemeKodu

IF(@SatisMiktari>@StokMiktari)
BEGIN
PRINT 'YETERSÝZ STOK MÝKTARI'
ROLLBACK
END 
ELSE 
UPDATE MalzemeStok SET MalzemeMiktari=MalzemeStok.MalzemeMiktari-@SatisMiktari
Where MalzemeStok.MalzemeId=@MalzemeKodu

**********************************************************************************************



select Malzeme.MalzemeAdi,Doktor.DoktorAdi from Malzeme,Doktor,Recete,ReceteDetay where Malzeme.MalzemeKodu=ReceteDetay.MalzemeKodu and Recete.ReceteId=ReceteDetay.ReceteId and Recete.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and ReceteDetay.MalzemeKodu in(
select Max(ReceteDetay.MalzemeKodu) from Malzeme,Doktor,Recete,ReceteDetay where Malzeme.MalzemeKodu=ReceteDetay.MalzemeKodu and Recete.ReceteId=ReceteDetay.ReceteId and Recete.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo)