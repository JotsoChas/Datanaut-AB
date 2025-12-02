CREATE DATABASE DatanautDB;
GO

USE DatanautDB;
GO

---------------------------------------------------
-- TABLE: Role
-- Stores available system roles (e.g., Developer, Project Manager)
---------------------------------------------------
CREATE TABLE Role (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(100) NOT NULL
);


---------------------------------------------------
-- TABLE: ProjectStatus
-- Stores different project states (e.g., Active, Completed, Paused)
---------------------------------------------------
CREATE TABLE ProjectStatus (
    ProjectStatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName NVARCHAR(100) NOT NULL
);


---------------------------------------------------
-- TABLE: Member
-- Stores user information and links each user to a role
---------------------------------------------------
CREATE TABLE Member (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Username NVARCHAR(100),
    RoleID INT NOT NULL,
    -- DEFAULT 1 sets member as active by default
    IsActive BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);


---------------------------------------------------
-- TABLE: Skill
-- Stores a list of professional skills (e.g., SQL, C#, UX)
---------------------------------------------------
CREATE TABLE Skill (
    SkillID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);


---------------------------------------------------
-- TABLE: MemberSkill
-- Many-to-many relation between Member and Skill
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
-- Stores project data including status and project manager
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
-- Many-to-many relation between Project and Member
-- Includes JoinedDate for tracking assignment time
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
-- Stores types of work activities for time logging
---------------------------------------------------
CREATE TABLE Activity (
    ActivityID INT IDENTITY(1,1) PRIMARY KEY,
    ActivityName NVARCHAR(100),
    StartHour TIME,
    EndHour TIME
);


---------------------------------------------------
-- TABLE: TimeLog
-- Stores time tracking per Member, Project, and Activity
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
-- Stores equipment, software, and licenses used in projects
---------------------------------------------------
CREATE TABLE Resource (
    ResourceID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Type NVARCHAR(100) NULL,
    LicenseKey NVARCHAR(200) NULL,
    PurchaseDate DATE NULL,
    IsAvailable BIT NOT NULL DEFAULT 1
);


---------------------------------------------------
-- TABLE: ProjectResource
-- Many-to-many link between Project and Resource
-- Includes allocation period (start → end)
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
