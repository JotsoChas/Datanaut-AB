using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class TimeLog
{
    public int TimeLogId { get; set; }

    public int MemberId { get; set; }

    public int ProjectId { get; set; }

    public int ActivityId { get; set; }

    public DateOnly? Date { get; set; }

    public decimal? TotalHours { get; set; }

    public string? Notes { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Activity Activity { get; set; } = null!;

    public virtual Member Member { get; set; } = null!;

    public virtual Project Project { get; set; } = null!;
}
