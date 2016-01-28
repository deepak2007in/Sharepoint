﻿using SCI.CIProject.ProjectSaving;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharePoint
{
    public partial class CalculationControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cat1.Text = cat2.Text = cat3.Text = cat4.Text = cat5.Text = cat6.Text = cat7.Text = cat8.Text = cat9.Text = cat10.Text = cat11.Text = cat12.Text = "10000";
            caa1.Text = caa2.Text = caa3.Text = caa4.Text = caa5.Text = caa6.Text = caa7.Text = caa8.Text = caa9.Text = caa10.Text = caa11.Text = caa12.Text = "5000";
            crt1.Text = crt2.Text = crt3.Text = crt4.Text = crt5.Text = crt6.Text = crt7.Text = crt8.Text = crt9.Text = crt10.Text = crt11.Text = crt12.Text = "10000";
            cra1.Text = cra2.Text = cra3.Text = cra4.Text = cra5.Text = cra6.Text = cra7.Text = cra8.Text = cra9.Text = cra10.Text = cra11.Text = cra12.Text = "4000";
            rgt1.Text = rgt2.Text = rgt3.Text = rgt4.Text = rgt5.Text = rgt6.Text = rgt7.Text = rgt8.Text = rgt9.Text = rgt10.Text = rgt11.Text = rgt12.Text = "10000";
            rga1.Text = rga2.Text = rga3.Text = rga4.Text = rga5.Text = rga6.Text = rga7.Text = rga8.Text = rga9.Text = rga10.Text = rga11.Text = rga12.Text = "6000";
            cit1.Text = cit2.Text = cit3.Text = cit4.Text = cit5.Text = cit6.Text = cit7.Text = cit8.Text = cit9.Text = cit10.Text = cit11.Text = cit12.Text = "10000";
            cia1.Text = cia2.Text = cia3.Text = cia4.Text = cia5.Text = cia6.Text = cia7.Text = cia8.Text = cia9.Text = cia10.Text = cia11.Text = cia12.Text = "7000";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var processingMonths = this.ProcessImplementationDate();
            this.ProcessTotalCost(processingMonths);
        }

        private int[] ProcessImplementationDate()
        {
            var implementationDateStr = txtImplementationDate.Text;
            var implementationDate = DateTime.ParseExact(implementationDateStr, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            var validationResult = ProjectTimeline.ValidateImplementationDate(implementationDate);
            if (validationResult)
            {
                var projectTimeLine = new ProjectTimeline(implementationDate);
                txtCompletionDate.Value = projectTimeLine.CompletionDate.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                var months = projectTimeLine.Months;
                if (months.Length == 12)
                {
                    lblmnth1.Text = months[0].ToString();
                    lblmnth2.Text = months[1].ToString();
                    lblmnth3.Text = months[2].ToString();
                    lblmnth4.Text = months[3].ToString();
                    lblmnth5.Text = months[4].ToString();
                    lblmnth6.Text = months[5].ToString();
                    lblmnth7.Text = months[6].ToString();
                    lblmnth8.Text = months[7].ToString();
                    lblmnth9.Text = months[8].ToString();
                    lblmnth10.Text = months[9].ToString();
                    lblmnth11.Text = months[10].ToString();
                    lblmnth12.Text = months[11].ToString();
                }
                return months;
            }
            return new int[0];
        }

        private void ProcessTotalCost(int[] months)
        {
            var capEx = long.Parse(txtcapExp.Text);
            var implementationCost = long.Parse(txtimplcost.Text);
            var period = int.Parse(ddlPeriod.SelectedValue);

            var projectCost = new ProjectCost(period);
            projectCost.CapExAmount = capEx;
            projectCost.ImplementationCost = implementationCost;

            lbltotal.Text = projectCost.TotalCost.ToString();

            var targets = new[] { cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12 };
            var actuals = new[] { caa1, caa2, caa3, caa4, caa5, caa6, caa7, caa8, caa9, caa10, caa11, caa12 };
            this.ProcessCheckBoxes(projectCost, chkCostAvoidance, ProjectType.CostAvoidance, targets, actuals, months);

            targets = new[] { crt1, crt2, crt3, crt4, crt5, crt6, crt7, crt8, crt9, crt10, crt11, crt12 };
            actuals = new[] { cra1, cra2, cra3, cra4, cra5, cra6, cra7, cra8, cra9, cra10, cra11, cra12 };
            this.ProcessCheckBoxes(projectCost, chkCostReduction, ProjectType.CostReduction, targets, actuals, months);

            targets = new[] { rgt1, rgt2, rgt3, rgt4, rgt5, rgt6, rgt7, rgt8, rgt9, rgt10, rgt11, rgt12 };
            actuals = new[] { rga1, rga2, rga3, rga4, rga5, rga6, rga7, rga8, rga9, rga10, rga11, rga12 };
            this.ProcessCheckBoxes(projectCost, chkRevenueGrowth, ProjectType.RevenueGrowth, targets, actuals, months);

            targets = new[] { cit1, cit2, cit3, cit4, cit5, cit6, cit7, cit8, cit9, cit10, cit11, cit12 };
            actuals = new[] { cia1, cia2, cia3, cia4, cia5, cia6, cia7, cia8, cia9, cia10, cia11, cia12 };
            this.ProcessCheckBoxes(projectCost, chkCapacityIncrease, ProjectType.CapacityIncrease, targets, actuals, months);

            var sharepointListItem = SharePointListItem.Convert(projectCost, int.Parse(lblmnth1.Text));
            twelvtxtcavalue.Text = sharepointListItem.SavedOver12Months_CA.ToString();
            twelvtxtcrvalue.Text = sharepointListItem.SavedOver12Months_CR.ToString();
            twelvtxtrgvalue.Text = sharepointListItem.SavedOver12Months_RG.ToString();
            twelvtxtcivalue.Text = sharepointListItem.SavedOver12Months_CI.ToString();
            twelvtxttatalvalue.Text = sharepointListItem.SavedOver12Months_Total.ToString();

            yeartxtca.Text = sharepointListItem.SavedYearToDate_CA.ToString();
            yeartxtcr.Text = sharepointListItem.SavedYearToDate_CR.ToString();
            yeartxtrg.Text = sharepointListItem.SavedYearToDate_RG.ToString();
            yeartxtci.Text = sharepointListItem.SavedYearToDate_CI.ToString();
            yearlbltotalval.Text = sharepointListItem.SavedYearToDate_Total.ToString();

            esttxtca.Text = sharepointListItem.EstimatedSaving_CA.ToString();
            esttxtcr.Text = sharepointListItem.EstimatedSaving_CR.ToString();
            esttxtrg.Text = sharepointListItem.EstimatedSaving_RG.ToString();
            esttxtci.Text = sharepointListItem.EstimatedSaving_CI.ToString();
            estlbltotalval.Text = sharepointListItem.EstimatedSaving_Total.ToString();

            targets = new[] { target1total, target2total, target3total, target4total, target5total, target6total, target7total, target8total, target9total, target10total, target11total, target12total };
            this.ProcessFooter(targets, months, projectCost.GetTargetTotal);

            actuals = new[] { actual1total, actual2total, actual3total, actual4total, actual5total, actual6total, actual7total, actual8total, actual9total, actual10total, actual11total, actual12total };
            this.ProcessFooter(actuals, months, projectCost.GetActualTotal);
        }

        private void ProcessFooter(TextBox[] textBoxes, int[] months, Func<int, long> calculator)
        {
            for (var index = 0; index < textBoxes.Length; index++)
            {
                textBoxes[index].Text = calculator.Invoke(months[index]).ToString();
            }
        }

        private void ProcessCheckBoxes(ProjectCost projectCost, CheckBox checkBox, ProjectType projectType, TextBox[] targets, TextBox[] actuals, int[] months)
        {
            var cost = 0L;
            for (var index = 0; index < months.Length; index++)
            {
                var parseResult = long.TryParse(targets[index].Text, out cost);
                projectCost.SetCostEntry(projectType, CostType.Target, months[index], checkBox.Checked && parseResult? cost : 0);
            }

            for (var index = 0; index < months.Length; index++)
            {
                var parseResult = long.TryParse(actuals[index].Text, out cost);
                projectCost.SetCostEntry(projectType, CostType.Actual, months[index], checkBox.Checked && parseResult ? cost : 0);
            }
        }
    }
}