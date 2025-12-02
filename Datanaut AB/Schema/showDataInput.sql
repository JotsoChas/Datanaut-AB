SELECT 
    (SELECT COUNT(*) FROM Project) AS ProjectRows,
    (SELECT COUNT(*) FROM Member) AS MemberRows,
    (SELECT COUNT(*) FROM Resource) AS ResourceRows,
    (SELECT COUNT(*) FROM TimeLog) AS TimeLogRows,
    (SELECT COUNT(*) FROM Activity) AS ActivityRows,
    (SELECT COUNT(*) FROM Skill) AS SkillRows,
    (SELECT COUNT(*) FROM MemberSkill) AS MemberSkillRows,
    (SELECT COUNT(*) FROM ProjectMember) AS ProjectMemberRows,
    (SELECT COUNT(*) FROM ProjectResource) AS ProjectResourceRows,
    (SELECT COUNT(*) FROM ProjectStatus) AS ProjectStatusRows,
    (SELECT COUNT(*) FROM Role) AS RoleRows;