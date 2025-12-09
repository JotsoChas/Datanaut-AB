using System;
using System.Collections.Generic;

namespace Datanaut_AB.Models;

public partial class Skill
{
    public int SkillId { get; set; }

    public string Name { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<MemberSkill> MemberSkills { get; set; } = new List<MemberSkill>();
}
