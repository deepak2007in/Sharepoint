﻿using SCI.CIProject.ProjectSaving;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SharePoint
{
    public static class Extensions
    {
        public static bool IsDateEmpty(this System.Web.UI.WebControls.Calendar calender)
        {
            return calender.SelectedDates.Count == 0;
        }
    }
    public partial class CalculationControl : System.Web.UI.UserControl
    {
        private bool IsProjectApprovedByCI
        {
            get
            {
                return true;
            }
        }

        private bool isChangedToBlueChecked
        {
            get
            {
                return false;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cat1.Text = "1,000";
                cat2.Text = "500";
                cat3.Text = "5,000";
                cat4.Text = "1,00,000";
                cat5.Text = "10,000";
                cat6.Text = "10,000";
                cat7.Text = "1,000";
                cat8.Text = "5,000";
                cat9.Text = "1,000";
                cat10.Text = "10,000";
                cat11.Text = "10,000";
                cat12.Text = "10,000";

                //caa1.Text = "5,000";
                //caa2.Text = "5,000";
                //caa3.Text = "5,000";

                //caa4.Text = caa5.Text = caa6.Text = caa7.Text = caa8.Text = caa9.Text = caa10.Text = caa11.Text = caa12.Text = "5000";

                crt1.Text = "1,500";
                crt2.Text = "1,500";
                crt3.Text = "1,500";
                crt4.Text = "1,500";
                crt5.Text = "1,500";
                crt6.Text = "1,500";
                crt7.Text = "1,500";
                crt8.Text = "1,500";
                crt9.Text = "1,500";
                crt10.Text = "1,500";
                crt11.Text = "1,500";
                crt12.Text = "1,500";

                //cra1.Text = "1,000";
                //cra2.Text = "1,000";
                //cra3.Text = "1,000";

                this.ProcessTimeline(DateTime.Now);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var processingMonths = this.ProcessTimeline();
            this.ProcessCost(processingMonths);
        }

        protected void ddlPeriod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPeriod.SelectedValue != "0")
            {
                if (dtImplDate != null)
                {
                    var processingMonths = this.ProcessTimeline();
                }
            }
        }

        protected void dtImplDate_OnDateChanged(object sender, EventArgs e)
        {
            if (dtImplDate != null)
            {
                dtComplDate.Enabled = true;
                dtComplDate.SelectedDate = dtImplDate.SelectedDate.AddYears(1);
                dtComplDate.Enabled = false;
                var processingMonths = this.ProcessTimeline();
                //this.ProcessCost(processingMonths);

            }
        }

        protected void btnupdatecal_Click(object sender, EventArgs e)
        {
            var processingMonths = this.ProcessTimeline();
            this.ProcessCost(processingMonths);
        }

        #region Calculation
        private void DisableWritingInCalculation(Control control, bool flag)
        {
            if (control is TextBox)
            {
                var textBox = control as TextBox;
                textBox.ReadOnly = flag;
            }
            else
            {
                if (control.Controls.Count > 0)
                {
                    foreach (var childControl in control.Controls)
                    {
                        this.DisableWritingInCalculation(childControl as Control, flag);
                    }
                }
            }
        }
        private TextBox[] TargetTextBoxesForCA
        {
            get
            {
                return new[] { cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12 };
            }
        }

        private TextBox[] ActualTextBoxesForCA
        {
            get
            {
                return new[] { caa1, caa2, caa3, caa4, caa5, caa6, caa7, caa8, caa9, caa10, caa11, caa12 };
            }
        }

        private TextBox[] TargetTextBoxesForCR
        {
            get
            {
                return new[] { crt1, crt2, crt3, crt4, crt5, crt6, crt7, crt8, crt9, crt10, crt11, crt12 };
            }
        }

        private TextBox[] ActualTextBoxesForCR
        {
            get
            {
                return new[] { cra1, cra2, cra3, cra4, cra5, cra6, cra7, cra8, cra9, cra10, cra11, cra12 };
            }
        }

        private TextBox[] TargetTextBoxesForRG
        {
            get
            {
                return new[] { rgt1, rgt2, rgt3, rgt4, rgt5, rgt6, rgt7, rgt8, rgt9, rgt10, rgt11, rgt12 };
            }
        }

        private TextBox[] ActualTextBoxesForRG
        {
            get
            {
                return new[] { rga1, rga2, rga3, rga4, rga5, rga6, rga7, rga8, rga9, rga10, rga11, rga12 };
            }
        }

        private TextBox[] TargetTextBoxesForCI
        {
            get
            {
                return new[] { cit1, cit2, cit3, cit4, cit5, cit6, cit7, cit8, cit9, cit10, cit11, cit12 };
            }
        }

        private TextBox[] ActualTextBoxesForCI
        {
            get
            {
                return new[] { cia1, cia2, cia3, cia4, cia5, cia6, cia7, cia8, cia9, cia10, cia11, cia12 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth1
        {
            get
            {
                return new[] { caa1, cra1, rga1, cia1 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth2
        {
            get
            {
                return new[] { caa2, cra2, rga2, cia2 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth3
        {
            get
            {
                return new[] { caa3, cra3, rga3, cia3 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth4
        {
            get
            {
                return new[] { caa4, cra4, rga4, cia4 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth5
        {
            get
            {
                return new[] { caa5, cra5, rga5, cia5 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth6
        {
            get
            {
                return new[] { caa6, cra6, rga6, cia6 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth7
        {
            get
            {
                return new[] { caa7, cra7, rga7, cia7 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth8
        {
            get
            {
                return new[] { caa8, cra8, rga8, cia8 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth9
        {
            get
            {
                return new[] { caa9, cra9, rga9, cia9 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth10
        {
            get
            {
                return new[] { caa10, cra10, rga10, cia10 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth11
        {
            get
            {
                return new[] { caa11, cra11, rga11, cia11 };
            }
        }

        private TextBox[] ActualTextBoxesForMonth12
        {
            get
            {
                return new[] { caa12, cra12, rga12, cia12 };
            }
        }

        private Label[] MonthLabels
        {
            get
            {
                return new[] { lblmnth1, lblmnth2, lblmnth3, lblmnth4, lblmnth5, lblmnth6, lblmnth7, lblmnth8, lblmnth9, lblmnth10, lblmnth11, lblmnth12 };
            }
        }

        private int[] ProcessTimeline()
        {
            var implementationDate = dtImplDate.SelectedDate;
            return this.ProcessTimeline(implementationDate);
        }

        private int[] ProcessTimeline(DateTime implementationDate)
        {
            var validationResult = ProjectTimeline.ValidateImplementationDate(implementationDate);
            if (validationResult)
            {
                var projectTimeLine = new ProjectTimeline(implementationDate);
                return this.ProcessTimeline(projectTimeLine);
            }
            return new int[0];
        }

        private int[] ProcessTimeline(ProjectTimeline projectTimeLine)
        {
            if (!dtImplDate.IsDateEmpty())
                dtComplDate.SelectedDate = projectTimeLine.CompletionDate;
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
            this.DisableCells(projectTimeLine.MonthDates, this.MonthLabels);
            this.ProcessColor(projectTimeLine, this.IsProjectApprovedByCI, this.IsChildControlStateCleared);
            if (ddlPeriod.SelectedValue == "0")
            {
                ddlPeriod.SelectedValue = projectTimeLine.ClosestPeriod.ToString();
            }
            return months;

        }

        private ProjectCost ProcessCost(int[] months)
        {
            var period = int.Parse(ddlPeriod.SelectedValue);
            var projectCost = new ProjectCost(period);
            projectCost.CapExAmount = this.GetProcessedCost(txtcapExp.Text.Trim());
            projectCost.ImplementationCost = this.GetProcessedCost(txtimplcost.Text.Trim());
            hdntotal.Value = string.Format("{0:n0}", projectCost.TotalCost);
            this.ProcessCheckBoxes(projectCost, chkCostAvoidance, ProjectType.CostAvoidance, this.TargetTextBoxesForCA, this.ActualTextBoxesForCA, months);
            this.ProcessCheckBoxes(projectCost, chkCostReduction, ProjectType.CostReduction, this.TargetTextBoxesForCR, this.ActualTextBoxesForCR, months);
            this.ProcessCheckBoxes(projectCost, chkRevenueGrowth, ProjectType.RevenueGrowth, this.TargetTextBoxesForRG, this.ActualTextBoxesForRG, months);
            this.ProcessCheckBoxes(projectCost, chkCapacityIncrease, ProjectType.CapacityIncrease, this.TargetTextBoxesForCI, this.ActualTextBoxesForCI, months);

            var sharepointListItem = SharePointListItem.Convert(projectCost, int.Parse(lblmnth1.Text));
            this.ProcessTotal(sharepointListItem, projectCost, months);
            return projectCost;
        }

        private void ProcessColor(ProjectTimeline projectTimeLine, bool isProjectApprovedByCI, bool isChangedToBlueChecked)
        {
            var color = this.ProcessColor(projectTimeLine.MonthDates, this.MonthLabels, isProjectApprovedByCI, isChangedToBlueChecked);
            switch (color)
            {
                case StatusColor.Yellow:
                    this.ProcessColor(txtProjStatus, "YELLOW", Color.Yellow, Color.Black);
                    this.ProcessColor(lblprojstatusvalue, "YELLOW", Color.Yellow, Color.Black);
                    break;
                case StatusColor.Green:
                    this.ProcessColor(txtProjStatus, "GREEN", Color.Green, Color.White);
                    this.ProcessColor(lblprojstatusvalue, "GREEN", Color.Green, Color.White);
                    break;
                case StatusColor.Red:
                    this.ProcessColor(txtProjStatus, "RED", Color.Red, Color.White);
                    this.ProcessColor(lblprojstatusvalue, "RED", Color.Red, Color.White);
                    break;
                case StatusColor.Black:
                    this.ProcessColor(txtProjStatus, "BLACK", Color.Black, Color.White);
                    this.ProcessColor(lblprojstatusvalue, "BLACK", Color.Black, Color.White);
                    break;
                case StatusColor.Gray:
                    this.ProcessColor(txtProjStatus, "DRAFT", Color.Gray, Color.White);
                    this.ProcessColor(lblprojstatusvalue, "DRAFT", Color.Gray, Color.White);
                    break;
                case StatusColor.Blue:
                    this.ProcessColor(txtProjStatus, "BLUE", Color.Blue, Color.White);
                    this.ProcessColor(lblprojstatusvalue, "BLUE", Color.Blue, Color.White);
                    break;
            }
        }

        private void ProcessColor(WebControl control, string displayText, Color backColor, Color foreColor)
        {
            if (control is ITextControl)
            {
                var textControl = control as ITextControl;
                textControl.Text = displayText;
            }
            control.BackColor = backColor;
            control.ForeColor = foreColor;
        }

        private StatusColor ProcessColor(DateTime[] monthDates, Label[] labels, bool isProjectApprovedByCI, bool isChangedToBlueChecked)
        {
            if (isProjectApprovedByCI)
            {
                if (isChangedToBlueChecked)
                {
                    return StatusColor.Blue;
                }

                if (monthDates[monthDates.Length - 1] < DateTime.Now)
                {
                    var lbl = labels[monthDates.Length - 1];
                    var actuals = this.GetActualsForMonth(lbl.ID);
                    var areAllValuesEnteredForActuals = true;
                    foreach (var actual in actuals)
                    {
                        if (actual.Text == "" && this.GetCheckBoxForActual(actual.ID).Checked)
                        {
                            areAllValuesEnteredForActuals = false;
                            break;
                        }
                    }

                    if (areAllValuesEnteredForActuals)
                    {
                        return StatusColor.Black;
                    }
                }
                DateTime monthDate;
                for (var index = 0; index < monthDates.Length; index++)
                {
                    monthDate = monthDates[index];

                    var lbl = labels[index];
                    var actuals = this.GetActualsForMonth(lbl.ID);
                    foreach (var actual in actuals)
                    {
                        var continueProcessing = false;
                        var statusColor = ProjectColor.GetColor(monthDate, actual.Text, this.GetCheckBoxForActual(actual.ID).Checked, out continueProcessing);
                        if (!continueProcessing)
                        {
                            return statusColor;
                        }
                    }
                }

                return StatusColor.Green;
            }
            else
            {
                return StatusColor.Gray;
            }
        }

        private void ProcessTotal(SharePointListItem sharepointListItem, ProjectCost projectCost, int[] months)
        {
            twelvtxtcavalue.Text = string.Format("{0:n0}", sharepointListItem.SavedOver12Months_CA);
            twelvtxtcrvalue.Text = string.Format("{0:n0}", sharepointListItem.SavedOver12Months_CR);
            twelvtxtrgvalue.Text = string.Format("{0:n0}", sharepointListItem.SavedOver12Months_RG);
            twelvtxtcivalue.Text = string.Format("{0:n0}", sharepointListItem.SavedOver12Months_CI);
            twelvtxttatalvalue.Text = string.Format("{0:n0}", sharepointListItem.SavedOver12Months_Total);

            yeartxtca.Text = string.Format("{0:n0}", sharepointListItem.SavedYearToDate_CA);
            yeartxtcr.Text = string.Format("{0:n0}", sharepointListItem.SavedYearToDate_CR);
            yeartxtrg.Text = string.Format("{0:n0}", sharepointListItem.SavedYearToDate_RG);
            yeartxtci.Text = string.Format("{0:n0}", sharepointListItem.SavedYearToDate_CI);
            yearlbltotalval.Text = string.Format("{0:n0}", sharepointListItem.SavedYearToDate_Total);

            esttxtca.Text = string.Format("{0:n0}", sharepointListItem.EstimatedSaving_CA);
            esttxtcr.Text = string.Format("{0:n0}", sharepointListItem.EstimatedSaving_CR);
            esttxtrg.Text = string.Format("{0:n0}", sharepointListItem.EstimatedSaving_RG);
            esttxtci.Text = string.Format("{0:n0}", sharepointListItem.EstimatedSaving_CI);
            estlbltotalval.Text = string.Format("{0:n0}", sharepointListItem.EstimatedSaving_Total);

            var targets = new[] { target1total, target2total, target3total, target4total, target5total, target6total, target7total, target8total, target9total, target10total, target11total, target12total };
            this.ProcessFooter(targets, months, projectCost.GetTargetTotal);

            var actuals = new[] { actual1total, actual2total, actual3total, actual4total, actual5total, actual6total, actual7total, actual8total, actual9total, actual10total, actual11total, actual12total };
            this.ProcessFooter(actuals, months, projectCost.GetActualTotal);
        }

        private void ProcessFooter(TextBox[] textBoxes, int[] months, Func<int, long> calculator)
        {
            for (var index = 0; index < textBoxes.Length; index++)
            {
                textBoxes[index].Text = string.Format("{0:n0}", calculator.Invoke(months[index]));
            }
        }

        private void ProcessCheckBoxes(ProjectCost projectCost, CheckBox checkBox, ProjectType projectType, TextBox[] targets, TextBox[] actuals, int[] months)
        {

            for (var index = 0; index < months.Length; index++)
            {
                projectCost.SetCostEntry(projectType, CostType.Target, months[index], this.GetProcessedCost(checkBox, targets[index].Text));
            }

            for (var index = 0; index < months.Length; index++)
            {
                projectCost.SetCostEntry(projectType, CostType.Actual, months[index], this.GetProcessedCost(checkBox, actuals[index].Text));
            }
        }

        private long GetProcessedCost(CheckBox checkBox, string costInput)
        {
            var cost = GetProcessedCost(costInput);
            return checkBox.Checked ? cost : 0L;
        }

        private long GetProcessedCost(string costInput)
        {
            var cost = 0L;
            long.TryParse(costInput.Replace(",", string.Empty), out cost);
            return cost;
        }

        private void ProcessCheckBoxes(ProjectCost projectCost, ProjectType projectType, TextBox[] targets, TextBox[] actuals, int[] months)
        {
            for (var index = 0; index < months.Length; index++)
            {
                var cost = projectCost.GetCostEntry(projectType, CostType.Target, months[index]);
                targets[index].Text = cost.ToString();
            }

            for (var index = 0; index < months.Length; index++)
            {
                var cost = projectCost.GetCostEntry(projectType, CostType.Actual, months[index]);
                actuals[index].Text = cost.ToString();
            }
        }

        private TextBox[] GetActualsForMonth(string monthLabel)
        {
            TextBox[] textBoxes;
            switch (monthLabel)
            {
                case "lblmnth1":
                    textBoxes = this.ActualTextBoxesForMonth1;
                    break;
                case "lblmnth2":
                    textBoxes = this.ActualTextBoxesForMonth2;
                    break;
                case "lblmnth3":
                    textBoxes = this.ActualTextBoxesForMonth3;
                    break;
                case "lblmnth4":
                    textBoxes = this.ActualTextBoxesForMonth4;
                    break;
                case "lblmnth5":
                    textBoxes = this.ActualTextBoxesForMonth5;
                    break;
                case "lblmnth6":
                    textBoxes = this.ActualTextBoxesForMonth6;
                    break;
                case "lblmnth7":
                    textBoxes = this.ActualTextBoxesForMonth7;
                    break;
                case "lblmnth8":
                    textBoxes = this.ActualTextBoxesForMonth8;
                    break;
                case "lblmnth9":
                    textBoxes = this.ActualTextBoxesForMonth9;
                    break;
                case "lblmnth10":
                    textBoxes = this.ActualTextBoxesForMonth10;
                    break;
                case "lblmnth11":
                    textBoxes = this.ActualTextBoxesForMonth11;
                    break;
                case "lblmnth12":
                    textBoxes = this.ActualTextBoxesForMonth12;
                    break;
                default:
                    textBoxes = new TextBox[0];
                    break;
            }

            return textBoxes;
        }

        private CheckBox GetCheckBoxForActual(string textBoxId)
        {
            if (textBoxId.StartsWith("cia"))
            {
                return chkCapacityIncrease;
            }
            else if (textBoxId.StartsWith("cra"))
            {
                return chkCostReduction;
            }
            else if (textBoxId.StartsWith("caa"))
            {
                return chkCostAvoidance;
            }
            else if (textBoxId.StartsWith("rga"))
            {
                return chkRevenueGrowth;
            }
            return null;
        }

        private void DisableCells(DateTime[] monthDates, Label[] labels)
        {
            var thisMonth = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            for (var index = 0; index < monthDates.Length; index++)
            {
                var monthDate = monthDates[index];
                var lblMonth = labels[index];
                if (monthDate < thisMonth)
                {
                    this.DisableCells(labels[index].ID.ToLower(), true);
                }
                else
                {
                    this.DisableCells(labels[index].ID.ToLower(), false);
                }
            }
        }

        private void DisableCells(string monthLabel, bool shouldBeEnabled)
        {
            var textBoxes = this.GetActualsForMonth(monthLabel);
            foreach (var textBox in textBoxes)
            {
                textBox.Enabled = shouldBeEnabled;
            }
        }

        #endregion

    }
}