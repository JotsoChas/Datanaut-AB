using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class ProjectResource
{
    public int ProjectResourceId { get; set; }

    public int ProjectId { get; set; }

    public int ResourceId { get; set; }

    public DateOnly AllocationStart { get; set; }

    public DateOnly? AllocationEnd { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Project Project { get; set; } = null!;

    public virtual Resource Resource { get; set; } = null!;
}
