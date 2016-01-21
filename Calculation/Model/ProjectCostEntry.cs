//-----------------------------------------------------------------------
// <copyright file="ProjectCostEntry.cs" company="TechBlocks">
//     Structure that defines the cost specific entry to be input for the cost calculation. 
// </copyright>
//-----------------------------------------------------------------------
namespace SCI.CIProject.ProjectSaving
{
    /// <summary>
    /// Defines the structure of the cost specific entry to be input for the cost calculation. 
    /// </summary>
    public struct ProjectCostEntry
    {
        /// <summary>
        /// Gets or sets the type of the project the entry belongs to.
        /// </summary>
        public ProjectType ProjectType { get; set; }

        /// <summary>
        /// Gets or sets the type of the cost i.e. actual or target.
        /// </summary>
        public CostType CostType { get; set; }

        /// <summary>
        /// Gets or sets the month entry for the cost.
        /// </summary>
        public int Month { get; set; }

        /// <summary>
        /// Gets or sets the actual cost.
        /// </summary>
        public int Cost { get; set; }

        /// <summary>
        /// Overrides the string representation of the <see cref="ProjectCostEntry"/>.
        /// </summary>
        /// <remarks>This will be used as a key into the collection.</remarks>
        /// <returns>The string representation of the <see cref="ProjectCostEntry"/></returns>
        public override string ToString()
        {
            return this.Month > 0 ? string.Format("{0}_{1}_{2}", this.ProjectType, this.CostType, this.Month) : "NA";
        }
    }
}
