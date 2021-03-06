USE [master]
GO
/****** Object:  Database [MVCForum]    Script Date: 26/06/2022 18:46:31 ******/
CREATE DATABASE [MVCForum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCForum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCForum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVCForum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCForum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVCForum] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCForum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCForum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCForum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCForum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCForum] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCForum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCForum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCForum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCForum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCForum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCForum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCForum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCForum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCForum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCForum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVCForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCForum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCForum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCForum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCForum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCForum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVCForum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCForum] SET RECOVERY FULL 
GO
ALTER DATABASE [MVCForum] SET  MULTI_USER 
GO
ALTER DATABASE [MVCForum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCForum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCForum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCForum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVCForum] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVCForum] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVCForum', N'ON'
GO
ALTER DATABASE [MVCForum] SET QUERY_STORE = OFF
GO
USE [MVCForum]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 26/06/2022 18:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Konu]    Script Date: 26/06/2022 18:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konu](
	[KonuID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriID] [int] NOT NULL,
	[UyeID] [int] NOT NULL,
	[KonuBaslik] [nvarchar](100) NOT NULL,
	[KonuIcerik] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Konu] PRIMARY KEY CLUSTERED 
(
	[KonuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 26/06/2022 18:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyeID] [int] IDENTITY(1,1) NOT NULL,
	[UyeAdi] [nchar](30) NOT NULL,
	[UyeSoyadi] [nchar](30) NOT NULL,
	[UyeMail] [nvarchar](50) NOT NULL,
	[UyeSifre] [int] NOT NULL,
	[UyeRol] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[UyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 26/06/2022 18:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[YorumID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NOT NULL,
	[KonuID] [int] NOT NULL,
	[YorumIcerigi] [nvarchar](max) NOT NULL,
	[YorumZamani] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[YorumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([KategoriID], [KategoriAdi]) VALUES (1, N'Masaüstü Bilgisayarlar')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAdi]) VALUES (2, N'Dizüstü Bilgisayarlar')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAdi]) VALUES (3, N'İşletim Sistemleri')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAdi]) VALUES (4, N'Android Telefonlar')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAdi]) VALUES (5, N'Apple iPhone')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAdi]) VALUES (6, N'Konsollar')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAdi]) VALUES (7, N'Android Tabletler')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAdi]) VALUES (8, N'iPad')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
GO
SET IDENTITY_INSERT [dbo].[Konu] ON 

INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (1, 1, 1, N'RTX 30 Serisi v2 LHR Kırıldı', N'Miningcilere selam olsun')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (2, 1, 2, N'RX 6000 Serisi Laptoplar geliyor', N'performans canavarı olacak')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (3, 1, 1, N'RTX 40 Serisi Yüksek TDP ile gelebilir', N'faturaları hazır edin :D')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (4, 5, 4, N'iOS 16 ile Kilit Ekranı Özelleştirilebilecek', N'iOS 16 ile birlikte artık iphone larında kilit ekranı özelleştirilebilecek.')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (5, 3, 5, N'Windows 11 TPM 2.0 Bypass Edildi', N'Rufus ön yükleme aracının windows 11 in tpm 2.0 zorunluluğunu kaldıran yeni sürümü yayınlandı')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (6, 2, 5, N'MSI Laptop Termal Macun Önerisi', N'Isınma ve kapanma problemi yaşıyorum arkadaşlar. Önerebileceğiniz bir termal macun var mı ?')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (7, 4, 2, N'Android 13 Beta Yayınlandı', N'Asus, Xiaomi, Oneplus ve bazı diğer telefonlara Android 13 beta geldi arkadaşlar. Deneyimlerinizi merak ediyoruz')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (8, 6, 2, N'Xbox Game Pass e Riot Games''in oyunları geliyor', N'Valorant lol Xbox Game pass e ekleniyor. Üstelik tüm ajanlar açık şekilde. Hayırlı olsun')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (9, 8, 1, N'iPadOS 16 ile Mx çipli Tabletlere DriverKit desteği geliyor', N'Bu sayede destekleyen modellere sürücü kurma özelliği geliyor.')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (10, 7, 6, N'Samsung Galaxy Tab S8 Kasma Sorunu', N'Arkadaşlar cihazımda hafif kasmalar olmaya başladı. Ne yapabilirim ?')
INSERT [dbo].[Konu] ([KonuID], [KategoriID], [UyeID], [KonuBaslik], [KonuIcerik]) VALUES (1002, 4, 2, N'Andorid 13 ile artık dışardan uygulama yüklenemeyebilir', N'Android 13 ile artık dışardan APK ile uygulama yüklenemeyebilir arkadaşlar. Kesin bilgi yok ama')
SET IDENTITY_INSERT [dbo].[Konu] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyadi], [UyeMail], [UyeSifre], [UyeRol]) VALUES (1, N'Serkan                        ', N'Doğan                         ', N'serkan@gmail.com', 123, N'Admin')
INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyadi], [UyeMail], [UyeSifre], [UyeRol]) VALUES (2, N'Ömer                          ', N'Uçar                          ', N'ömer@gmail.com', 124, N'Üye')
INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyadi], [UyeMail], [UyeSifre], [UyeRol]) VALUES (3, N'Ezel                          ', N'Bayraktar                     ', N'ezel@gmail.com', 125, N'Mod')
INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyadi], [UyeMail], [UyeSifre], [UyeRol]) VALUES (4, N'Eyşan                         ', N'Atay                          ', N'eysan@gmail.com', 126, N'Üye')
INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyadi], [UyeMail], [UyeSifre], [UyeRol]) VALUES (5, N'Ramiz                         ', N'Karaeski                      ', N'ramiz@gmail.com', 127, N'Üye')
INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyadi], [UyeMail], [UyeSifre], [UyeRol]) VALUES (6, N'Ali                           ', N'Kerpeten                      ', N'kerpeten@gmail.com', 128, N'Üye')
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yorum] ON 

