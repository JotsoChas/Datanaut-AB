------------------------------------------------------------
-- TEST DATA FOR DATANAUTDB (ENGLISH VERSION)
-- Names inspired by Malmö region
-- Based 100% on the project assignment requirements
------------------------------------------------------------

------------------------------------------------------------
-- ROLES (admin, project manager, employee)
------------------------------------------------------------
INSERT INTO Role (RoleName)
VALUES
('Admin'),
('Project Manager'),
('Employee');

------------------------------------------------------------
-- PROJECT STATUS
------------------------------------------------------------
INSERT INTO ProjectStatus (StatusName)
VALUES
('Not Started'),
('In Progress'),
('Completed'),
('On Hold');

------------------------------------------------------------
-- TEAM MEMBERS (Malmö-based names)
------------------------------------------------------------
INSERT INTO Member (FirstName, LastName, Username, RoleID, IsActive)
VALUES
('Linnea',  'Malmgren',    'linnea.m', 1, 1), -- Admin
('Henrik',  'Rosengren',   'henrik.r', 2, 1), -- Project Manager
('Ali',     'Hassan',      'ali.h',    3, 1), -- Employee
('Nora',    'Söderlund',   'nora.s',   3, 1), -- Employee
('Lukas',   'Karlsson',    'lukas.k',  3, 1); -- Employee

------------------------------------------------------------
-- SKILLS
------------------------------------------------------------
INSERT INTO Skill (SkillName)
VALUES
('C# and .NET'),
('SQL & Data Modeling'),
('Orbital Mechanics'),
('Machine Learning'),
('Systems Architecture'),
('User Interface Design');

------------------------------------------------------------
-- MEMBER ↔ SKILL RELATIONS
------------------------------------------------------------
INSERT INTO Skill (Name)
VALUES
('C# and .NET'),
('SQL & Data Modeling'),
('Orbital Mechanics'),
('Machine Learning'),
('Systems Architecture'),
('User Interface Design');

SELECT * FROM Skill;



------------------------------------------------------------
-- PROJECTS (space-related engineering initiatives)
------------------------------------------------------------
INSERT INTO Project (Name, StartDate, EndDate, StatusID, Budget, ProjectManagerID)
VALUES
('Lunar Rover Coordination System', '2025-01-10', NULL,        2, 950000, 2),
('Orbital Debris Monitoring Tool',  '2025-02-01', NULL,        2, 720000, 2),
('Mars Habitat Energy Grid',        '2024-10-01', '2025-03-31', 3, 1600000, 2);

------------------------------------------------------------
-- RESOURCES (equipment, software, licenses)
------------------------------------------------------------
INSERT INTO Resource (ResourceName, ResourceType)
VALUES
('High-Performance Compute Node',  'Equipment'),
('Azure Space Research License',  'Software'),
('Orbital Dynamics Toolkit',      'License'),
('Datanaut Visualization Suite',  'Software'),
('Satellite Simulation Terminal', 'Equipment');

------------------------------------------------------------
-- PROJECT ↔ RESOURCE
------------------------------------------------------------
INSERT INTO ProjectResource (ProjectID, ResourceID)
VALUES
-- Lunar Rover Coordination
(1, 1),
(1, 2),
(1, 5),

-- Orbital Debris Monitoring
(2, 2),
(2, 3),
(2, 4),

-- Mars Habitat Energy Grid
(3, 1),
(3, 4);

------------------------------------------------------------
-- ACTIVITIES (for time logging)
------------------------------------------------------------
INSERT INTO Activity (ActivityName, StartHour, EndHour)
VALUES
('Daily Standup',          '09:00', '09:15'),
('Architecture Review',    '10:00', '11:00'),
('Development Session',    '13:00', '16:00'),
('Data Analysis Session',  '14:00', '16:00'),
('Scientific Review',      '15:00', '17:00');

------------------------------------------------------------
-- PROJECT MEMBERS
------------------------------------------------------------
INSERT INTO ProjectMember (ProjectID, MemberID)
VALUES
-- Lunar Rover Coordination
(1, 2),
(1, 3),
(1, 4),
(1, 5),

-- Orbital Debris Monitoring
(2, 2),
(2, 3),
(2, 4),

-- Mars Habitat Energy Grid
(3, 2),
(3, 4),
(3, 5);

------------------------------------------------------------
-- TIME LOGS (per project, member, activity)
------------------------------------------------------------
INSERT INTO TimeLog (MemberID, ProjectID, ActivityID, LogDate, HoursSpent)
VALUES
-- Lunar Rover Coordination
(2, 1, 2, '2025-02-10', 1.5), -- Henrik – architecture review
(3, 1, 3, '2025-02-10', 3.0), -- Ali – development
(4, 1, 3, '2025-02-10', 3.0), -- Nora – development
(5, 1, 5, '2025-02-11', 2.0), -- Lukas – scientific review

