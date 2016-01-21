//-----------------------------------------------------------------------
// <copyright file="ProjectMetaData.cs" company="TechBlocks">
//     Class responsible for the composition of project specific metadata. 
// </copyright>
//-----------------------------------------------------------------------
namespace SCI.CIProject.ProjectSaving
{
    using System;
    using System.Collections.Generic;

    /// <summary>
    /// Provides access to the timeline and cost specific metadata for the project.
    /// </summary>
    public class ProjectMetaData
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ProjectMetaData"/> class with the provided project type, implementation date and period value.
        /// </summary>
        /// <param name="projectType">The project type.</param>
        /// <param name="implementationDate">The implementation date.</param>
        /// <param name="period">The period value.</param>
        public ProjectMetaData(ProjectType projectType, DateTime implementationDate, int period)
        {
            this.ProjectType = projectType;
            this.ProjectTimeline = new ProjectTimeline(implementationDate);
            this.ProjectCost = new ProjectCost(period);
        }

        /// <summary>
        /// Gets the types of the project.
        /// </summary>
        public ProjectType ProjectType { get; private set; }

        /// <summary>
        /// Gets or sets a value indicating whether the project has lean benefits.
        /// </summary>
        public bool LeanBenefits { get; set; }

        /// <summary>
        /// Gets the instance to access the project timeline metadata.
        /// </summary>
        public ProjectTimeline ProjectTimeline { get; private set; }

        /// <summary>
        /// Gets the instance to access the project cost metadata 
        /// </summary>
        public ProjectCost ProjectCost { get; private set; }

        /// <summary>
        /// Populate the cost based entries into the in-memory collection.
        /// </summary>
        /// <param name="costEntries">The list of cost specific entries coming from data-store.</param>
        public void Populate(IList<ProjectCostEntry> costEntries)
        {
            this.ProjectCost.Populate(costEntries);
        }
    }
}