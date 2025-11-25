namespace Datanaut_AB.Models
{
    public class Resource
    {
        public int ResourceID { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string LicenseKey { get; set; }
        public DateTime? PurchaseDate { get; set; }
        public bool IsAvailable { get; set; }
    }
}
