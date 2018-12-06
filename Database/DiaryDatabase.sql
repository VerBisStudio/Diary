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
  IdTask ASC
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

INSERT INTO [User] ([Login], [Password], Mail, Birthday)
VALUES ('test', 'test', 'mail', '2018-11-11') 
INSERT INTO [User] ([Login], [Password], Mail, Birthday)
VALUES ('test1', 'test', 'mail1', '2018-11-11') 
INSERT INTO [User] ([Login], [Password], Mail, Birthday)
VALUES ('test2', 'test', 'mail2', '2018-11-11') 
GO

INSERT INTO Task (NameTask, IsComplete, DateTask)
VALUES ('test', 0, '2018-11-11') 
INSERT INTO Task (NameTask, IsComplete, DateTask)
VALUES ('test', 0, '2018-11-11')
INSERT INTO Task (NameTask, IsComplete, DateTask)
VALUES ('test', 0, '2018-11-11') 
GO

INSERT INTO UserTask(IdUser, IdTask)
VALUES (1,1) 
INSERT INTO UserTask(IdUser, IdTask)
VALUES (2,2) 
INSERT INTO UserTask(IdUser, IdTask)
VALUES (3,3) 
GO


IF OBJECT_ID('GetLoginId') IS NOT NULL
	DROP PROCEDURE GetLoginId
GO
CREATE PROCEDURE GetLoginId
	@Login NVARCHAR(16),
	@Password NVARCHAR(16)
	AS
	DECLARE @idUser INT

	SET @idUser = (SELECT TOP(1) [User].idUser FROM [User]
	WHERE [User].Login = @Login AND [User].Password = @Password)
	RETURN ISNULL(@idUser, -1)
GO

CREATE PROCEDURE AddUser
@Login NVARCHAR(50),
@Password NVARCHAR(50),
@Mail NVARCHAR(50),
@Birthday Date

AS
BEGIN
INSERT [User]
VALUES (@Login, @Password, @Mail, @Birthday)
END
GO


IF OBJECT_ID('AddTask') IS NOT NULL
	DROP PROCEDURE AddTask
GO
CREATE PROCEDURE AddTask
	@idUser INT,
	@NameTask NVARCHAR(127)
	AS
	
	DECLARE @idTask TABLE(id INT)

	INSERT INTO [Task] OUTPUT INSERTED.idTask INTO @idTask VALUES (@NameTask, 0, GETDATE())
	INSERT INTO [UserTask] VALUES(@idUser, (SELECT TOP(1) * FROM @idTask))
GO

CREATE PROCEDURE DelTask
@IdTask INT
AS
BEGIN 
DELETE UserTask
WHERE IdTask = @IdTask
DELETE Task
WHERE IdTask=@IdTask
END

execute DelTask 1
