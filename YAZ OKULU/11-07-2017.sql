Select Uye.Uye_No, Count(Soru.Uye_No) from Soru,Uye where Soru.Uye_No=Uye.Uye_No group by Uye.Uye_No

--> Benim SOrgum
select distinct Soru.Soru_Tur_No,Soru_Tur.Soru_Tür_Adi,Soru.Soru_Puan from Soru_Tur,Soru where Soru.Soru_Tur_No=Soru_Tur.Soru_Tur_No and Soru.Soru_Puan=( select MAX(Soru.Soru_Puan) from Soru)
--> Hocanýn Sorgusu
select Soru_Tur.Soru_Tür_Adi, MAX(Soru.Soru_Puan) AS 'EN YÜKSEK PUAN' from Soru,Soru_Tur where Soru.Soru_Tur_No=Soru_Tur.Soru_Tur_No group by Soru_Tur.Soru_Tür_Adi


-->Benim sorgum
select Uye.Uye_Adi,Uye.Uye_Soyadi,Il.Il_Adi from Uye,Il where Il.Plaka_No=Uye.Plaka_No and Uye.Uye_No IN (Select Soru.Uye_No from Soru where Soru.Soru_Tur_No IN (select Soru_Tur.Soru_Tur_No from Soru_Tur ) )
--> Hocanýn Sorgusu
select Uye.Uye_Adi,Uye.Uye_Soyadi,Il.Il_Adi from Il,Uye where Il.Plaka_No=Uye.Plaka_No
and Uye.Uye_No IN (
select s2.Uye_No from (select s1.Uye_No as Uye_No, COUNT(s1.Uye_No) as stno_say from (select Uye.Uye_No as Uye_No, Soru_Tur.Soru_Tür_Adi, COUNT(Soru_Tur.Soru_Tur_No) as a from Soru,Uye,Soru_Tur where soru.Uye_No=Uye.Uye_No and  Soru_Tur.Soru_Tur_No = Soru.Soru_Tur_No group by Uye.Uye_No, Soru_Tur.Soru_Tür_Adi) s1 group by s1.Uye_No having (Count(s1.Uye_No)<=2)) s2) 
and Uye.Uye_No IN (select Uye.Uye_No from Uye,istatistik where istatistik.Uye_No=Uye.Uye_No and Uye.Uye_Puan>= istatistik.Toplam_Puan*5 and istatistik.Istatistik_Tarihi<GETDATE())



Select uye.Uye_Adi,uye.Uye_Soyadi,(select Il.Il_Adi from Il where ýl.Plaka_No=uye.Plaka_No) AS 'IL ' from uye

select MAX(tb1.st_say) from (select Soru_Tur.Soru_Tür_Adi as stadi,COUNT(Soru.Soru_No) as st_say from Soru,Soru_Tur where Soru.Soru_Tur_No=Soru_Tur.Soru_Tur_No group by Soru_Tur.Soru_Tür_Adi) tb1

create view liste1 (uyeadi,uyesoyadi,iladi) AS select Uye.Uye_Adi,Uye.Uye_Soyadi,Il.Il_Adi from Uye INNER JOIN Il ON Il.Plaka_No=Uye.Plaka_No


