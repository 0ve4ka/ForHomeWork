USE [movie_theatre]
GO
/****** Object:  Table [dbo].[hall_row]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hall_row](
	[id_hall] [int] NOT NULL,
	[number] [smallint] NOT NULL,
	[capacity] [smallint] NOT NULL,
 CONSTRAINT [PK_hall_row] PRIMARY KEY CLUSTERED 
(
	[id_hall] ASC,
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hall]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hall](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_hall] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CapacityHall]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CapacityHall]
AS
SELECT        TOP (100) PERCENT dbo.hall.name, dbo.hall_row.capacity
FROM            dbo.hall INNER JOIN
                         dbo.hall_row ON dbo.hall.id = dbo.hall_row.id_hall
WHERE        (dbo.hall_row.number = 2) AND (dbo.hall_row.id_hall = 3)
ORDER BY dbo.hall.name
GO
/****** Object:  Table [dbo].[film]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_film] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[screening]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[screening](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hall_id] [int] NOT NULL,
	[film_id] [int] NOT NULL,
	[time] [datetime] NOT NULL,
 CONSTRAINT [PK_screening] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        TOP (100) PERCENT dbo.film.name, dbo.screening.time
FROM            dbo.film INNER JOIN
                         dbo.screening ON dbo.film.id = dbo.screening.film_id
WHERE        (dbo.screening.time >= N'2021-01-01 11:00:00.000')
ORDER BY dbo.film.name
GO
/****** Object:  View [dbo].[View_3]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT        dbo.film.name, dbo.hall.name AS Expr1, dbo.screening.time
FROM            dbo.film INNER JOIN
                         dbo.screening ON dbo.film.id = dbo.screening.film_id INNER JOIN
                         dbo.hall ON dbo.screening.hall_id = dbo.hall.id
WHERE        (dbo.screening.hall_id = 1)
GO
/****** Object:  View [dbo].[View_4]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_4]
AS
SELECT        dbo.film.name, dbo.hall.name AS Expr1, dbo.screening.time
FROM            dbo.film INNER JOIN
                         dbo.screening ON dbo.film.id = dbo.screening.film_id INNER JOIN
                         dbo.hall ON dbo.screening.hall_id = dbo.hall.id
WHERE        (dbo.screening.film_id = 2)
GO
/****** Object:  Table [dbo].[tickets]    Script Date: 31.01.2024 17:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets](
	[id_screening] [int] NOT NULL,
	[row] [smallint] NOT NULL,
	[seat] [smallint] NOT NULL,
	[cost] [int] NOT NULL,
 CONSTRAINT [PK_tickets] PRIMARY KEY CLUSTERED 
(
	[id_screening] ASC,
	[row] ASC,
	[seat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[film] ON 

INSERT [dbo].[film] ([id], [name], [description]) VALUES (1, N'Багратион', N'"Багратион" - 
советский двухсерийный 
историко-биографический фильм 1985 года
о жизни прославленного российского 
полководца Петра Ивановича Багратиона - 
героя Отечественной войны 1812 года. 
Совместное производство "Грузия-фильм" 
и "Мосфильм". Режиссёры Гиули Чохонелидзе
и Карман Мгеладзе. Премьера - декабрь 1985
года. ')
INSERT [dbo].[film] ([id], [name], [description]) VALUES (2, N'Мастер и маргарита', N'Интересный роман')
INSERT [dbo].[film] ([id], [name], [description]) VALUES (3, N'Губка-Боб квадратные штаны', N'Интересный мультик')
INSERT [dbo].[film] ([id], [name], [description]) VALUES (4, N'Маша и Медведь', N'мультик')
INSERT [dbo].[film] ([id], [name], [description]) VALUES (5, N'Мстители: финал', N'кино')
SET IDENTITY_INSERT [dbo].[film] OFF
GO
SET IDENTITY_INSERT [dbo].[hall] ON 

INSERT [dbo].[hall] ([id], [name]) VALUES (1, N'Красный зал')
INSERT [dbo].[hall] ([id], [name]) VALUES (2, N'Жёлтый зал')
INSERT [dbo].[hall] ([id], [name]) VALUES (3, N'Синий зал')
INSERT [dbo].[hall] ([id], [name]) VALUES (4, N'белй зал')
INSERT [dbo].[hall] ([id], [name]) VALUES (5, N'чёрный зал')
INSERT [dbo].[hall] ([id], [name]) VALUES (6, N'Просто зал')
INSERT [dbo].[hall] ([id], [name]) VALUES (7, N'VIP комната на двоих')
SET IDENTITY_INSERT [dbo].[hall] OFF
GO
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (1, 1, 10)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (1, 2, 15)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (1, 3, 20)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (2, 1, 123)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (3, 1, 1)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (3, 2, 12)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (4, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[screening] ON 

INSERT [dbo].[screening] ([id], [hall_id], [film_id], [time]) VALUES (1, 1, 1, CAST(N'2021-01-01T10:35:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [time]) VALUES (2, 1, 2, CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [time]) VALUES (3, 1, 1, CAST(N'2021-01-01T13:35:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [time]) VALUES (4, 2, 2, CAST(N'2020-01-01T11:12:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [time]) VALUES (5, 1, 4, CAST(N'2019-01-01T01:12:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [time]) VALUES (6, 3, 3, CAST(N'2022-01-01T16:20:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [time]) VALUES (7, 4, 5, CAST(N'2011-01-01T11:11:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[screening] OFF
GO
INSERT [dbo].[tickets] ([id_screening], [row], [seat], [cost]) VALUES (1, 2, 3, 150)
INSERT [dbo].[tickets] ([id_screening], [row], [seat], [cost]) VALUES (1, 3, 3, 200)
INSERT [dbo].[tickets] ([id_screening], [row], [seat], [cost]) VALUES (1, 3, 5, 150)
INSERT [dbo].[tickets] ([id_screening], [row], [seat], [cost]) VALUES (2, 2, 2, 200)
INSERT [dbo].[tickets] ([id_screening], [row], [seat], [cost]) VALUES (3, 3, 3, 185)
INSERT [dbo].[tickets] ([id_screening], [row], [seat], [cost]) VALUES (4, 4, 4, 123)
INSERT [dbo].[tickets] ([id_screening], [row], [seat], [cost]) VALUES (5, 5, 5, 545)
INSERT [dbo].[tickets] ([id_screening], [row], [seat], [cost]) VALUES (6, 6, 6, 123)
GO
ALTER TABLE [dbo].[hall_row]  WITH CHECK ADD  CONSTRAINT [FK_hall_row_hall] FOREIGN KEY([id_hall])
REFERENCES [dbo].[hall] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hall_row] CHECK CONSTRAINT [FK_hall_row_hall]
GO
ALTER TABLE [dbo].[screening]  WITH CHECK ADD  CONSTRAINT [FK_screening_film] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[screening] CHECK CONSTRAINT [FK_screening_film]
GO
ALTER TABLE [dbo].[screening]  WITH CHECK ADD  CONSTRAINT [FK_screening_hall] FOREIGN KEY([hall_id])
REFERENCES [dbo].[hall] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[screening] CHECK CONSTRAINT [FK_screening_hall]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [FK_tickets_screening] FOREIGN KEY([id_screening])
REFERENCES [dbo].[screening] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [FK_tickets_screening]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hall"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hall_row"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CapacityHall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CapacityHall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "film"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "screening"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "film"
            Begin Extent = 
               Top = 160
               Left = 6
               Bottom = 273
               Right = 176
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hall"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "screening"
            Begin Extent = 
               Top = 157
               Left = 484
               Bottom = 287
               Right = 654
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "film"
            Begin Extent = 
               Top = 173
               Left = 39
               Bottom = 286
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hall"
            Begin Extent = 
               Top = 0
               Left = 203
               Bottom = 96
               Right = 373
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "screening"
            Begin Extent = 
               Top = 182
               Left = 461
               Bottom = 312
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
