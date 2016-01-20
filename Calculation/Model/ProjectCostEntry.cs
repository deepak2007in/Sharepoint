
namespace ProjectSaving
{
    public struct ProjectCostEntry
    {
        public ProjectType ProjectType { get; set; }
        public CostType CostType { get; set; }
        public int Month { get; set; }
        public int Cost { get; set; }

        public override string ToString()
        {
            return this.Month > 0 ? string.Format("{0}_{1}_{2}", this.ProjectType, this.CostType, this.Month) : "NA";
        }
    }
}
