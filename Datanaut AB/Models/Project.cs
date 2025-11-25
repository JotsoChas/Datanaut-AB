namespace Datanaut_AB;

public class Project
{
    public int ProjectID { get; set; }
    public string Name { get; set; }
    public DateTime? StartDate { get; set; }
    public DateTime? EndDate { get; set; }
    public decimal? Budget { get; set; }
    public int? ProjectStatusID { get; set; }
    public int? ProjectManagerID { get; set; }
}
