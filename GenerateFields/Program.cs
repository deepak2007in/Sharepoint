using Microsoft.SharePoint;
using System;
using System.Collections.Generic;
using System.Linq;

namespace GenerateFields
{
    public class Program
    {
        #region ENum

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

        #endregion

        private static IList<string> properties = new List<string>();

        private static string spSite;

        private static string listName;

        public static void Main(string[] args)
        {
            if (args.Length > 1)
            {
                spSite = args[0];
                listName = args[1];
            }
            else
            {
                Console.WriteLine("Enter value for SP Site");
                spSite = Console.ReadLine();
                Console.WriteLine("Enter value for List Name");
                listName = Console.ReadLine();
            }

            PopulateMonthsForProjectTypes();
            PopulateCalculationForProjectTypes();
            PopulateOtherProperties();

            Console.WriteLine("Choose operation to perform. \n\n 1 - Adding Properties \n 2 - Removing Properties \n 3 - Displaying Properties");
            var operation = Console.ReadKey();
            switch(operation.KeyChar)
            {
                case '1':
                    AddListProperties();
                    break;
                case '2':
                    RemoveListProperties();
                    break;
                case '3':
                    DisplayProperties();
                    break;
                default:
                    Console.WriteLine("Invalid Selection.");
                    break;
            }
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

        private static void AddListProperties()
        {
            using (var site = new SPSite(spSite))
            {
                site.AllowUnsafeUpdates = true;
                using (var web = site.OpenWeb())
                {
                    web.AllowUnsafeUpdates = true;
                    var list = web.Lists[listName];
                    foreach (var propertyName in properties)
                    {
                        try
                        {
                            var field = (SPFieldNumber)list.Fields.CreateNewField(SPFieldType.Number.ToString(), propertyName);
                            field.Required = false;
                            field.DisplayFormat = SPNumberFormatTypes.NoDecimal;
                            list.Fields.Add(field);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Unable to delete {0} - {1}", propertyName, ex.Message);
                        }
                    }
                    try
                    {
                        list.Update();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Unable to update {0} - {1}", ex.Message, ex.StackTrace);
                    }

                    web.AllowUnsafeUpdates = false;
                }
                site.AllowUnsafeUpdates = false;
            }
        }

        private static void RemoveListProperties()
        {
            using (var site = new SPSite(spSite))
            {
                site.AllowUnsafeUpdates = true;
                using (var web = site.OpenWeb())
                {
                    web.AllowUnsafeUpdates = true;
                    var list = web.Lists[listName];
                    foreach (var propertyName in properties)
                    {
                        try
                        {
                            list.Fields.Delete(propertyName);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Unable to delete {0} - {1}", propertyName, ex.Message);
                        }
                    }
                    try
                    {
                        list.Update();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Unable to update {0} - {1}", ex.Message, ex.StackTrace);
                    }
                    web.AllowUnsafeUpdates = false;
                }
                site.AllowUnsafeUpdates = false;
            }
        }

        private static void DisplayProperties()
        {
            Console.WriteLine("\nEnter string literal");
            var literal = Console.ReadLine();
            foreach(var propertyName in properties)
            {
                Console.WriteLine(literal, propertyName);
            }
        }
    }
}