-- Orbital Debris Monitoring
(2, 2, 1, '2025-02-12', 0.25), -- Henrik – standup
(3, 2, 4, '2025-02-12', 2.0),  -- Ali – data analysis
(4, 2, 3, '2025-02-12', 3.0),  -- Nora – development

-- Mars Habitat Energy Grid
(2, 3, 2, '2025-01-20', 1.0),  -- Henrik – architecture review
(4, 3, 3, '2025-01-20', 3.0),  -- Nora – development
(5, 3, 4, '2025-01-21', 2.5);  -- Lukas – data analysis


INSERT INTO Resource (Name, Type, LicenseKey, PurchaseDate, IsAvailable)
VALUES
('Compute Node – Øresund Model X', 'Equipment', NULL, '2024-11-10', 1),
('Azure Space Research Suite', 'Software', 'AZR-9932-MLM-5521', '2025-01-05', 1),
('Orbital Mechanics Toolkit', 'License', 'OMT-4421-PLN-8877', '2024-12-01', 1),
('Datanaut Visualization Console', 'Software', 'DVC-9182-RTS-2211', '2025-02-12', 1),
('Satellite Simulation Workbench', 'Equipment', NULL, '2024-10-22', 0),
('Quantum Power Monitoring Module', 'Equipment', NULL, '2024-09-18', 1),
('Deep Space Image Analyzer Pro', 'Software', 'DSI-7712-LMN-4412', '2025-02-20', 1),
('AI-guided Rover Control Suite', 'Software', 'RVR-5529-JHK-2033', '2025-01-29', 1);


INSERT INTO Project (Name, StartDate, EndDate, Budget, ProjectStatusID, ProjectManagerID)
VALUES
('Lunar Rover Coordination System',       '2025-01-10', NULL,         950000, 2, 2),
('Orbital Debris Monitoring Tool',        '2025-02-01', NULL,         720000, 2, 2),
('Mars Habitat Energy Grid',              '2024-10-01', '2025-03-31', 1600000, 3, 2);

INSERT INTO MemberSkill (MemberID, SkillID)
VALUES
(1, 2), -- Linnea: SQL
(1, 5), -- Linnea: Systems Architecture

(2, 1), -- Henrik: C#
(2, 5), -- Henrik: Systems Architecture

(3, 1), -- Ali: C#
(3, 4), -- Ali: Machine Learning

(4, 2), -- Nora: SQL
(4, 6), -- Nora: UI Design

(5, 3), -- Lukas: Orbital Mechanics
(5, 4); -- Lukas: ML

INSERT INTO ProjectMember (ProjectID, MemberID, JoinedDate)
VALUES
-- Project 1: Lunar Rover
(1, 2, '2025-01-10'),
(1, 3, '2025-01-10'),
(1, 4, '2025-01-10'),
(1, 5, '2025-01-10'),

-- Project 2: Debris Monitoring
(2, 2, '2025-02-01'),
(2, 3, '2025-02-01'),
(2, 4, '2025-02-01'),

-- Project 3: Mars Habitat
(3, 2, '2024-10-01'),
(3, 4, '2024-10-01'),
(3, 5, '2024-10-01');


INSERT INTO ProjectResource (ProjectID, ResourceID, AllocationStart, AllocationEnd)
VALUES
-- Project 1: Lunar Rover
(1, 1, '2025-01-10', NULL),
(1, 2, '2025-01-10', NULL),
(1, 5, '2025-01-15', NULL),

-- Project 2: Debris Monitoring
(2, 2, '2025-02-01', NULL),
(2, 3, '2025-02-05', NULL),
(2, 4, '2025-02-10', NULL),

-- Project 3: Mars Habitat Grid
(3, 1, '2024-10-01', '2025-03-31'),
(3, 4, '2024-11-01', '2025-03-31');

INSERT INTO TimeLog (MemberID, ProjectID, ActivityID, Date, TotalHours, Notes)
VALUES
-- Project 1: Lunar Rover Coordination
(2, 1, 1, '2025-02-10', 0.25, 'Daily standup'),
(3, 1, 3, '2025-02-10', 3.0, 'Development session'),
(4, 1, 3, '2025-02-10', 3.0, 'Development session'),
(5, 1, 5, '2025-02-11', 2.0, 'Scientific review'),

-- Project 2: Orbital Debris Monitoring
(2, 2, 1, '2025-02-12', 0.25, 'Standup'),
(3, 2, 4, '2025-02-12', 2.0, 'Data analysis'),
(4, 2, 3, '2025-02-12', 3.0, 'Development'),

-- Project 3: Mars Habitat Energy Grid
(2, 3, 2, '2025-01-20', 1.0, 'Architecture review'),
(4, 3, 3, '2025-01-20', 3.0, 'Development'),
(5, 3, 4, '2025-01-21', 2.5, 'Data analysis');
