USE DatanautDB;
GO

--TriggerCreatedAt and UpdatedAt 

-- Member
ALTER TABLE Member ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE Member ADD UpdatedAt DATETIME2 NULL;

-- Skill
ALTER TABLE Skill ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE Skill ADD UpdatedAt DATETIME2 NULL;

-- MemberSkill
ALTER TABLE MemberSkill ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE MemberSkill ADD UpdatedAt DATETIME2 NULL;

-- Project
ALTER TABLE Project ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE Project ADD UpdatedAt DATETIME2 NULL;

-- ProjectMember
ALTER TABLE ProjectMember ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE ProjectMember ADD UpdatedAt DATETIME2 NULL;

-- Activity
ALTER TABLE Activity ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE Activity ADD UpdatedAt DATETIME2 NULL;

-- TimeLog
ALTER TABLE TimeLog ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE TimeLog ADD UpdatedAt DATETIME2 NULL;

-- Resource
ALTER TABLE Resource ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE Resource ADD UpdatedAt DATETIME2 NULL;

-- ProjectResource
ALTER TABLE ProjectResource ADD CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME();
ALTER TABLE ProjectResource ADD UpdatedAt DATETIME2 NULL;

GO  

-- TRIGGERS
CREATE TRIGGER TR_Project_SetCreatedAt
ON Project
AFTER INSERT
AS
BEGIN
    UPDATE Project
    SET CreatedAt = SYSDATETIME(),
        UpdatedAt = SYSDATETIME()
    WHERE ProjectID IN (SELECT ProjectID FROM inserted);
END;
GO

CREATE TRIGGER TR_Project_SetUpdatedAt
ON Project
AFTER UPDATE
AS
BEGIN
    UPDATE Project
    SET UpdatedAt = SYSDATETIME()
    WHERE ProjectID IN (SELECT ProjectID FROM inserted);
END;
GO


--Trigger Alex släng in dina triggers här

-- This table is needed for the audit trigger, holds the logged data for future reference
CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TableName NVARCHAR(100),
    ActionType NVARCHAR(20),   
    RecordID INT,
    ChangeDate DATETIME DEFAULT GETDATE()
)


CREATE TRIGGER TR_AUDIT_TIMELOG
ON Timelog
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON; -- SO WE DONT GET DOUBLE "CHANGE MESSAGES" FROM SQL
    DECLARE @Action NVARCHAR(20);
    -- CHECKS IF THE NEW DATA ALREADY EXISTS = if YES then its an update
    -- inserted and deleted are two virtual tables that hold temp data inbetween operatipns
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
        SET @Action = 'UPDATE';
    ELSE IF EXISTS (SELECT 1 FROM inserted)
        SET @Action = 'INSERT';
    ELSE 
        SET @Action = 'DELETE';
    INSERT INTO AuditLog (TableName, ActionType)
    VALUES ('Timelog', @Action);
END;