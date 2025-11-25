namespace Datanaut_AB.Models
{
 
    public class TimeLog
{
    public int TimeLogID { get; set; }
    public int MemberID { get; set; }
    public int ProjectID { get; set; }
    public int ActivityID { get; set; }
    public DateTime? Date { get; set; }
    public decimal? TotalHours { get; set; }
    public string? Notes { get; set; }
}

}

