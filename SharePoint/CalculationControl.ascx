<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculationControl.ascx.cs" Inherits="SharePoint.CalculationControl" ClientIDMode="Static" %>
<script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/js/language.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js" type="text/javascript"></script>
<script src="/js/Validate.js" type="text/javascript"></script>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function ValidateNumeric(object) {
        $(object).keypress(function (e) {
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                //display error message
                $(".errmsg").html("Digits Only").show().fadeOut("slow");
                return false;
            }
        });
    }


    function ApprovalValidation() {

        var errmgs = ValidateSaveFields();

        if (errmgs != "") {
            alert(errmgs);
            return false;
        }

        else { return true; }
    }


    $(document).ready(function () {
        var capexpamount = document.getElementById("<%=txtcapExp.ClientID %>");
        var implemcost = document.getElementById("<%=txtimplcost.ClientID %>");

        ValidateNumeric(capexpamount);
        ValidateNumeric(implemcost);
        $(capexpamount).blur(function () {
            if (implemcost.value != "") {
                var result = parseInt(capexpamount.value) + parseInt(implemcost.value);
                $("#<%=lbltotalval.ClientID %>").text(result);
                $("#<%=hdntotal.ClientID %>").val(result);
            }
            else {

                $("#<%=lbltotalval.ClientID %>").text(capexpamount.value);
                $("#<%=hdntotal.ClientID %>").val(capexpamount.value);
            }
        });

        $(implemcost).blur(function () {
            if (implemcost.value != "") {

                var result = parseInt(capexpamount.value) + parseInt(implemcost.value);
                $("#<%=lbltotalval.ClientID %>").text(result);
                $("#<%=hdntotal.ClientID %>").val(result);
            }
            else {
                $("#<%=lbltotalval.ClientID %>").text(capexpamount.value);
                $("#<%=hdntotal.ClientID %>").val(capexpamount.value);

            }
        });

    });
