
using System;
namespace ProjectSaving
{
    public class ProjectTimeline
    {
        private const int BaselineDayOfMonth = 5;
        private const int NumberOfDaysInAYear = 365;
        public int[] Months { get; private set; }
        public DateTime ImplementationDate { get; private set; }
        public DateTime CompletionDate
        {
            get
            {
                return ImplementationDate.AddDays(NumberOfDaysInAYear);
            }
        }
        public ProjectTimeline(DateTime implementationDate)
        {

        }

        private bool ValidateImplementationDate()
        {
            throw new NotImplementedException();
        }

        private bool IsImplementationDateBaselined()
        {
            throw new NotImplementedException();
        }

        private void GenerateMonths()
        {
            throw new NotImplementedException();
        }
    }
}
