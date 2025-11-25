namespace Datanaut_AB.Models
{
    public class ProjectResource
        {
            public int ProjectResourceID { get; set; }
            public int ProjectID { get; set; }
            public int ResourceID { get; set; }
            public DateTime AllocationStart { get; set; }
            public DateTime? AllocationEnd { get; set; }
        }
}

