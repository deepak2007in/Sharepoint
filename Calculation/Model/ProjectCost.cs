//-----------------------------------------------------------------------
// <copyright file="ProjectCost.cs" company="TechBlocks">
//     Class responsible for the project cost related metadata. 
// </copyright>
//-----------------------------------------------------------------------
namespace SCI.CIProject.ProjectSaving
{
    using System;
    using System.Collections.Generic;

    /// <summary>
    /// Class responsible for the project cost related metadata. 
    /// </summary>
    public class ProjectCost
    {
        /// <summary>
        /// Holds the cost specific entries in the key value pair.
        /// </summary>
        private readonly IDictionary<string, ProjectCostEntry> costEntries;

        /// <summary>
        /// Initializes a new instance of the <see cref="ProjectCost"/> class with the provided period.
        /// </summary>
        /// <param name="period">The period for the calculation.</param>
        public ProjectCost(int period)
        {
            this.costEntries = new Dictionary<string, ProjectCostEntry>();
            this.Period = period;
        }

        /// <summary>
        /// Gets or sets the period value to be used in the calculation.
        /// </summary>
        public int Period { get; set; }

        /// <summary>
        /// Gets or sets the CapEx amount for the calculation.
        /// </summary>
        public long CapExAmount { get; set; }

        /// <summary>
        /// Gets or sets the implementation cost.
        /// </summary>
        public long ImplementationCost { get; set; }

        /// <summary>
        /// Gets the total cost calculated as the CapEx amount and the implementation cost.
        /// </summary>
        public long TotalCost
        {
            get
            {
                return this.CapExAmount + this.ImplementationCost;
            }
        }

        /// <summary>
        /// Populates the cost specific entries in the dictionary.
        /// </summary>
        /// <param name="costEntries">The list of cost entries.</param>
        public void Populate(IList<ProjectCostEntry> costEntries)
        {
            foreach (var costEntry in costEntries)
            {
                this.costEntries.Add(costEntry.ToString(), costEntry);
            }
        }

        /// <summary>
        /// Gets the actual or target cost entry for the given project type and the month.
        /// </summary>
        /// <param name="projectType">Type of project.</param>
        /// <param name="costType">The actual or target cost indicator.</param>
        /// <param name="month">Month for the calculation.</param>
        /// <returns>The cost value.</returns>
        public long GetCostEntry(ProjectType projectType, CostType costType, int month)
        {
            var key = ProjectCostEntry.ToString(projectType, costType, month);
            if (this.costEntries.ContainsKey(key))
            {
                return this.costEntries[key].Cost;
            }

            return 0;
        }

        /// <summary>
        /// Sets the actual or target cost entry for the given project type and the month.
        /// </summary>
        /// <param name="projectType">Type of project.</param>
        /// <param name="costType">The actual or target cost indicator.</param>
        /// <param name="month">Month for the calculation.</param>
        /// <param name="cost">The cost value.</param>
        public void SetCostEntry(ProjectType projectType, CostType costType, int month, long cost)
        {
            var key = ProjectCostEntry.ToString(projectType, costType, month);
            var costEntry = new ProjectCostEntry();
            costEntry.ProjectType = projectType;
            costEntry.CostType = costType;
            costEntry.Month = month;
            costEntry.Cost = cost;
            this.costEntries[key] = costEntry;
        }

        /// <summary>
        /// Gets the total targeted cost for all the project types for the given month.
        /// </summary>
        /// <param name="month">The month for which the total cost needs to be calculated.</param>
        /// <returns>The cost value.</returns>
        public long GetTargetTotal(int month)
        {
            var keyToSearch = ProjectCostEntry.ToString(CostType.Target, month);
            return this.GetTotal(keyToSearch);
        }

        /// <summary>
        /// Gets the total for actual cost for all the project types for the given month.
        /// </summary>
        /// <param name="month">The month for which the total cost needs to be calculated.</param>
        /// <returns>The cost value.</returns>
        public long GetActualTotal(int month)
        {
            var keyToSearch = ProjectCostEntry.ToString(CostType.Actual, month);
            return this.GetTotal(keyToSearch);
        }

        /// <summary>
        /// Gets the total estimated saving for the year.
        /// </summary>
        /// <param name="projectType">The type of project.</param>
        /// <param name="monthToStart">The month to start with.</param>
        /// <returns>The total cost.</returns>
        public long GetSavedYearToDate(ProjectType projectType, int monthToStart)
        {
            var startDate = new DateTime(DateTime.Now.Year, monthToStart, 1);
            var cost = 0L;
            for (var index = 0; index < this.Period; index++)
            {
                var month = startDate.AddMonths(index).Month;
                var keyToSearch = ProjectCostEntry.ToString(projectType, CostType.Target, month);
                cost += this.GetTotal(keyToSearch);
            }

            return cost;
        }

        /// <summary>
        /// Gets the total saving for the 12 months to be realized.
        /// </summary>
        /// <param name="projectType">The type of project.</param>
        /// <returns>The total cost.</returns>
        public long GetSavedOver12Months(ProjectType projectType)
        {
            var cost = 0L;
            for (var index = 0; index < 12; index++)
            {
                var keyToSearch = ProjectCostEntry.ToString(projectType, CostType.Target);
                cost += this.GetTotal(keyToSearch);
            }

            return cost;
        }

        /// <summary>
        /// Gets the total estimated saving to be realized.
        /// </summary>
        /// <param name="projectType">The type of project.</param>
        /// <param name="monthToStart">The month to start with.</param>
        /// <returns>The total cost.</returns>
        public long GetEstimatedSavingsToBeRealized(ProjectType projectType, int monthToStart)
        {
            var costFor12Months = this.GetSavedOver12Months(projectType);
            var costForPeriodMonths = this.GetSavedYearToDate(projectType, monthToStart);
            return costFor12Months - costForPeriodMonths;
        }

        /// <summary>
        /// Gets the total cost for the given key to be searched.
        /// </summary>
        /// <param name="keyToSearch">The key to be searched for.</param>
        /// <returns>The total cost.</returns>
        private long GetTotal(string keyToSearch)
        {
            var cost = 0L;
            foreach (var key in this.costEntries.Keys)
            {
                cost += key.Contains(keyToSearch) ? this.costEntries[key].Cost : 0;
            }

            return cost;
        }
    }
}