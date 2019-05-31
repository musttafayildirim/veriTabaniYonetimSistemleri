use YarismaSitesi

--if
declare @us int
select @us=COUNT(Uye.UNo) from Uye

if(@us>=0 and @us<=5)
	begin
		print('Uye sayisi:'+cast(@us as varchar(10)))
		print('Az sayida uye var...')
	end
else if(@us>5 and @us<=20)
	begin
		print('Uye sayisi:'+cast(@us as varchar(10)))
		print('Yeterli sayida uye var...')
	end
else
	begin
		print('Uye sayisi:'+cast(@us as varchar(10)))
		print('Cok uye var...')
	end
GO

--Case
alter table Uye add Cinsiyet bit NULL

update Uye set Cinsiyet=1

insert into Uye values ('Şakire','Akağaç','',1,'123',2,25,0)

--
select Uye.UAdi,Uye.USoyadi,Uye.Cinsiyet,Cinsiyeti=
	Case Uye.Cinsiyet
		when 1 then 'Erkek'
		when 0 then 'Bayan'
	end
from Uye

--while 1-10 arası yazdıracak

declare @sayac int
set @sayac=1
while (@sayac<=10)
	begin
		print(@sayac)
		set @sayac+=1
	end

go

--bir sayının asal sayı olup olmadığını gösteren kod

declare @sayi int
declare @say int
declare @durum int
set @sayi=70
set @say=1
set @durum=0
while(@say<=(@sayi-1))
	begin
		if((@sayi%@say=0) and (@say!=1))
			begin
				set @durum=1
			end
		set @say+=1
	end

if(@durum=1)
	begin
		print('Sayı asal değildir.')
	end
else
	begin
		print('Sayı asaldır.')
	end

go

--sınavda çıkabilecek tarzda bi soru olabilirmiş
--yarışma sitesi veritabanı üzerinde oluşturulacak yeni bir tabloda her bir 
--üyenin bugune kadar çözmüş olduğu sorular ve bu sorulara vermiş olduğu cevaplar tutulacaktır. Gerekli olan alanları belirleyerek bu tabloyu oluşturunuz
--Daha sonra her bir üyenin bugune kadar kaç tane soru çözdüğünü bu sorulardan kaçına doğru cevap veridğini kaç tanesine yanlış cevap veridğini almış 
--olduğu toplam puanı ekranda listeleyecek T-SQL kodlarını ve sql sorgusunu yazınız.

create table cozulmus(CNo int primary key,Uno int foreign key references Uye(Uno),SNo int foreign key references Soru(SNo),Cevap varchar(5))

declare @sayac int
select Uye.UAdi,Uye.USoyadi,Sum(cozulmus.CNo) as 'toplam çözülen',cozulmus.Cevap,Soru.DC as 'Doğru cevabı',durum=

	Case Soru.DC
		when cozulmus.Cevap then 'doğru yanıt'
		else 'yanlış yanıt'
	end,
	while(COUNT())
		begin
			--Eksik var çöz
		end

from cozulmus inner join Soru on cozulmus.SNo=Soru.SNo 
		  inner join Uye on Uye.UNo=cozulmus.Uno
		  inner join 
 group by Uye.UAdi,Uye.USoyadi,cozulmus.CNO,cozulmus.Cevap,Soru.DC,Soru.SPuan


 go
 --Hata Yakalama
begin try
	select 5/0
end try
begin catch
	select ERROR_LINE() as 'Hata Satırı: ',ERROR_NUMBER() as 'Hata Numarası:',ERROR_MESSAGE() as 'Hata Mesajı: ',ERROR_SEVERITY() as 'Hata Derecesi:'
end catch

