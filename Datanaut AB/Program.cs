using Datanaut_AB.Data;
using Datanaut_AB.Models;
using Microsoft.EntityFrameworkCore;

internal class Program
{
    private static void Main(string[] args)
    {
        using var db = new DatanautDBContext();

        Console.WriteLine("=== TEST DB CONNECTION ===\n");

        // Test connection
        if (db.Database.CanConnect())
            Console.WriteLine("Connected to DatanautDB ✔\n");
        else
        {
            Console.WriteLine("Failed to connect ❌");
            return;
        }

        // --- MEMBERS ---
        Console.WriteLine("=== MEMBERS ===");
        foreach (var m in db.Members.ToList())
            Console.WriteLine($"{m.MemberId} | {m.FirstName} {m.LastName} | Username: {m.Username} | RoleID: {m.RoleId}");
        Console.WriteLine();

        // --- ROLES ---
        Console.WriteLine("=== ROLES ===");
        foreach (var r in db.Roles.ToList())
            Console.WriteLine($"{r.RoleId} | {r.RoleName}");
        Console.WriteLine();

        // --- SKILLS ---
        Console.WriteLine("=== SKILLS ===");
        foreach (var s in db.Skills.ToList())
            Console.WriteLine($"{s.SkillId} | {s.Name}");
        Console.WriteLine();

        // --- MEMBER SKILLS ---
        Console.WriteLine("=== MEMBER SKILLS ===");
        foreach (var ms in db.MemberSkills.Include(x => x.Member).Include(x => x.Skill).ToList())
            Console.WriteLine($"{ms.MemberSkillId} | Member: {ms.Member?.FirstName} | Skill: {ms.Skill?.Name}");
        Console.WriteLine();

        // --- PROJECTS ---
        Console.WriteLine("=== PROJECTS ===");
        foreach (var p in db.Projects.ToList())
            Console.WriteLine($"{p.ProjectId} | {p.Name} | ManagerID: {p.ProjectManagerId} | StatusID: {p.ProjectStatusId}");
        Console.WriteLine();

        // --- PROJECT STATUS ---
        Console.WriteLine("=== PROJECT STATUS ===");
        foreach (var ps in db.ProjectStatuses.ToList())
            Console.WriteLine($"{ps.ProjectStatusId} | {ps.StatusName}");
        Console.WriteLine();

        // --- PROJECT MEMBERS ---
        Console.WriteLine("=== PROJECT MEMBERS ===");
        foreach (var pm in db.ProjectMembers.Include(x => x.Member).Include(x => x.Project).ToList())
            Console.WriteLine($"{pm.ProjectMemberId} | Project: {pm.Project?.Name} | Member: {pm.Member?.FirstName}");
        Console.WriteLine();

        // --- ACTIVITIES ---
        Console.WriteLine("=== ACTIVITIES ===");
        foreach (var a in db.Activities.ToList())
            Console.WriteLine($"{a.ActivityId} | {a.ActivityName} | Start: {a.StartHour} | End: {a.EndHour}");
        Console.WriteLine();

        // --- TIME LOGS ---
        Console.WriteLine("=== TIME LOGS ===");
        foreach (var t in db.TimeLogs.Include(x => x.Project).Include(x => x.Member).Include(x => x.Activity).ToList())
            Console.WriteLine($"{t.TimeLogId} | Project: {t.Project?.Name} | Member: {t.Member?.FirstName} | Activity: {t.Activity?.ActivityName} | Hours: {t.TotalHours}");
        Console.WriteLine();

        // --- RESOURCES ---
        Console.WriteLine("=== RESOURCES ===");
        foreach (var res in db.Resources.ToList())
            Console.WriteLine($"{res.ResourceId} | {res.Name} | Type: {res.Type} | Available: {res.IsAvailable}");
        Console.WriteLine();

        // --- PROJECT RESOURCES ---
        Console.WriteLine("=== PROJECT RESOURCES ===");
        foreach (var pr in db.ProjectResources.Include(x => x.Project).Include(x => x.Resource).ToList())
            Console.WriteLine($"{pr.ProjectResourceId} | Project: {pr.Project?.Name} | Resource: {pr.Resource?.Name}");
        Console.WriteLine();

        // --- VIEW EXAMPLE ---
        Console.WriteLine("=== VIEW: TOTAL HOURS PER PROJECT ===");
        foreach (var v in db.VwProjectTotalHours.ToList())
            Console.WriteLine($"{v.ProjectId} | {v.ProjectName} | Hours Logged: {v.TotalHoursLogged}");
        Console.WriteLine();

        Console.WriteLine("\n=== DONE ===");
        Console.ReadKey();
    }
}
