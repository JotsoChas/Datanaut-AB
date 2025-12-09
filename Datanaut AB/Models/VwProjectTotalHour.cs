using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class VwProjectTotalHour
{
    public int ProjectId { get; set; }

    public string ProjectName { get; set; } = null!;

    public decimal? TotalHoursLogged { get; set; }
}
