<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculationControl.ascx.cs" Inherits="SharePoint.CalculationControl" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(":checkbox").each(function () {
            hideRow($(this));
        });
        showTable();
        $(":checkbox").change(function () {
            showTable();
            hideRow($(this));
        });
        $("#datepicker").datepicker();
    });

    function hideRow(checkBox)
    {
        var valueSelected = checkBox.val();
        var isChecked = checkBox.is(':checked');
        if (isChecked) {
            $('#' + valueSelected + "Actual").show();
            $('#' + valueSelected + "Target").show();
        }
        else {
            $('#' + valueSelected + "Actual").hide();
            $('#' + valueSelected + "Target").hide();
        }
    }

    function showTable()
    {
        var checkedBoxes = $("input[type='checkbox']:checked");
        if(checkedBoxes.length == 0)
        {
            $('#Header').hide();
            $('#TotalActual').hide();
            $('#TotalTarget').hide();
            $('#dynamicTable').hide();
        }
        else
        {
            $('#dynamicTable').show();
            $('#Header').show();
            $('#TotalActual').show();
            $('#TotalTarget').show();
        }
    }
</script>
<asp:CheckBoxList ID="chklstProjtpe" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" OnSelectedIndexChanged="chklstProjtpe_SelectedIndexChanged">
                                        <asp:ListItem Enabled="true" Value="CostAvoidance" Text="Cost Avoidance"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Value="CostReduction" Text="Cost Reduction"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Value="RevenueGrowth" Text="Revenue Growth"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Value="CapacityIncrease" Text="Capacity Increase"></asp:ListItem>
                                    </asp:CheckBoxList>
<br />
Date: <input type="text" id="datepicker"></p>
<br />
<table id="projectSaving" border="1" width="100%" style="table-layout: fixed; empty-cells: show;">
    <tr>
        <td>
            <table border="1" width="30%" style="table-layout: fixed; empty-cells: show;">
                <tr>
                    <td>CapEx Amount</td>
                    <td><asp:TextBox ID="txtCapExAmount" runat="server" /></td>
                </tr>
                <tr>
                    <td>Implementation Cost</td>
                    <td><asp:TextBox ID="txtImplementationCost" runat="server" /></td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td><asp:TextBox ID="txtTotal" runat="server" /></td>
                </tr>
                <tr>
                    <td>Implementation Date</td>
                    <td><asp:TextBox ID="txtImplementationDate" runat="server" /></td>
                </tr>
                <tr>
                    <td>Completion Date</td>
                    <td><asp:TextBox ID="txtCompletionDate" runat="server" /></td>
                </tr>
            </table>
        </td>
        <td>
            <table border="1" width="30%" style="table-layout: fixed; empty-cells: show;">
                <tr>
                    <td>Period</td>
                    <td><asp:DropDownList ID="ddlPeriod" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">This CI has saved year to date:</td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server" /></td>
                </tr>
            </table>
        </td>
        <td></td>
    </tr>
</table>
<table id="dynamicTable" border="1" width="100%" style="table-layout: fixed; empty-cells: show; display:none">
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
            <asp:TextBox ID="ca4" runat="server"></asp:TextBox>
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
            <asp:TextBox ID="target1total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="target22total" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="targe3total" runat="server" ReadOnly="true"></asp:TextBox>
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
            <asp:TextBox ID="actual12Ctotal" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
</table>