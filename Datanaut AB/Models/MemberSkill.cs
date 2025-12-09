using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class MemberSkill
{
    public int MemberSkillId { get; set; }

    public int MemberId { get; set; }

    public int SkillId { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Member Member { get; set; } = null!;

    public virtual Skill Skill { get; set; } = null!;
}
