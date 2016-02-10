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
        /// <param name="projectCostEntry">Instance of the <see cref="ProjectCostEntry" /> structure.</param>
        public void SetCostEntry(ProjectCostEntry projectCostEntry)
        {
            var key = projectCostEntry.ToString();
            this.costEntries[key] = projectCostEntry;
        }

        public void SetCostEntry(ProjectType projectType, CostType costTye, int month, long cost)
        {
            var projectCostEntry = new ProjectCostEntry();
            projectCostEntry.ProjectType = projectType;
            projectCostEntry.CostType = costTye;
            projectCostEntry.Month = month;
            projectCostEntry.Cost = cost;
            this.SetCostEntry(projectCostEntry);
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
                var keyToSearch = ProjectCostEntry.ToString(projectType, CostType.Actual, month);
                cost += this.GetTotal(keyToSearch);
            }

            return cost;
        }

        /// <summary>
        /// Gets the total saving for the 12 months to be realized.
        /// </summary>
        /// <param name="projectType">The type of project.</param>
        /// <param name="monthToStart">The month to start with.</param>
        /// <returns>The total cost.</returns>
        public long GetSavedOver12Months(ProjectType projectType, int monthToStart)
        {
            var startDate = new DateTime(DateTime.Now.Year, monthToStart, 1);
            var cost = this.GetSavedYearToDate(projectType, monthToStart);
            for (var index = this.Period; index < 12; index++)
            {
                var month = startDate.AddMonths(index).Month;
                var keyToSearch = ProjectCostEntry.ToString(projectType, CostType.Target, month);
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
            var costFor12Months = this.GetSavedOver12Months(projectType, monthToStart);
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