
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/13/2015 13:24:38
-- Generated from EDMX file: D:\Users\northedw\Documents\Visual Studio 2013\PeakF1\PeakF1.Data\PeakF1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PeakF1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PredictionPredictionDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PredictionDetail] DROP CONSTRAINT [FK_PredictionPredictionDetail];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPrediction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Prediction] DROP CONSTRAINT [FK_UserPrediction];
GO
IF OBJECT_ID(N'[dbo].[FK_RacePrediction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Prediction] DROP CONSTRAINT [FK_RacePrediction];
GO
IF OBJECT_ID(N'[dbo].[FK_PredictionDetailDriver]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PredictionDetail] DROP CONSTRAINT [FK_PredictionDetailDriver];
GO
IF OBJECT_ID(N'[dbo].[FK_RaceRaceResult]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RaceResult] DROP CONSTRAINT [FK_RaceRaceResult];
GO
IF OBJECT_ID(N'[dbo].[FK_SeasonRace]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Race] DROP CONSTRAINT [FK_SeasonRace];
GO
IF OBJECT_ID(N'[dbo].[FK_TeamDriver]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Driver] DROP CONSTRAINT [FK_TeamDriver];
GO
IF OBJECT_ID(N'[dbo].[FK_SeasonTeam_Season]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SeasonTeam] DROP CONSTRAINT [FK_SeasonTeam_Season];
GO
IF OBJECT_ID(N'[dbo].[FK_SeasonTeam_Team]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SeasonTeam] DROP CONSTRAINT [FK_SeasonTeam_Team];
GO
IF OBJECT_ID(N'[dbo].[FK_RaceResultDriver]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RaceResult] DROP CONSTRAINT [FK_RaceResultDriver];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Prediction]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Prediction];
GO
IF OBJECT_ID(N'[dbo].[PredictionDetail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PredictionDetail];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[dbo].[Race]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Race];
GO
IF OBJECT_ID(N'[dbo].[Driver]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Driver];
GO
IF OBJECT_ID(N'[dbo].[RaceResult]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RaceResult];
GO
IF OBJECT_ID(N'[dbo].[Season]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Season];
GO
IF OBJECT_ID(N'[dbo].[Team]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Team];
GO
IF OBJECT_ID(N'[dbo].[SeasonTeam]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SeasonTeam];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Prediction'
CREATE TABLE [dbo].[Prediction] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [RaceId] int  NOT NULL,
    [TotalScore] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'PredictionDetail'
CREATE TABLE [dbo].[PredictionDetail] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PredictionId] int  NOT NULL,
    [DriverId] int  NOT NULL,
    [Position] int  NOT NULL,
    [Score] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [TwitterHandle] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Race'
CREATE TABLE [dbo].[Race] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SeasonId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Driver'
CREATE TABLE [dbo].[Driver] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TeamId] int  NOT NULL
);
GO

-- Creating table 'RaceResult'
CREATE TABLE [dbo].[RaceResult] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Position] nvarchar(max)  NOT NULL,
    [Points] int  NOT NULL,
    [RaceId] int  NOT NULL,
    [DriverId] int  NOT NULL
);
GO

-- Creating table 'Season'
CREATE TABLE [dbo].[Season] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL
);
GO

-- Creating table 'Team'
CREATE TABLE [dbo].[Team] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'SeasonTeam'
CREATE TABLE [dbo].[SeasonTeam] (
    [Seasons_Id] int  NOT NULL,
    [Teams_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Prediction'
ALTER TABLE [dbo].[Prediction]
ADD CONSTRAINT [PK_Prediction]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PredictionDetail'
ALTER TABLE [dbo].[PredictionDetail]
ADD CONSTRAINT [PK_PredictionDetail]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Race'
ALTER TABLE [dbo].[Race]
ADD CONSTRAINT [PK_Race]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Driver'
ALTER TABLE [dbo].[Driver]
ADD CONSTRAINT [PK_Driver]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RaceResult'
ALTER TABLE [dbo].[RaceResult]
ADD CONSTRAINT [PK_RaceResult]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Season'
ALTER TABLE [dbo].[Season]
ADD CONSTRAINT [PK_Season]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Team'
ALTER TABLE [dbo].[Team]
ADD CONSTRAINT [PK_Team]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Seasons_Id], [Teams_Id] in table 'SeasonTeam'
ALTER TABLE [dbo].[SeasonTeam]
ADD CONSTRAINT [PK_SeasonTeam]
    PRIMARY KEY CLUSTERED ([Seasons_Id], [Teams_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PredictionId] in table 'PredictionDetail'
ALTER TABLE [dbo].[PredictionDetail]
ADD CONSTRAINT [FK_PredictionPredictionDetail]
    FOREIGN KEY ([PredictionId])
    REFERENCES [dbo].[Prediction]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PredictionPredictionDetail'
CREATE INDEX [IX_FK_PredictionPredictionDetail]
ON [dbo].[PredictionDetail]
    ([PredictionId]);
GO

-- Creating foreign key on [UserId] in table 'Prediction'
ALTER TABLE [dbo].[Prediction]
ADD CONSTRAINT [FK_UserPrediction]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPrediction'
CREATE INDEX [IX_FK_UserPrediction]
ON [dbo].[Prediction]
    ([UserId]);
GO

-- Creating foreign key on [RaceId] in table 'Prediction'
ALTER TABLE [dbo].[Prediction]
ADD CONSTRAINT [FK_RacePrediction]
    FOREIGN KEY ([RaceId])
    REFERENCES [dbo].[Race]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RacePrediction'
CREATE INDEX [IX_FK_RacePrediction]
ON [dbo].[Prediction]
    ([RaceId]);
GO

-- Creating foreign key on [DriverId] in table 'PredictionDetail'
ALTER TABLE [dbo].[PredictionDetail]
ADD CONSTRAINT [FK_PredictionDetailDriver]
    FOREIGN KEY ([DriverId])
    REFERENCES [dbo].[Driver]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PredictionDetailDriver'
CREATE INDEX [IX_FK_PredictionDetailDriver]
ON [dbo].[PredictionDetail]
    ([DriverId]);
GO

-- Creating foreign key on [SeasonId] in table 'Race'
ALTER TABLE [dbo].[Race]
ADD CONSTRAINT [FK_SeasonRace]
    FOREIGN KEY ([SeasonId])
    REFERENCES [dbo].[Season]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SeasonRace'
CREATE INDEX [IX_FK_SeasonRace]
ON [dbo].[Race]
    ([SeasonId]);
GO

-- Creating foreign key on [TeamId] in table 'Driver'
ALTER TABLE [dbo].[Driver]
ADD CONSTRAINT [FK_TeamDriver]
    FOREIGN KEY ([TeamId])
    REFERENCES [dbo].[Team]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeamDriver'
CREATE INDEX [IX_FK_TeamDriver]
ON [dbo].[Driver]
    ([TeamId]);
GO

-- Creating foreign key on [Seasons_Id] in table 'SeasonTeam'
ALTER TABLE [dbo].[SeasonTeam]
ADD CONSTRAINT [FK_SeasonTeam_Season]
    FOREIGN KEY ([Seasons_Id])
    REFERENCES [dbo].[Season]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Teams_Id] in table 'SeasonTeam'
ALTER TABLE [dbo].[SeasonTeam]
ADD CONSTRAINT [FK_SeasonTeam_Team]
    FOREIGN KEY ([Teams_Id])
    REFERENCES [dbo].[Team]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SeasonTeam_Team'
CREATE INDEX [IX_FK_SeasonTeam_Team]
ON [dbo].[SeasonTeam]
    ([Teams_Id]);
GO

-- Creating foreign key on [RaceId] in table 'RaceResult'
ALTER TABLE [dbo].[RaceResult]
ADD CONSTRAINT [FK_RaceRaceResult]
    FOREIGN KEY ([RaceId])
    REFERENCES [dbo].[Race]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RaceRaceResult'
CREATE INDEX [IX_FK_RaceRaceResult]
ON [dbo].[RaceResult]
    ([RaceId]);
GO

-- Creating foreign key on [DriverId] in table 'RaceResult'
ALTER TABLE [dbo].[RaceResult]
ADD CONSTRAINT [FK_RaceResultDriver]
    FOREIGN KEY ([DriverId])
    REFERENCES [dbo].[Driver]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RaceResultDriver'
CREATE INDEX [IX_FK_RaceResultDriver]
ON [dbo].[RaceResult]
    ([DriverId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------