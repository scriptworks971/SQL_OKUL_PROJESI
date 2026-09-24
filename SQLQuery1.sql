CREATE DATABASE IlkVeritabanim;
GO

USE IlkVeritabanim;
GO


INSERT INTO Bolumler (BolumAdi) VALUES ('Bilgisayar Programciligi');
INSERT INTO Bolumler (BolumAdi) VALUES ('Makine');
GO


INSERT INTO Ogrenciler (Ad, Soyad, BolumID) VALUES ('Ahmet', 'Yilmaz', 1);
INSERT INTO Ogrenciler (Ad, Soyad, BolumID) VALUES ('Ayse', 'Demir', 1);
INSERT INTO Ogrenciler (Ad, Soyad, BolumID) VALUES ('Mehmet', 'Kaya', 2);
GO

INSERT INTO Dersler (DersAdi, Kredi) VALUES ('Veritabani Yonetimi', 4);
INSERT INTO Dersler (DersAdi, Kredi) VALUES ('Matematik', 3);
GO


INSERT INTO Notlar (OgrenciID, DersID, Vize, Final) VALUES (1, 1, 70, 80);
INSERT INTO Notlar (OgrenciID, DersID, Vize, Final) VALUES (1, 2, 50, 60);
INSERT INTO Notlar (OgrenciID, DersID, Vize, Final) VALUES (2, 1, 85, 90);
INSERT INTO Notlar (OgrenciID, DersID, Vize, Final) VALUES (3, 2, 40, 55);
GO


IF OBJECT_ID (N'dbo.Fn_OrtalamaHesapla', N'FN') IS NOT NULL
    DROP FUNCTION dbo.Fn_OrtalamaHesapla;
GO

CREATE FUNCTION dbo.Fn_OrtalamaHesapla (@Vize INT, @Final INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @Ortalama DECIMAL(5,2);
    SET @Ortalama = (@Vize * 0.4) + (@Final * 0.6);
    RETURN @Ortalama;
END;
GO


SELECT 
    o.Ad, 
    o.Soyad, 
    d.DersAdi, 
    n.Vize, 
    n.Final, 
    dbo.Fn_OrtalamaHesapla(n.Vize, n.Final) AS Ortalama
FROM Notlar n
JOIN Ogrenciler o ON n.OgrenciID = o.OgrenciID
JOIN Dersler d ON n.DersID = d.DersID;
GO