
namespace SCI.CIProject.ProjectSaving
{
    public class SharePointListItem
    {
        private readonly static SharePointListItem instance = new SharePointListItem();
        private SharePointListItem()
        {
            
        }
        public static SharePointListItem Instance
        {
            get
            {
                return instance;
            }
        }
        public long CA_Actual_Jan { get; set; }
        public long CA_Actual_Feb { get; set; }
        public long CA_Actual_Mar { get; set; }
        public long CA_Actual_Apr { get; set; }
        public long CA_Actual_May { get; set; }
        public long CA_Actual_Jun { get; set; }
        public long CA_Actual_Jul { get; set; }
        public long CA_Actual_Aug { get; set; }
        public long CA_Actual_Sep { get; set; }
        public long CA_Actual_Oct { get; set; }
        public long CA_Actual_Nov { get; set; }
        public long CA_Actual_Dec { get; set; }
        public long CA_Target_Jan { get; set; }
        public long CA_Target_Feb { get; set; }
        public long CA_Target_Mar { get; set; }
        public long CA_Target_Apr { get; set; }
        public long CA_Target_May { get; set; }
        public long CA_Target_Jun { get; set; }
        public long CA_Target_Jul { get; set; }
        public long CA_Target_Aug { get; set; }
        public long CA_Target_Sep { get; set; }
        public long CA_Target_Oct { get; set; }
        public long CA_Target_Nov { get; set; }
        public long CA_Target_Dec { get; set; }
        public long CR_Actual_Jan { get; set; }
        public long CR_Actual_Feb { get; set; }
        public long CR_Actual_Mar { get; set; }
        public long CR_Actual_Apr { get; set; }
        public long CR_Actual_May { get; set; }
        public long CR_Actual_Jun { get; set; }
        public long CR_Actual_Jul { get; set; }
        public long CR_Actual_Aug { get; set; }
        public long CR_Actual_Sep { get; set; }
        public long CR_Actual_Oct { get; set; }
        public long CR_Actual_Nov { get; set; }
        public long CR_Actual_Dec { get; set; }
        public long CR_Target_Jan { get; set; }
        public long CR_Target_Feb { get; set; }
        public long CR_Target_Mar { get; set; }
        public long CR_Target_Apr { get; set; }
        public long CR_Target_May { get; set; }
        public long CR_Target_Jun { get; set; }
        public long CR_Target_Jul { get; set; }
        public long CR_Target_Aug { get; set; }
        public long CR_Target_Sep { get; set; }
        public long CR_Target_Oct { get; set; }
        public long CR_Target_Nov { get; set; }
        public long CR_Target_Dec { get; set; }
        public long RG_Actual_Jan { get; set; }
        public long RG_Actual_Feb { get; set; }
        public long RG_Actual_Mar { get; set; }
        public long RG_Actual_Apr { get; set; }
        public long RG_Actual_May { get; set; }
        public long RG_Actual_Jun { get; set; }
        public long RG_Actual_Jul { get; set; }
        public long RG_Actual_Aug { get; set; }
        public long RG_Actual_Sep { get; set; }
        public long RG_Actual_Oct { get; set; }
        public long RG_Actual_Nov { get; set; }
        public long RG_Actual_Dec { get; set; }
        public long RG_Target_Jan { get; set; }
        public long RG_Target_Feb { get; set; }
        public long RG_Target_Mar { get; set; }
        public long RG_Target_Apr { get; set; }
        public long RG_Target_May { get; set; }
        public long RG_Target_Jun { get; set; }
        public long RG_Target_Jul { get; set; }
        public long RG_Target_Aug { get; set; }
        public long RG_Target_Sep { get; set; }
        public long RG_Target_Oct { get; set; }
        public long RG_Target_Nov { get; set; }
        public long RG_Target_Dec { get; set; }
        public long CI_Actual_Jan { get; set; }
        public long CI_Actual_Feb { get; set; }
        public long CI_Actual_Mar { get; set; }
        public long CI_Actual_Apr { get; set; }
        public long CI_Actual_May { get; set; }
        public long CI_Actual_Jun { get; set; }
        public long CI_Actual_Jul { get; set; }
        public long CI_Actual_Aug { get; set; }
        public long CI_Actual_Sep { get; set; }
        public long CI_Actual_Oct { get; set; }
        public long CI_Actual_Nov { get; set; }
        public long CI_Actual_Dec { get; set; }
        public long CI_Target_Jan { get; set; }
        public long CI_Target_Feb { get; set; }
        public long CI_Target_Mar { get; set; }
        public long CI_Target_Apr { get; set; }
        public long CI_Target_May { get; set; }
        public long CI_Target_Jun { get; set; }
        public long CI_Target_Jul { get; set; }
        public long CI_Target_Aug { get; set; }
        public long CI_Target_Sep { get; set; }
        public long CI_Target_Oct { get; set; }
        public long CI_Target_Nov { get; set; }
        public long CI_Target_Dec { get; set; }
        public long Total_Actual_Jan { get; set; }
        public long Total_Actual_Feb { get; set; }
        public long Total_Actual_Mar { get; set; }
        public long Total_Actual_Apr { get; set; }
        public long Total_Actual_May { get; set; }
        public long Total_Actual_Jun { get; set; }
        public long Total_Actual_Jul { get; set; }
        public long Total_Actual_Aug { get; set; }
        public long Total_Actual_Sep { get; set; }
        public long Total_Actual_Oct { get; set; }
        public long Total_Actual_Nov { get; set; }
        public long Total_Actual_Dec { get; set; }
        public long Total_Target_Jan { get; set; }
        public long Total_Target_Feb { get; set; }
        public long Total_Target_Mar { get; set; }
        public long Total_Target_Apr { get; set; }
        public long Total_Target_May { get; set; }
        public long Total_Target_Jun { get; set; }
        public long Total_Target_Jul { get; set; }
        public long Total_Target_Aug { get; set; }
        public long Total_Target_Sep { get; set; }
        public long Total_Target_Oct { get; set; }
        public long Total_Target_Nov { get; set; }
        public long Total_Target_Dec { get; set; }
        public long SavedOver12Months_CA { get; set; }
        public long SavedOver12Months_CR { get; set; }
        public long SavedOver12Months_RG { get; set; }
        public long SavedOver12Months_CI { get; set; }
        public long SavedOver12Months_Total { get; set; }
        public long SavedYearToDate_CA { get; set; }
        public long SavedYearToDate_CR { get; set; }
        public long SavedYearToDate_RG { get; set; }
        public long SavedYearToDate_CI { get; set; }
        public long SavedYearToDate_Total { get; set; }
        public long EstimatedSaving_CA { get; set; }
        public long EstimatedSaving_CR { get; set; }
        public long EstimatedSaving_RG { get; set; }
        public long EstimatedSaving_CI { get; set; }
        public long EstimatedSaving_Total { get; set; }

