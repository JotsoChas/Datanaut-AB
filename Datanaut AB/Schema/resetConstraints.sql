------------------------------------------------------------
-- REMOVE UNIQUE CONSTRAINTS & INDEXES SAFELY
-- Kör detta innan du seedar om eller bygger om DB
------------------------------------------------------------

PRINT '--- Removing Constraints & Indexes ---';

-------------------- ROLE --------------------
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'UQ_Role_RoleName')
BEGIN
    ALTER TABLE Role DROP CONSTRAINT UQ_Role_RoleName;
    PRINT 'Removed: UQ_Role_RoleName';
END

-------------------- PROJECTSTATUS --------------------
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'UQ_ProjectStatus_StatusName')
BEGIN
    ALTER TABLE ProjectStatus DROP CONSTRAINT UQ_ProjectStatus_StatusName;
    PRINT 'Removed: UQ_ProjectStatus_StatusName';
END

-------------------- SKILL --------------------
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'UQ_Skill_Name')
BEGIN
    ALTER TABLE Skill DROP CONSTRAINT UQ_Skill_Name;
    PRINT 'Removed: UQ_Skill_Name';
END

-------------------- RESOURCE - UNIQUE INDEX --------------------
IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'UQ_Resource_LicenseKey_Filtered')
BEGIN
    DROP INDEX UQ_Resource_LicenseKey_Filtered ON Resource;
    PRINT 'Removed: UQ_Resource_LicenseKey_Filtered';
END

-------------------- MEMBER UNIQUE USERNAME --------------------
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'UQ_Member_Username' AND type = 'UQ')
BEGIN
    ALTER TABLE Member DROP CONSTRAINT UQ_Member_Username;
    PRINT 'Removed: UQ_Member_Username';
END

PRINT '--- DONE REMOVING CONSTRAINTS ---';
