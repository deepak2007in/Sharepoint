//-----------------------------------------------------------------------
// <copyright file="ProjectType.cs" company="TechBlocks">
//     ENumeration specifying the various types of projects related to cost saving.
// </copyright>
//-----------------------------------------------------------------------
namespace SCI.CIProject.ProjectSaving
{
    using System;

    /// <summary>
    /// ENumeration specifying the various types of projects related to cost saving.
    /// </summary>
    public enum ProjectType
    {
        /// <summary>
        /// Indicates that the project is chosen because it helps avoid additional cost.
        /// </summary>
        CostAvoidance,

        /// <summary>
        /// Indicates that the project is chosen because it helps reducing overall cost.
        /// </summary>
        CostReduction,

        /// <summary>
        /// Indicates that the project is chosen because it helps revenue growth.
        /// </summary>
        RevenueGrowth,

        /// <summary>
        /// Indicates that the project is chosen because it helps increase in capacity.
        /// </summary>
        CapacityIncrease
    }
}
