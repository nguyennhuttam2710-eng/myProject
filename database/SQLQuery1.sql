CREATE TABLE [dbo].[AdminUsers] (
    [IDUser]       INT            IDENTITY (1, 1)     NOT NULL,
    [NameUser]     NVARCHAR (MAX) NULL,
    [RoleUser]     NVARCHAR (MAX) NULL,
    [PasswordUser] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([IDUser] ASC)
);

CREATE TABLE [dbo].[Guesses] (
    [IDGuess]      INT            IDENTITY (1, 1) NOT NULL,
    [NameGuess]    NVARCHAR (MAX) NULL,
    [EmailGuess]   NVARCHAR (MAX) NULL,
    [PasswordGuess] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([IDGuess] ASC)
);

CREATE TABLE [dbo].[News] (
    [NewsID]     INT             IDENTITY (1, 1) NOT NULL,
    [Header]    NVARCHAR (200)  NULL,
    [Content]   NVARCHAR (MAX)  NULL,
    [Posted]    DATETIME DEFAULT GETDATE(),
    [IDUser]        INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([NewsID] ASC),
    CONSTRAINT [FK_Pro_AdminUsers] FOREIGN KEY ([IDUser]) REFERENCES [dbo].[AdminUsers] ([IDUser])
);