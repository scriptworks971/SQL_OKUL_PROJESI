USE Ilkveritabanim;
GO

SELECT 
     o.Ad,
     o.Soyad,
     b.BolumAdi
FROM Ogrenciler o
INNER JOIN Bolumler b ON o.BolumID = b.BolumID;
--GO