</script>
<table width="100%" style="background-color: Gray;">
    <tr>
        <td>
            <table style="background-color: White; width: 100%;">
                <tr style="color: White; background-color: #1a75ff;">
                    <td colspan="2">
                        <b style="font-size: 13px; text-align: left;">
                            <asp:Label ID="lblHeader" runat="server" Text="CONTINUOUS IMPROVEMENT PROJECT FORM">
                            </asp:Label>
                            <asp:Label ID="Label11" runat="server" Text="Project Status" Style="margin-left: 310px;">
                                        
                            </asp:Label>
                            <asp:Label ID="txtProjStatus" runat="server" Text="Draft" Style="background-color: Gray;
                                border-color: Gray; width: 30px;" />
                            &nbsp;&nbsp;
                            <asp:Label ID="lblAuditStatushdr" runat="server" Text="Audit Status">                                        
                            </asp:Label>
                            <asp:Label ID="txtAudStatus" runat="server" Text="Draft" Style="background-color: Gray;
                                border-color: Gray; width: 30px;" />
                            <asp:CheckBox ID="chklanguage" runat="server" Checked="false" Style="text-align: right;" />
                            <asp:Label ID="lblFrench" runat="server" Text="french" Style="text-align: right;"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td style="width: 60%;">
                        <table id="projectInformation" border="0px;" width="100%;">
                            <tr style="color: White; background-color: #ffa64d;">
                                <td colspan="2">
                                    <b style="font-size: 14px;">
                                        <label id="lblProjectInformation">
                                            Project Information
                                        </label>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblProjAcpt">
                                        Was this Project an accepted CI Idea?
                                    </label>
                                    :<span style="color: Red;">*</span>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdoCIAccept" runat="server" CausesValidation="true" RepeatDirection="Horizontal">
                                        <asp:ListItem Enabled="true" Text="No" Value="No" Selected="True"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="Yes" Value="Yes"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblfacility">
                                        Facility / Site
                                    </label>
                                    :<span style="color: Red;">*</span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlfacilty" runat="server" AutoPostBack="true">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trCII">
                                <td>
                                    <label id="lblciidea">
                                        CI Idea # - CII
                                    </label>
                                    : <span style="color: Red;">*</span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCiIdeaNum" AutoPostBack="true" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblprocejcid">
                                        Project ID - CIP
                                    </label>
                                </td>
                                <td>
                                    <asp:Label ID="lblProjCIPNum" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="prjName">
                                        Project Name
                                    </label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtProjectName" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblprojldrchk">
                                        Project Leader in AD
                                    </label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkIdentyAd" runat="server" Checked="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblprojldr">
                                        Project Leader
                                    </label>
                                </td>
                                <td>
                                   <asp:TextBox ID="txtProjLeaderUser" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblprojpriority">
                                        Project Prioritization
                                    </label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlprojpriority" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblprjclasf">
                                        Project Classification
                                    </label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProjClasfction" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblconfCI">
                                        Confidential CI
                                    </label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdoconfCI" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Enabled="true" Text="No" Value="No" Selected="true"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="Yes" Value="Yes"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblbnftchk">
                                        Lean Benefits
                                    </label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chlLeanBnft" runat="server" Checked="false" />
                                </td>
                            </tr>
                            <tr id="trLeanBn">
                                <td>
                                    <label id="lblLeanBnType">
                                        Lean Benefit Type
                                    </label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlLeanbnftType" runat="server" Height="20px" Width="250px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trProjType">
                                <td>
                                    <label id="lblprjtype">
                                        Project Type
                                    </label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkCostAvoidance" runat="server" Text="Cost Avoidance" />&nbsp;&nbsp;
                                    <asp:CheckBox ID="chkCostReduction" runat="server" Text="Cost Reduction" /></br>
                                    <asp:CheckBox ID="chkRevenueGrowth" runat="server" Text="Revenue Growth" />&nbsp;
                                    <asp:CheckBox ID="chkCapacityIncrease" runat="server" Text="Capacity Increase" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblBenefitType" runat="server">
                                        Business Cost Model
                                    </label>
                                </td>
                                <td>
                                    <asp:Label ID="lblbnfttype" runat="server" Width="325px" />
                                    <asp:HiddenField ID="hdnbnfttype" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 40%; vertical-align: top">
                        <table id="projectApproval" border="0px;" width="100%;">
                            <tr style="color: White; background-color: #ffa64d;">
                                <td colspan="2">
                                    <b style="font-size: 14px;">
                                        <label id="lblProjectApprovals" runat="server">
                                            Project Approvals
                                        </label>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblProjApBy">
                                        Project Approved By
                                    </label>
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="itresource">
                                        IT Resource Required
                                    </label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdoITResrc" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True" Value="No" Text="No"></asp:ListItem>
                                        <asp:ListItem Selected="False" Value="Yes" Text="Yes"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblitreview">
                                        IT Review
                                    </label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlItReview" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblfinreview">
                                        Finance Review
                                    </label>
                                </td>
                                <td>
                                    <asp:Label ID="lblfinancevalue" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdnfinvalue" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblcileaderapp">
                                        CI Leader Approval
                                    </label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCILeaderApprov" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblprojstatus">
                                        Project Status
                                    </label>
                                    :
                                </td>
                                <td>
                                    <asp:Label ID="lblprojstatusvalue" runat="server" Text="Draft" Style="background-color: Gray;
                                        border-color: Gray; width: 35%; color: White; text-align: center; display: inline-block;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td colspan="2" style="background-color: #FFCC99">
            </br><b><asp:Label ID="lblProjectDescription" runat="server" Text="Project Description"></asp:Label><span
                style="color: Red">*</span></b> :
        </td>
    </tr>
    <tr>
        <td colspan="2">
            
        </td>
    </tr>
    <tr>
        <td colspan="2" style="background-color: #FFCC99">
            <b>
                <asp:Label ID="lblProjectBenefits" runat="server" Text="Project Benefits"></asp:Label><span
                    style="color: Red">*</span></b> :
        </td>
    </tr>
    <tr>
        <td colspan="2" class="style3">
            
        </td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="lblFileUpload" Visible="false" runat="server" Font-Bold="true" Text="You have checked this CI as confidential and are not able to upload documents to SharePoint.</br> As a result, please email all attachments to CIAuditor@scilogistics.com with the CI # in the Subject Line. </br>- Thank you, The CI Team."></asp:Label>
        </td>
    </tr>
</table>
<table border="0" width="100%" id="tblcalculation">
    <tr>
        <td colspan="3" style="background-color: #FFCC99">
            <b>
                <asp:Label ID="lblCapitalsav" runat="server" Text="CI Project Savings"></asp:Label>
            </b>
        </td>
    </tr>
