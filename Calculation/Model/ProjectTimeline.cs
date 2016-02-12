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
            this.ImplementationDate = implementationDate;
            this.Months = new int[12];
            this.MonthDates = new DateTime[12];
            this.GenerateMonths();
        }

        /// <summary>
        /// Gets all implementation months in the form of array.
        /// </summary>
        public int[] Months { get; private set; }

        /// <summary>
        /// Gets all the chunks for the date interval.
        /// </summary>
        public DateTime[] MonthDates { get; private set; }

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
        /// Validates that the implementation date should not be less than 10 months from now.
        /// </summary>
        /// <param name="implementationDate">The provided  implementation date for the project.</param>
        /// <returns>True if it is greater than 10 months from now; false otherwise.</returns>
        public static bool ValidateImplementationDate(DateTime implementationDate)
        {
            var today = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            if (implementationDate >= today.AddMonths(-10) && implementationDate <= today.AddMonths(6))
            {
                return true;
            }
            else
            {
                if (!(implementationDate >= today.AddMonths(-10)))
                {
                    throw new ArgumentException("Implementation Date should not be  < 10 months from the current month and year.");
                }
                else
                {
                    throw new ArgumentException("Implementation Date should not be > 6 months from current date.");
                }
            }
        }

        /// <summary>
        /// Determines that the implementation date does fall in first 5 days of the month or not.
        /// </summary>
        /// <returns>True if the implementation date does fall in first 5 days of the month; false otherwise.</returns>
        private bool IsImplementationDateBaselined()
        {
            return this.ImplementationDate.Day < 6;
        }

        /// <summary>
        /// Generates the 12 month based upon the implementation date.
        /// </summary>
        private void GenerateMonths()
        {
            var isDayOfMonthBaselined = this.IsImplementationDateBaselined();
            var startDate = isDayOfMonthBaselined ? this.ImplementationDate : this.ImplementationDate.AddMonths(1);
            for (var index = 0; index < 12; index++)
            {
                this.Months[index] = startDate.AddMonths(index).Month;
                this.MonthDates[index] = new DateTime(startDate.AddMonths(index).Year, this.Months[index], 1);
            }
        }
    }
}
