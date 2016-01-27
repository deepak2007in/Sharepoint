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
        public long Cost { get; set; }

        /// <summary>
        /// Provide the string representation of the <see cref="ProjectCostEntry"/> with the provided input values.
        /// </summary>
        /// <param name="projectType">Type of project.</param>
        /// <param name="costType">The actual or target cost indicator.</param>
        /// <param name="month">Month for the calculation.</param>
        /// <returns>The string representation of the <see cref="ProjectCostEntry"/></returns>
        public static string ToString(ProjectType projectType, CostType costType, int month)
        {
            return string.Format("{0}_{1}_{2}", projectType, costType, FormatMonth(month));
        }

        /// <summary>
        /// Provide the string representation of the <see cref="ProjectCostEntry"/> with the provided input values.
        /// </summary>
        /// <param name="projectType">Type of project.</param>
        /// <param name="costType">The actual or target cost indicator.</param>
        /// <returns>The string representation of the <see cref="ProjectCostEntry"/></returns>
        public static string ToString(ProjectType projectType, CostType costType)
        {
            return string.Format("{0}_{1}", projectType, costType);
        }

        /// <summary>
        /// Provide the string representation of the <see cref="ProjectCostEntry"/> with the provided input values.
        /// </summary>
        /// <param name="costType">The actual or target cost indicator.</param>
        /// <param name="month">Month for the calculation.</param>
        /// <returns>The string representation of the <see cref="ProjectCostEntry"/></returns>
        public static string ToString(CostType costType, int month)
        {

            return string.Format("{0}_{1}", costType, FormatMonth(month));
        }

        /// <summary>
        /// Overrides the string representation of the <see cref="ProjectCostEntry"/>.
        /// </summary>
        /// <remarks>This will be used as a key into the collection.</remarks>
        /// <returns>The string representation of the <see cref="ProjectCostEntry"/></returns>
        public override string ToString()
        {
            return this.Month > 0 ? string.Format("{0}_{1}_{2}", this.ProjectType, this.CostType, FormatMonth(this.Month)) : "NA";
        }

        private static string FormatMonth(int month)
        {
            return month.ToString().PadLeft(2, '0');
        }
    }
}
