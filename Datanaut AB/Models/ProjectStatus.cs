using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class ProjectStatus
{
    public int ProjectStatusId { get; set; }

    public string StatusName { get; set; } = null!;

    public virtual ICollection<Project> Projects { get; set; } = new List<Project>();
}
