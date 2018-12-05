USE [master]
GO

IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'Diary')
	DROP DATABASE Diary
CREATE DATABASE Diary
GO

USE [Diary]
GO

CREATE TABLE [User] (
	IdUser INT NOT NULL IDENTITY(1,1),
	[Login] NVARCHAR(16) NOT NULL UNIQUE,
	[Password] NVARCHAR(16) NOT NULL,
	Mail NVARCHAR(31) NOT NULL UNIQUE,
	Birthday DATE NOT NULL,
  CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED
  (
  [IdUser] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Task] (
	IdTask INT NOT NULL IDENTITY(1,1),
	NameTask NVARCHAR(127) NOT NULL,
	IsComplete BIT NULL DEFAULT 0,
	DateTask DATE NOT NULL,
  CONSTRAINT [PK_TASK] PRIMARY KEY CLUSTERED
  (
  [IdTask] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE UserTask (
	IdUser INT NOT NULL,
	IdTask INT NOT NULL
)
GO


ALTER TABLE [UserTask] WITH CHECK ADD CONSTRAINT [UserTask_fk0] FOREIGN KEY ([IdUser]) REFERENCES [User]([IdUser])
ON UPDATE CASCADE
GO
ALTER TABLE [UserTask] CHECK CONSTRAINT [UserTask_fk0]
GO
ALTER TABLE [UserTask] WITH CHECK ADD CONSTRAINT [UserTask_fk1] FOREIGN KEY ([IdTask]) REFERENCES [Task]([IdTask])
ON UPDATE CASCADE
GO
ALTER TABLE [UserTask] CHECK CONSTRAINT [UserTask_fk1]
GO


