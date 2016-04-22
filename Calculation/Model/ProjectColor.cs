//-----------------------------------------------------------------------
// <copyright file="ProjectCost.cs" company="TechBlocks">
//     Class responsible for the project cost related metadata. 
// </copyright>
//-----------------------------------------------------------------------
namespace SCI.CIProject.ProjectSaving
{
    using System;
    public static class ProjectColor
    {
        public static StatusColor GetColor(DateTime inputDate, string value, bool isApplicable, out bool continueProcessing)
        {
            continueProcessing = true;
            if (isApplicable && string.IsNullOrEmpty(value))
            {
                var isRed = ProjectColor.IsRed(inputDate);
                if (isRed)
                {
                    continueProcessing = false;
                    return StatusColor.Red;
                }
                else
                {
                    var isYellow = ProjectColor.IsYellow(inputDate);
                    if (isYellow)
                    {
                        continueProcessing = false;
                        return StatusColor.Yellow;
                    }
                    else
                    {
                        var isGreen = ProjectColor.IsGreen(inputDate);
                        if (isGreen)
                        {
                            return StatusColor.Green;
                        }
                    }
                }
            }

            return StatusColor.Green;
        }

        public static bool IsGreen(DateTime inputDate)
        {
            var thisMonthStartDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            var legitimateStartDate = thisMonthStartDate.AddMonths(-1);
            return inputDate >= legitimateStartDate;
        }

        public static bool IsYellow(DateTime inputDate)
        {
            var thisMonthStartDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            var legitimateStartDate = thisMonthStartDate.AddMonths(-2);
            var legitimateEndDate = thisMonthStartDate.AddMonths(-1);
            return inputDate >= legitimateStartDate && inputDate < legitimateEndDate;
        }

        public static bool IsRed(DateTime inputDate)
        {
            var thisMonthStartDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            var legitimateStartDate = thisMonthStartDate.AddMonths(-2);
            return inputDate < legitimateStartDate;
        }
    }
}