INSERT [dbo].[Yorum] ([YorumID], [UyeID], [KonuID], [YorumIcerigi], [YorumZamani]) VALUES (2, 2, 1, N'v3 de kırılırsa oyuncular için yıkım olur', CAST(N'2022-06-02T19:28:41.5533333' AS DateTime2))
INSERT [dbo].[Yorum] ([YorumID], [UyeID], [KonuID], [YorumIcerigi], [YorumZamani]) VALUES (3, 2, 2, N'Masaüstünde olduğu gibi dizüstünde de Intel''e sağlam rakip geliyor', CAST(N'2022-06-02T19:50:18.1933333' AS DateTime2))
INSERT [dbo].[Yorum] ([YorumID], [UyeID], [KonuID], [YorumIcerigi], [YorumZamani]) VALUES (10, 1, 4, N'Güzel yenilik!', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yorum] ([YorumID], [UyeID], [KonuID], [YorumIcerigi], [YorumZamani]) VALUES (12, 3, 4, N'androidden iyice özellik almaya başladılar.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yorum] ([YorumID], [UyeID], [KonuID], [YorumIcerigi], [YorumZamani]) VALUES (13, 1, 1, N'RTX 40 serisinde daha iyi bir koruma gelir umarım', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yorum] ([YorumID], [UyeID], [KonuID], [YorumIcerigi], [YorumZamani]) VALUES (14, 1, 8, N'Microsoft u tebrik etmek lazım çok iyi iş çıkarıyor şu Xbox ile', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yorum] ([YorumID], [UyeID], [KonuID], [YorumIcerigi], [YorumZamani]) VALUES (1002, 4, 6, N'Cooler master markasından alabilirsiniz', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yorum] ([YorumID], [UyeID], [KonuID], [YorumIcerigi], [YorumZamani]) VALUES (1003, 2, 6, N'Arctic markasına da bakın. Çok iyidir.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Yorum] OFF
GO
ALTER TABLE [dbo].[Yorum] ADD  CONSTRAINT [DF_Yorum_YorumZamani]  DEFAULT (getdate()) FOR [YorumZamani]
GO
ALTER TABLE [dbo].[Konu]  WITH CHECK ADD  CONSTRAINT [FK_Konu_Kategori] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategori] ([KategoriID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Konu] CHECK CONSTRAINT [FK_Konu_Kategori]
GO
ALTER TABLE [dbo].[Konu]  WITH CHECK ADD  CONSTRAINT [FK_Konu_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Konu] CHECK CONSTRAINT [FK_Konu_Uyeler]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Konu] FOREIGN KEY([KonuID])
REFERENCES [dbo].[Konu] ([KonuID])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Konu]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Uyeler]
GO
USE [master]
GO
ALTER DATABASE [MVCForum] SET  READ_WRITE 
GO
