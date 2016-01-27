using System;
using System.Collections.Generic;
using System.Linq;

namespace GenerateFields
{
    public class Program
    {
        enum Months
        {
            Jan,
            Feb,
            Mar,
            Apr,
            May,
            Jun,
            Jul,
            Aug,
            Sep,
            Oct,
            Nov,
            Dec
        }

        enum ProjectType
        {
            CA,
            CR,
            RG,
            CI,
            Total
        }

        enum CostType
        {
            Actual,
            Target
        }

        enum Calculation
        {
            SavedOver12Months,
            SavedYearToDate,
            EstimatedSaving
        }

        private static IList<string> properties = new List<string>();
        public static void Main(string[] args)
        {
            PopulateMonthsForProjectTypes();
            PopulateCalculationForProjectTypes();
            PopulateOtherProperties();
            Console.Read();
        }

        private static void PopulateMonthsForProjectTypes()
        {
            var projectTypes = Enum.GetNames(typeof(ProjectType));
            var costTypes = Enum.GetNames(typeof(CostType));
            var months = Enum.GetNames(typeof(Months));

            var projectCosts = projectTypes.SelectMany(projectType => costTypes.Select(cost => string.Format("{0}_{1}", projectType, cost)));
            var projectCostMonths = projectCosts.SelectMany(projectCost => months.Select(month => string.Format("{0}_{1}", projectCost, month)));
            projectCostMonths.ToList().ForEach(properties.Add);
        }

        private static void PopulateCalculationForProjectTypes()
        {
            var calculations = Enum.GetNames(typeof(Calculation));
            var projectTypes = Enum.GetNames(typeof(ProjectType));

            var calculationProjects = calculations.SelectMany(calculation => projectTypes.Select(projectType => string.Format("{0}_{1}", calculation, projectType)));
            calculationProjects.ToList().ForEach(properties.Add);
        }

        private static void PopulateOtherProperties()
        {

        }
    }
}