</table>
<div style="width: 100%;">
    <div class="col1">
        <table border="0" width="100%" style="padding-bottom: 33px;">
            <tr>
                <td>
                    <asp:Label ID="lblcaprequire" runat="server" Text="Capital Required"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rdoCapitalrequi" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Enabled="true" Text="No" Value="No" Selected="True"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Yes" Value="Yes"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCapExpAmount" runat="server" Text="CapEx Amount"></asp:Label>
                </td>
                <td>
                    $
                    <asp:TextBox ID="txtcapExp" Style="padding-top: 4px;" runat="server"></asp:TextBox>&nbsp;<span
                        class="errmsg"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblImplCost" runat="server" Text="Implementation Cost"></asp:Label>
                </td>
                <td>
                    $
                    <asp:TextBox ID="txtimplcost" Style="padding-top: 4px;" runat="server"></asp:TextBox>&nbsp;<span
                        class="errmsg"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbltotal" runat="server" Text="Total" Style="padding-top: 4px;"></asp:Label>
                </td>
                <td>
                    $
                    <asp:Label ID="lbltotalval" Style="padding-top: 4px;" runat="server"></asp:Label>
                    <asp:HiddenField runat="server" ID="hdntotal" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblProjStartDate" runat="server" Text="Project Start Date"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID ="dtProjStartDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblImpDate" runat="server" Text="Implementation Date"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID ="dtImplDate" runat="server" OnSelectionChanged="dtImplDate_SelectionChanged" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCompDate" runat="server" Text="Completion Date"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID ="dtComplDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblcancelDate" runat="server" Text="Cancelled Date"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID ="dtCanceDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblcelbtype" runat="server" Text="Celebration Type"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="chkcelebtype" runat="server"></asp:CheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCelebrDate" runat="server" Text="Celebration Date"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID ="dtCelebDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCelebType" runat="server" Text="Celebration Type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCelebType" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPeriod" runat="server" Text="Period"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlPeriod" runat="server" Width="40%">
                        <asp:ListItem Enabled="true" Text="Select" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="11" Value="11"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="12" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div class="col2">
        <table border="0" width="100%" style="vertical-align: top;">
            <tr id="twelveheader">
                <td colspan="2" style="background-color: #FFCC99;" class="style4">
                    <b>
                        <asp:Label ID="Label1" runat="server" Text="This CI will save over 12months"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr id="twelveCostAvoidance">
                <td>
                    <asp:Label ID="lblca" runat="server" Text="CA"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="twelvtxtcavalue" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="twelveCostReduction">
                <td>
                    <asp:Label ID="lblcr" runat="server" Text="CR"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="twelvtxtcrvalue" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="twelveRevenueGrowth">
                <td>
                    <asp:Label ID="lblrg" runat="server" Text="RG"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="twelvtxtrgvalue" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="twelveCapacityIncrease">
                <td>
                    <asp:Label ID="lblci" runat="server" Text="CI"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="twelvtxtcivalue" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="twelvetotal">
                <td id="twelvetotal">
                    <asp:Label ID="lbltotalAmount" runat="server" Text="Total"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="twelvtxttatalvalue" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div class="col3">
        <table border="0" width="100%" style="vertical-align: top;">
            <tr id="yearheader">
                <td colspan="2" style="background-color: #FFCC99">
                    <b>
                        <asp:Label ID="Label2" runat="server" Text="This CI has saved year to date"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr id="yearCostAvoidance">
                <td>
                    <asp:Label ID="yearlblca" runat="server" Text="CA"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="yeartxtca" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="yearCostReduction">
                <td>
                    <asp:Label ID="yearlblcr" runat="server" Text="CR"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="yeartxtcr" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="yearRevenueGrowth">
                <td>
                    <asp:Label ID="yearlblrg" runat="server" Text="RG"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="yeartxtrg" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="yearCapacityIncrease">
                <td>
                    <asp:Label ID="yearlblci" runat="server" Text="CI"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="yeartxtci" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="yeartotal">
                <td>
                    <asp:Label ID="yearlbltotal" runat="server" Text="Total"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="yearlbltotalval" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table border="0" width="100%" style="vertical-align: top;">
            <tr id="estheader">
                <td style="background-color: #FFCC99" colspan="2">
                    <b>
                        <asp:Label ID="Label3" runat="server" Text="Estimated savings to be realized are"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr id="estCostAvoidance">
                <td>
                    <asp:Label ID="estlblca" runat="server" Text="CA"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="esttxtca" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="estCostReduction">
                <td>
                    <asp:Label ID="estlblcr" runat="server" Text="CR"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="esttxtcr" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="estRevenueGrowth">
                <td>
                    <asp:Label ID="estlblrg" runat="server" Text="RG"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="esttxtrg" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="estCapacityIncrease">
                <td>
                    <asp:Label ID="estlblci" runat="server" Text="CI"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="esttxtci" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="esttotal">
                <td>
                    <asp:Label ID="estlbltotal" runat="server" Text="Total"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="estlbltotalval" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
