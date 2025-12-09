using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class ProjectMember
{
    public int ProjectMemberId { get; set; }

    public int ProjectId { get; set; }

    public int MemberId { get; set; }

    public DateOnly? JoinedDate { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Member Member { get; set; } = null!;

    public virtual Project Project { get; set; } = null!;
}
