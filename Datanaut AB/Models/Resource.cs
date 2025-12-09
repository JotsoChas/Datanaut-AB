using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class Resource
{
    public int ResourceId { get; set; }

    public string Name { get; set; } = null!;

    public string? Type { get; set; }

    public string? LicenseKey { get; set; }

    public DateOnly? PurchaseDate { get; set; }

    public bool IsAvailable { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<ProjectResource> ProjectResources { get; set; } = new List<ProjectResource>();
}
