using SCI.CIProject.ProjectSaving;
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
            if (ProjectTimeline.ValidateImplementationDate(implementationDate))
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
            {
                throw new ArgumentException("Implementation Date should be greater than 10 months from now.");
            }
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
            // this.ProcessCheckBoxes(projectCost, chkCostAvoidance, ProjectType.CostAvoidance, targets)
        }


        private void ProcessCheckBoxes(ProjectCost projectCost, CheckBox checkBox, ProjectType projectType, TextBox[] targets, TextBox[] actuals, int[] months)
        {
            if (checkBox.Checked)
            {
                var projectCostEntry = new ProjectCostEntry();
                for (var index = 0; index < months.Length; index++)
                {
                    projectCostEntry.Month = months[index];
                    projectCostEntry.CostType = CostType.Target;
                    projectCostEntry.ProjectType = projectType;
                    projectCostEntry.Cost = long.Parse(targets[index].Text);
                    projectCost.SetCostEntry(projectCostEntry);
                }

                for (var index = 0; index < months.Length; index++)
                {
                    projectCostEntry.Month = months[index];
                    projectCostEntry.CostType = CostType.Actual;
                    projectCostEntry.ProjectType = projectType;
                    projectCostEntry.Cost = long.Parse(actuals[index].Text);
                    projectCost.SetCostEntry(projectCostEntry);
                }

            }
        }
    }
}