using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class Role
{
    public int RoleId { get; set; }

    public string RoleName { get; set; } = null!;

    public virtual ICollection<Member> Members { get; set; } = new List<Member>();
}
