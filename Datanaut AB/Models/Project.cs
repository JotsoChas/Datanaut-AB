using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class Project
{
    public int ProjectId { get; set; }

    public string Name { get; set; } = null!;

    public DateOnly? StartDate { get; set; }

    public DateOnly? EndDate { get; set; }

    public decimal? Budget { get; set; }

    public int? ProjectStatusId { get; set; }

    public int? ProjectManagerId { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Member? ProjectManager { get; set; }

    public virtual ICollection<ProjectMember> ProjectMembers { get; set; } = new List<ProjectMember>();

    public virtual ICollection<ProjectResource> ProjectResources { get; set; } = new List<ProjectResource>();

    public virtual ProjectStatus? ProjectStatus { get; set; }

    public virtual ICollection<TimeLog> TimeLogs { get; set; } = new List<TimeLog>();
}
