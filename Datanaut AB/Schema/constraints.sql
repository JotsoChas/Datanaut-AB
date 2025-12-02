ALTER TABLE Role 
ADD CONSTRAINT UQ_Role_RoleName UNIQUE (RoleName);

ALTER TABLE ProjectStatus 
ADD CONSTRAINT UQ_ProjectStatus_StatusName UNIQUE (StatusName);

ALTER TABLE Skill 
ADD CONSTRAINT UQ_Skill_Name UNIQUE (Name);

CREATE UNIQUE NONCLUSTERED INDEX UQ_Resource_LicenseKey_Filtered
ON Resource (LicenseKey)
WHERE LicenseKey IS NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'UQ_Member_Username' AND type = 'UQ')
BEGIN
    -- Om den INTE finns, skapa den:
    ALTER TABLE Member 
    ADD CONSTRAINT UQ_Member_Username UNIQUE (Username);
    PRINT 'Constraint UQ_Member_Username created.';
END
ELSE
BEGIN
    PRINT 'Constraint UQ_Member_Username already exists. Skipping.';
END

ALTER TABLE Member 
ALTER COLUMN FirstName NVARCHAR(100) NOT NULL;

ALTER TABLE Member 
ALTER COLUMN LastName NVARCHAR(100) NOT NULL;

PRINT 'Columns FirstName and LastName are now NOT NULL.';