select * from tblFutbolcu,tblPozisyon,tblTakim where tblPozisyon.pozisyonId=tblFutbolcu.futbolcuPozisyonId and tblFutbolcu.futbolcuTakimId=tblTakim.takimId and tblPozisyon.pozisyonBilgisi in ( 

SELECT tblPozisyon.pozisyonBilgisi FROM tblPozisyon,tblFutbolcu,tblTakim where tblPozisyon.pozisyonId=tblFutbolcu.futbolcuPozisyonId and tblFutbolcu.futbolcuTakimId=tblTakim.takimId  GROUP BY tblFutbolcu.futbolcuPozisyonId,tblPozisyon.pozisyonBilgisi HAVING COUNT(tblFutbolcu.futbolcuPozisyonId) > 1) and 

tblTakim.takimAdi in ( 

SELECT tblTakim.takimAdi FROM tblPozisyon,tblFutbolcu,tblTakim where tblPozisyon.pozisyonId=tblFutbolcu.futbolcuPozisyonId and tblFutbolcu.futbolcuTakimId=tblTakim.takimId  GROUP BY tblTakim.takimAdi HAVING COUNT(tblTakim.takimAdi) > 1)







select * from tblFutbolcu,tblPozisyon,tblTakim where tblPozisyon.pozisyonId=tblFutbolcu.futbolcuPozisyonId and tblFutbolcu.futbolcuTakimId=tblTakim.takimId and tblFutbolcu.futbolcuPozisyonId in ( 
SELECT COUNT(tblFutbolcu.futbolcuPozisyonId) AS SAYI
FROM tblFutbolcu,tblPozisyon WHERE tblPozisyon.pozisyonId=tblFutbolcu.futbolcuPozisyonId
GROUP BY tblFutbolcu.futbolcuPozisyonId,tblPozisyon.pozisyonBilgisi
HAVING COUNT(*)>1)



select tblPozisyon.pozisyonBilgisi, count(tblPozisyon.pozisyonBilgisi) from tblFutbolcu,tblPozisyon where tblPozisyon.pozisyonId=tblFutbolcu.futbolcuPozisyonId group by tblPozisyon.pozisyonBilgisi


