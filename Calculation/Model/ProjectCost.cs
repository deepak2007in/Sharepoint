//-----------------------------------------------------------------------
// <copyright file="ProjectCost.cs" company="TechBlocks">
//     Class responsible for the composition of project specific metadata. 
// </copyright>
//-----------------------------------------------------------------------
namespace SCI.CIProject.ProjectSaving
{
    using System;
    using System.Collections.Generic;

    public class ProjectCost
    {
        public ProjectCost(int period)
        {
            this.Period = period;
        }
        public int Period { get; set; }
        public long CapExAmount { get; set; }
        public long ImplementationCost { get; set; }
        public long TotalCost
        {
            get
            {
                return this.CapExAmount + this.ImplementationCost;
            }
        }
        private readonly IDictionary<string, ProjectCostEntry> costEntries;

        public void Populate(IList<ProjectCostEntry> CostEntries)
        {

        }

        public long GetCostEntry(ProjectType projectType, CostType costType, int month)
        {
            throw new NotImplementedException();
        }

        public void SetCostEntry(ProjectType projectType, CostType costType, int month, long cost)
        {
            throw new NotImplementedException();
        }

        public long GetCostEntries(ProjectType projectType, CostType costType)
        {
            throw new NotImplementedException();
        }

        public long GetTargetTotal(int month)
        {
            throw new NotImplementedException();
        }

        public long GetActualTotal(int month)
        {
            throw new NotImplementedException();
        }

        public long GetSavedYearToDate(ProjectType projectType)
        {
            throw new NotImplementedException();
        }

        public long GetSavedOver12Months(ProjectType projectType)
        {
            throw new NotImplementedException();
        }

        public long GetEstimatedSavingsToBeRealized(ProjectType projectType)
        {
            throw new NotImplementedException();
        }
    }
}
