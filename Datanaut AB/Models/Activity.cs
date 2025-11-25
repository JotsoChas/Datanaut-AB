namespace Datanaut_AB;

public class Activity
{
    public int ActivityID { get; set; }
    public string ActivityName { get; set; }
    public TimeSpan? StartHour { get; set; }
    public TimeSpan? EndHour { get; set; }
}