        public static ProjectCost Convert(SharePointListItem item, int period)
        {
            var projectCost = new ProjectCost(period);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 1, item.CA_Actual_Jan);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 2, item.CA_Actual_Feb);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 3, item.CA_Actual_Mar);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 4, item.CA_Actual_Apr);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 5, item.CA_Actual_May);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 6, item.CA_Actual_Jun);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 7, item.CA_Actual_Jul);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 8, item.CA_Actual_Aug);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 9, item.CA_Actual_Sep);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 10, item.CA_Actual_Oct);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 11, item.CA_Actual_Nov);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 12, item.CA_Actual_Dec);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 1, item.CA_Target_Jan);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 2, item.CA_Target_Feb);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 3, item.CA_Target_Mar);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 4, item.CA_Target_Apr);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 5, item.CA_Target_May);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 6, item.CA_Target_Jun);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 7, item.CA_Target_Jul);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 8, item.CA_Target_Aug);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 9, item.CA_Target_Sep);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 10, item.CA_Target_Oct);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 11, item.CA_Target_Nov);
            projectCost.SetCostEntry(ProjectType.CostAvoidance, CostType.Target, 12, item.CA_Target_Dec);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 1, item.CR_Actual_Jan);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 2, item.CR_Actual_Feb);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 3, item.CR_Actual_Mar);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 4, item.CR_Actual_Apr);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 5, item.CR_Actual_May);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 6, item.CR_Actual_Jun);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 7, item.CR_Actual_Jul);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 8, item.CR_Actual_Aug);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 9, item.CR_Actual_Sep);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 10, item.CR_Actual_Oct);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 11, item.CR_Actual_Nov);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Actual, 12, item.CR_Actual_Dec);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 1, item.CR_Target_Jan);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 2, item.CR_Target_Feb);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 3, item.CR_Target_Mar);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 4, item.CR_Target_Apr);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 5, item.CR_Target_May);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 6, item.CR_Target_Jun);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 7, item.CR_Target_Jul);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 8, item.CR_Target_Aug);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 9, item.CR_Target_Sep);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 10, item.CR_Target_Oct);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 11, item.CR_Target_Nov);
            projectCost.SetCostEntry(ProjectType.CostReduction, CostType.Target, 12, item.CR_Target_Dec);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 1, item.RG_Actual_Jan);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 2, item.RG_Actual_Feb);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 3, item.RG_Actual_Mar);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 4, item.RG_Actual_Apr);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 5, item.RG_Actual_May);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 6, item.RG_Actual_Jun);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 7, item.RG_Actual_Jul);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 8, item.RG_Actual_Aug);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 9, item.RG_Actual_Sep);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 10, item.RG_Actual_Oct);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 11, item.RG_Actual_Nov);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 12, item.RG_Actual_Dec);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 1, item.RG_Target_Jan);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 2, item.RG_Target_Feb);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 3, item.RG_Target_Mar);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 4, item.RG_Target_Apr);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 5, item.RG_Target_May);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 6, item.RG_Target_Jun);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 7, item.RG_Target_Jul);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 8, item.RG_Target_Aug);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 9, item.RG_Target_Sep);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 10, item.RG_Target_Oct);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 11, item.RG_Target_Nov);
            projectCost.SetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 12, item.RG_Target_Dec);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 1, item.CI_Actual_Jan);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 2, item.CI_Actual_Feb);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 3, item.CI_Actual_Mar);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 4, item.CI_Actual_Apr);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 5, item.CI_Actual_May);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 6, item.CI_Actual_Jun);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 7, item.CI_Actual_Jul);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 8, item.CI_Actual_Aug);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 9, item.CI_Actual_Sep);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 10, item.CI_Actual_Oct);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 11, item.CI_Actual_Nov);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 12, item.CI_Actual_Dec);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 1, item.CI_Target_Jan);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 2, item.CI_Target_Feb);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 3, item.CI_Target_Mar);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 4, item.CI_Target_Apr);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 5, item.CI_Target_May);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 6, item.CI_Target_Jun);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 7, item.CI_Target_Jul);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 8, item.CI_Target_Aug);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 9, item.CI_Target_Sep);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 10, item.CI_Target_Oct);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 11, item.CI_Target_Nov);
            projectCost.SetCostEntry(ProjectType.CapacityIncrease, CostType.Target, 12, item.CI_Target_Dec);
            return projectCost;
        }

        public static SharePointListItem Convert(ProjectCost projectCost, int monthToStart)
        {
            var item = new SharePointListItem();
            item.CA_Actual_Jan = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 1);
            item.CA_Actual_Feb = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 2);
            item.CA_Actual_Mar = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 3);
            item.CA_Actual_Apr = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 4);
            item.CA_Actual_May = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 5);
            item.CA_Actual_Jun = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 6);
            item.CA_Actual_Jul = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 7);
            item.CA_Actual_Aug = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 8);
            item.CA_Actual_Sep = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 9);
            item.CA_Actual_Oct = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 10);
            item.CA_Actual_Nov = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 11);
            item.CA_Actual_Dec = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Actual, 12);
            item.CA_Target_Jan = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 1);
            item.CA_Target_Feb = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 2);
            item.CA_Target_Mar = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 3);
            item.CA_Target_Apr = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 4);
            item.CA_Target_May = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 5);
            item.CA_Target_Jun = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 6);
            item.CA_Target_Jul = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 7);
            item.CA_Target_Aug = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 8);
            item.CA_Target_Sep = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 9);
            item.CA_Target_Oct = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 10);
            item.CA_Target_Nov = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 11);
            item.CA_Target_Dec = projectCost.GetCostEntry(ProjectType.CostAvoidance, CostType.Target, 12);
            item.CR_Actual_Jan = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 1);
            item.CR_Actual_Feb = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 2);
            item.CR_Actual_Mar = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 3);
            item.CR_Actual_Apr = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 4);
            item.CR_Actual_May = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 5);
            item.CR_Actual_Jun = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 6);
            item.CR_Actual_Jul = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 7);
            item.CR_Actual_Aug = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 8);
            item.CR_Actual_Sep = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 9);
            item.CR_Actual_Oct = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 10);
            item.CR_Actual_Nov = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 11);
            item.CR_Actual_Dec = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Actual, 12);
            item.CR_Target_Jan = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 1);
            item.CR_Target_Feb = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 2);
            item.CR_Target_Mar = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 3);
            item.CR_Target_Apr = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 4);
            item.CR_Target_May = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 5);
            item.CR_Target_Jun = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 6);
            item.CR_Target_Jul = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 7);
            item.CR_Target_Aug = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 8);
            item.CR_Target_Sep = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 9);
            item.CR_Target_Oct = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 10);
            item.CR_Target_Nov = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 11);
            item.CR_Target_Dec = projectCost.GetCostEntry(ProjectType.CostReduction, CostType.Target, 12);
            item.RG_Actual_Jan = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 1);
            item.RG_Actual_Feb = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 2);
            item.RG_Actual_Mar = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 3);
            item.RG_Actual_Apr = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 4);
            item.RG_Actual_May = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 5);
            item.RG_Actual_Jun = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 6);
            item.RG_Actual_Jul = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 7);
            item.RG_Actual_Aug = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 8);
            item.RG_Actual_Sep = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 9);
            item.RG_Actual_Oct = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 10);
            item.RG_Actual_Nov = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 11);
            item.RG_Actual_Dec = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Actual, 12);
            item.RG_Target_Jan = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 1);
            item.RG_Target_Feb = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 2);
            item.RG_Target_Mar = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 3);
            item.RG_Target_Apr = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 4);
            item.RG_Target_May = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 5);
            item.RG_Target_Jun = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 6);
            item.RG_Target_Jul = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 7);
            item.RG_Target_Aug = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 8);
            item.RG_Target_Sep = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 9);
            item.RG_Target_Oct = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 10);
            item.RG_Target_Nov = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 11);
            item.RG_Target_Dec = projectCost.GetCostEntry(ProjectType.RevenueGrowth, CostType.Target, 12);
            item.CI_Actual_Jan = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 1);
            item.CI_Actual_Feb = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 2);
            item.CI_Actual_Mar = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 3);
            item.CI_Actual_Apr = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 4);
            item.CI_Actual_May = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 5);
            item.CI_Actual_Jun = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 6);
            item.CI_Actual_Jul = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 7);
            item.CI_Actual_Aug = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 8);
            item.CI_Actual_Sep = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 9);
            item.CI_Actual_Oct = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 10);
            item.CI_Actual_Nov = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 11);
            item.CI_Actual_Dec = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 12);
            item.CI_Target_Jan = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 1);
            item.CI_Target_Feb = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 2);
            item.CI_Target_Mar = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 3);
            item.CI_Target_Apr = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 4);
            item.CI_Target_May = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 5);
            item.CI_Target_Jun = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 6);
            item.CI_Target_Jul = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 7);
            item.CI_Target_Aug = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 8);
            item.CI_Target_Sep = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 9);
            item.CI_Target_Oct = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 10);
            item.CI_Target_Nov = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 11);
            item.CI_Target_Dec = projectCost.GetCostEntry(ProjectType.CapacityIncrease, CostType.Actual, 12);
            item.Total_Actual_Jan = projectCost.GetActualTotal(1);
            item.Total_Actual_Feb = projectCost.GetActualTotal(2);
            item.Total_Actual_Mar = projectCost.GetActualTotal(3);
            item.Total_Actual_Apr = projectCost.GetActualTotal(4);
            item.Total_Actual_May = projectCost.GetActualTotal(5);
            item.Total_Actual_Jun = projectCost.GetActualTotal(6);
            item.Total_Actual_Jul = projectCost.GetActualTotal(7);
            item.Total_Actual_Aug = projectCost.GetActualTotal(8);
            item.Total_Actual_Sep = projectCost.GetActualTotal(9);
            item.Total_Actual_Oct = projectCost.GetActualTotal(10);
            item.Total_Actual_Nov = projectCost.GetActualTotal(11);
            item.Total_Actual_Dec = projectCost.GetActualTotal(12);
            item.Total_Target_Jan = projectCost.GetTargetTotal(1);
            item.Total_Target_Feb = projectCost.GetTargetTotal(2);
            item.Total_Target_Mar = projectCost.GetTargetTotal(3);
            item.Total_Target_Apr = projectCost.GetTargetTotal(4);
            item.Total_Target_May = projectCost.GetTargetTotal(5);
            item.Total_Target_Jun = projectCost.GetTargetTotal(6);
            item.Total_Target_Jul = projectCost.GetTargetTotal(7);
            item.Total_Target_Aug = projectCost.GetTargetTotal(8);
            item.Total_Target_Sep = projectCost.GetTargetTotal(9);
            item.Total_Target_Oct = projectCost.GetTargetTotal(10);
            item.Total_Target_Nov = projectCost.GetTargetTotal(11);
            item.Total_Target_Dec = projectCost.GetTargetTotal(12);
            item.SavedOver12Months_CA = projectCost.GetSavedOver12Months(ProjectType.CostAvoidance, monthToStart);
            item.SavedOver12Months_CR = projectCost.GetSavedOver12Months(ProjectType.CostReduction, monthToStart);
            item.SavedOver12Months_RG = projectCost.GetSavedOver12Months(ProjectType.RevenueGrowth, monthToStart);
            item.SavedOver12Months_CI = projectCost.GetSavedOver12Months(ProjectType.CapacityIncrease, monthToStart);
            item.SavedOver12Months_Total = item.SavedOver12Months_CA + item.SavedOver12Months_CR + item.SavedOver12Months_RG + item.SavedOver12Months_CI;
            item.SavedYearToDate_CA = projectCost.GetSavedYearToDate(ProjectType.CostAvoidance, monthToStart);
            item.SavedYearToDate_CR = projectCost.GetSavedYearToDate(ProjectType.CostReduction, monthToStart);
            item.SavedYearToDate_RG = projectCost.GetSavedYearToDate(ProjectType.RevenueGrowth, monthToStart);
            item.SavedYearToDate_CI = projectCost.GetSavedYearToDate(ProjectType.CapacityIncrease, monthToStart);
            item.SavedYearToDate_Total = item.SavedYearToDate_CA + item.SavedYearToDate_CR + item.SavedYearToDate_RG + item.SavedYearToDate_CI;
            item.EstimatedSaving_CA = projectCost.GetEstimatedSavingsToBeRealized(ProjectType.CostAvoidance, monthToStart);
            item.EstimatedSaving_CR = projectCost.GetEstimatedSavingsToBeRealized(ProjectType.CostReduction, monthToStart);
            item.EstimatedSaving_RG = projectCost.GetEstimatedSavingsToBeRealized(ProjectType.RevenueGrowth, monthToStart);
            item.EstimatedSaving_CI = projectCost.GetEstimatedSavingsToBeRealized(ProjectType.CapacityIncrease, monthToStart);
            item.EstimatedSaving_Total = item.EstimatedSaving_CA + item.EstimatedSaving_CR + item.EstimatedSaving_RG + item.EstimatedSaving_CI;
            return item;
        }
    }
}
