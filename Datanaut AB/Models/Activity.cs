using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class Activity
{
    public int ActivityId { get; set; }

    public string? ActivityName { get; set; }

    public TimeOnly? StartHour { get; set; }

    public TimeOnly? EndHour { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<TimeLog> TimeLogs { get; set; } = new List<TimeLog>();
}
