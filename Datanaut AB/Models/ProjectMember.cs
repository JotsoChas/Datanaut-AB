namespace Datanaut_AB.Models
{
    public class ProjectMember
        {
            public int ProjectMemberID { get; set; }
            public int ProjectID { get; set; }
            public int MemberID { get; set; }
            public DateTime? JoinedDate { get; set; }
        }
}


