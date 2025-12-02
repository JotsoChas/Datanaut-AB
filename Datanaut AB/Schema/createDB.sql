---------------------------------------------------
-- TABLE: Role
-- Lagrar olika roller (ex. utvecklare, projektledare)
---------------------------------------------------
CREATE TABLE Role (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(100) NOT NULL
);




---------------------------------------------------
-- TABLE: ProjectStatus
-- Status för projekt (pågående, klart, pausat)
---------------------------------------------------
CREATE TABLE ProjectStatus (
    ProjectStatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName NVARCHAR(100) NOT NULL
);

---------------------------------------------------
-- TABLE: Member
-- Lagrar persondata + koppling till roll och status
---------------------------------------------------
CREATE TABLE Member (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Username NVARCHAR(100),
    RoleID INT NOT NULL,
    -- DEFAULT 1 sets the default status to False/Inactive.
    IsActive BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

---------------------------------------------------
-- TABLE: Skill
-- Lista över kompetenser (ex. SQL, C#, UX)
---------------------------------------------------
CREATE TABLE Skill (
    SkillID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);

---------------------------------------------------
-- TABLE: MemberSkill
-- Koppling mellan medlemmar och deras skills (M:N)
---------------------------------------------------
CREATE TABLE MemberSkill (
    MemberSkillID INT IDENTITY(1,1) PRIMARY KEY,
    MemberID INT NOT NULL,
    SkillID INT NOT NULL,

    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)
);

---------------------------------------------------
-- TABLE: Project
-- Projektinformation + status + projektledare
---------------------------------------------------
CREATE TABLE Project (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(18,2),
    ProjectStatusID INT,
    ProjectManagerID INT NULL,
	
    FOREIGN KEY (ProjectStatusID) REFERENCES ProjectStatus(ProjectStatusID),
    FOREIGN KEY (ProjectManagerID) REFERENCES Member(MemberID)
);

---------------------------------------------------
-- TABLE: ProjectMember
-- Koppling mellan Project och Member (M:N)
-- Inkluderar JoinedDate
---------------------------------------------------
CREATE TABLE ProjectMember (
    ProjectMemberID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    MemberID INT NOT NULL,
    JoinedDate DATE,

    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

---------------------------------------------------
-- TABLE: Activity
-- Typer av aktiviteter som tid kan loggas på
---------------------------------------------------
CREATE TABLE Activity (
    ActivityID INT IDENTITY(1,1) PRIMARY KEY,
    ActivityName NVARCHAR(100),
    StartHour TIME,
    EndHour TIME
);

---------------------------------------------------
-- TABLE: TimeLog
-- Tidrapportering kopplat till Member, Project och Activity
---------------------------------------------------
CREATE TABLE TimeLog (
    TimeLogID INT IDENTITY(1,1) PRIMARY KEY,
    MemberID INT NOT NULL,
    ProjectID INT NOT NULL,
    ActivityID INT NOT NULL,
    Date DATE,
    TotalHours DECIMAL(5,2),
    Notes NVARCHAR(500),

    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (ActivityID) REFERENCES Activity(ActivityID)
);

---------------------------------------------------
-- TABLE: Resource
-- Utrustning, mjukvara, licenser som kan användas i projekt
---------------------------------------------------
CREATE TABLE Resource (
    ResourceID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Type NVARCHAR(100) NULL,
    LicenseKey NVARCHAR(200) NULL,
    PurchaseDate DATE NULL,
    IsAvailable BIT NOT NULL DEFAULT 1,
);

---------------------------------------------------
-- TABLE: ProjectResource
-- Koppling mellan Project och Resource (M:N)
-- Inkluderar tidsperioden för resursallokering
---------------------------------------------------
CREATE TABLE ProjectResource (
    ProjectResourceID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    ResourceID INT NOT NULL,
    AllocationStart DATE NOT NULL,
    AllocationEnd DATE NULL,

    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID)
);
