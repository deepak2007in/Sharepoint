//-----------------------------------------------------------------------
// <copyright file="ProjectTimeline.cs" company="TechBlocks">
//     Class responsible for providing the implementation months for the project. 
// </copyright>
//-----------------------------------------------------------------------
namespace SCI.CIProject.ProjectSaving
{
    using System;

    /// <summary>
    /// Class responsible for providing the implementation months for the project.
    /// </summary>
    public class ProjectTimeline
    {
        /// <summary>
        /// Constant specifying the day of month after which the generation of implementation month starts from next month.
        /// </summary>
        private const int BaselineDayOfMonth = 5;

        /// <summary>
        /// Constant specifying the number of days in a year.
        /// </summary>
        private const int NumberOfDaysInAYear = 365;

        /// <summary>
        /// Initializes a new instance of the <see cref="ProjectTimeline"/> class with the given implementation date.
        /// </summary>
        /// <param name="implementationDate">The provided implementation date for the project.</param>
        public ProjectTimeline(DateTime implementationDate)
        {
        }

        /// <summary>
        /// Gets all implementation months in the form of array.
        /// </summary>
        public int[] Months { get; private set; }

        /// <summary>
        /// Gets the implementation date for the project.
        /// </summary>
        public DateTime ImplementationDate { get; private set; }

        /// <summary>
        /// Gets the completion date for the project.
        /// </summary>
        public DateTime CompletionDate
        {
            get
            {
                return this.ImplementationDate.AddDays(NumberOfDaysInAYear);
            }
        }

        /// <summary>
        /// Validates that the implementation date should be less than 10 months from now.
        /// </summary>
        /// <param name="implementationDate">The provided  implementation date for the project.</param>
        /// <returns>True if it is greater than 10 months from now; false otherwise.</returns>
        public static bool ValidateImplementationDate(DateTime implementationDate)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Determines that the implementation date does fall in first 5 days of the month or not.
        /// </summary>
        /// <returns>True if the implementation date does fall in first 5 days of the month; false otherwise.</returns>
        private bool IsImplementationDateBaselined()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Generates the 12 month based upon the implementation date.
        /// </summary>
        private void GenerateMonths()
        {
            throw new NotImplementedException();
        }
    }
}