</div>
<table id="dynamicTable" runat="server" border="1" width="100%" style="table-layout: fixed;
    empty-cells: show; display: none">
    <tr id="Header" style="background-color: Blue; color: White; border: 0px !Important;">
        <td>
            <asp:Label ID="lblprojtypheading" runat="server" Text="Project Type"></asp:Label>
        </td>
        <th>
            <asp:Label ID="lblmnth1" runat="server" Text="9"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth2" runat="server" Text="10"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth3" runat="server" Text="11"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth4" runat="server" Text="12"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth5" runat="server" Text="1"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth6" runat="server" Text="2"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth7" runat="server" Text="3"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth8" runat="server" Text="4"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth9" runat="server" Text="5"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth10" runat="server" Text="6"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth11" runat="server" Text="7"></asp:Label>
        </th>
        <th>
            <asp:Label ID="lblmnth12" runat="server" Text="8"></asp:Label>
        </th>
    </tr>
    <tr id="CostAvoidanceTarget">
        <td>
            <asp:Label ID="hdngCAAct" runat="server" Text="Cost Avoidance-Target"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="cat1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat5" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat7" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat10" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cat12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr id="CostAvoidanceActual">
        <td>
            <asp:Label ID="Label4" runat="server" Text="Cost Avoidance-Actual"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="caa1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa5" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa7" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa10" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="caa12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr id="CostReductionTarget">
        <td>
            <asp:Label ID="Label5" runat="server" Text="Cost Reduction-Target"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="crt1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt5" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt7" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt10" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="crt12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr id="CostReductionActual">
        <td>
            <asp:Label ID="Label6" runat="server" Text="Cost Reduction-Actual"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="cra1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra5" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra7" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra10" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cra12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr id="RevenueGrowthTarget">
        <td>
            <asp:Label ID="Label7" runat="server" Text="Revenue Growth-Target"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="rgt1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt5" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt7" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt10" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rgt12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr id="RevenueGrowthActual">
        <td>
            <asp:Label ID="Label8" runat="server" Text="Revenue Growth-Actual"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="rga1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga5" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga7" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga10" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="rga12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr id="CapacityIncreaseTarget">
        <td>
            <asp:Label ID="Label9" runat="server" Text="Capacity Increase-Target"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="cit1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit5" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit7" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit10" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cit12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr id="CapacityIncreaseActual">
        <td>
            <asp:Label ID="Label10" runat="server" Text="Capacity Increase-Actual"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="cia1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia5" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia7" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia10" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="cia12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr id="TotalTarget">
        <td>
            <asp:Label ID="targettotal" runat="server" Text="Target Total"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="target1total" runat="server" ReadOnly="true" ></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target2total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target3total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target4total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target5total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target6total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target7total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target8total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target9total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target10total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target11total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target12total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr id="TotalActual">
        <td>
            <asp:Label ID="ActualTotal" runat="server" Text="Actual Total"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="actual1total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual2total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual3total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual4total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual5total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual6total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual7total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual8total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual9total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual10total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual11total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="actual12total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
</table>
<div id="updatecalc"><asp:Button ID="btnupdatecal" runat="server" 
        Text="Update Calculation" Width="130px" /></div>
<div>
    <asp:Label ID="lblaction" runat="server" Text="Task Action :"></asp:Label>&nbsp;&nbsp;
    <asp:DropDownList ID="ddlRequesterStatus" runat="server">
        <asp:ListItem Selected="True" Value="Draft"></asp:ListItem>
        <asp:ListItem Value="Submit"></asp:ListItem>
    </asp:DropDownList>
</div>
<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
    <tr>
        <td nowrap="true" valign="top" width="213px">
        </td>
        <td width="350px">
            <asp:Button ID="btnSave" runat="server" CssClass="btnSave" Text="Submit" OnClick="btnSave_Click"
                OnClientClick="return ApprovalValidation();" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" CssClass="btnSave" CausesValidation="false"
                Text="Cancel" />&nbsp;&nbsp;
        </td>
    </tr>
</table>
