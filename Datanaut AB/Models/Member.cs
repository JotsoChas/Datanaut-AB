using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class Member
{
    public int MemberId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Username { get; set; }

    public int RoleId { get; set; }

    public bool IsActive { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<MemberSkill> MemberSkills { get; set; } = new List<MemberSkill>();

    public virtual ICollection<ProjectMember> ProjectMembers { get; set; } = new List<ProjectMember>();

    public virtual ICollection<Project> Projects { get; set; } = new List<Project>();

    public virtual Role Role { get; set; } = null!;

    public virtual ICollection<TimeLog> TimeLogs { get; set; } = new List<TimeLog>();
}
