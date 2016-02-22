<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculationControl.ascx.cs" Inherits="SharePoint.CalculationControl" ClientIDMode="Static" %>
<script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/js/language.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js" type="text/javascript"></script>
<script src="/js/Validate.js" type="text/javascript"></script>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    var errmgs = "";

    function NumberOnly() {
        var AsciiValue = event.keyCode
        if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
            event.returnValue = true;
        else
            event.returnValue = false;
    }

    function FormatCurrency(ctrl) {
        //Check if arrow keys are pressed - we want to allow navigation around textbox using arrow keys
        if (event.keyCode == 37 || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40) {
            return;
        }

        var val = ctrl.value;

        val = val.replace(/,/g, "")
        ctrl.value = "";
        val += '';
        x = val.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';

        var rgx = /(\d+)(\d{3})/;

        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }

        ctrl.value = x1 + x2;
    }

    function ApprovalValidation() {
        var blankTargetCount = $(".Target").filter(function () {
            if (GetCheckBoxSelected(this)) {
                var value = parseInt(this.value.replace(',', ''));
                return isNaN(value) || value < 1;
            }
        }).length;
        if (blankTargetCount > 0) {
            alert("Please enter all the target values before submitting the form.");
            return false;
        }

        var invalidActualCount = $(".Actual").filter(function () {
            var value = parseInt(this.value.replace(',', ''));
            return !isNaN(value) && value < 1;
        }).length;

        if (invalidActualCount > 0) {
            alert("Actual values should not be set to zero.");
            return false;
        }

        if ($('[id*="ddlRequesterStatus"]').children("option").filter(":selected").text() == "") {
            alert("Please select Action");
            return false;
        }
        if ($('[id*="ddlRequesterStatus"]').children("option").filter(":selected").text() == "Draft") {
            if (!$('[id*="txtProjectName"]').val().length > 0) {
                alert("Project Name Required");
                return false;
            }
            else {
                return true;
            }
        }

        if ($('[id*="ddlRequesterStatus"]').children("option").filter(":selected").text() == "Submit") {
            errmgs = ValidateSaveFields();
            ValidateUploadedFile();

            if (RTE_GetRichEditTextOnly("<%= txtProjectDescription.ClientID %>") == "") {
                errmgs += "Project Description Required\n";
            }
            if (RTE_GetRichEditTextOnly("<%= txtProjectBenefits.ClientID %>") == "") {
                errmgs += "Project Benefits Required\n";
            }
            if (errmgs != "") {
                alert(errmgs);
                return false;
            }

            else { return true; }
        }
    }


    $(document).ready(function () {
        var capexpamount = document.getElementById("<%=txtcapExp.ClientID %>");
        var implemcost = document.getElementById("<%=txtimplcost.ClientID %>");

        if (capexpamount.value != "" || implemcost.value != "") {
            var capexpamountvalue = capexpamount.value.replace(',', '');
            var implemcostvalue = implemcost.value.replace(',', '');
            var result = parseInt(capexpamountvalue) + parseInt(implemcostvalue);
            $("#<%=lbltotalval.ClientID %>").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        }
        var ProjectDescription = "<%= txtProjectDescription.ClientID %>";
        (document.getElementById(ProjectDescription + "_toolbar")).style.width = "950px";
        (document.getElementById(ProjectDescription + "_iframe")).style.width = "950px";


        var projectBenifit = "<%= txtProjectBenefits.ClientID %>";
        (document.getElementById(projectBenifit + "_toolbar")).style.width = "950px";
        (document.getElementById(projectBenifit + "_iframe")).style.width = "950px";

        var requestorCommnets = "<%= txtComments.ClientID %>";
        (document.getElementById(requestorCommnets + "_toolbar")).style.width = "950px";
        (document.getElementById(requestorCommnets + "_iframe")).style.width = "950px";
    });

    //CICidea File
    function ValidateUploadedFile() {
        if (document.getElementById('<%=trListOfAttachment.ClientID%>').style.display != 'none') {
            var selectedvalue = $('#<%= rdoconfCI.ClientID %> input:checked').val()
            if (selectedvalue == "No") {

                var FileUpload1Data = document.getElementById('<%= FileUpload1.ClientID %>');
                var FileUploadPath1 = FileUpload1Data.value;
                var FileUpload2Data = document.getElementById('<%= FileUpload2.ClientID %>');
                var FileUploadPath2 = FileUpload2Data.value;
                var FileUpload3Data = document.getElementById('<%= FileUpload3.ClientID %>');
                var FileUploadPath3 = FileUpload3Data.value;
                var FileUpload4Data = document.getElementById('<%= FileUpload4.ClientID %>');
                var FileUploadPath4 = FileUpload4Data.value;
                var FileUpload5Data = document.getElementById('<%= FileUpload5.ClientID %>');
                var FileUploadPath5 = FileUpload5Data.value;
                var FileUpload6Data = document.getElementById('<%= FileUpload6.ClientID %>');
                var FileUploadPath6 = FileUpload6Data.value;
                var FileUpload7Data = document.getElementById('<%= FileUpload7.ClientID %>');
                var FileUploadPath7 = FileUpload7Data.value;
                var FileUpload8Data = document.getElementById('<%= FileUpload8.ClientID %>');
                var FileUploadPath8 = FileUpload8Data.value;
                var FileUpload9Data = document.getElementById('<%= FileUpload9.ClientID %>');
                var FileUploadPath9 = FileUpload9Data.value;
                var FileUpload10Data = document.getElementById('<%= FileUpload10.ClientID %>');
                var FileUploadPath10 = FileUpload10Data.value;
                var FileUpload11Data = document.getElementById('<%= FileUpload11.ClientID %>');
                var FileUploadPath11 = FileUpload11Data.value;
                var FileUpload12Data = document.getElementById('<%= FileUpload12.ClientID %>');
                var FileUploadPath12 = FileUpload12Data.value;
                var FileUpload13Data = document.getElementById('<%= FileUpload13.ClientID %>');
                var FileUploadPath13 = FileUpload13Data.value;
                var FileUpload14Data = document.getElementById('<%= FileUpload14.ClientID %>');
                var FileUploadPath14 = FileUpload14Data.value;
                var FileUpload15Data = document.getElementById('<%= FileUpload15.ClientID %>');
                var FileUploadPath15 = FileUpload15Data.value;
                var FileUpload16Data = document.getElementById('<%= FileUpload16.ClientID %>');
                var FileUploadPath16 = FileUpload16Data.value;
                var FileUpload17Data = document.getElementById('<%= FileUpload17.ClientID %>');
                var FileUploadPath17 = FileUpload17Data.value;
                var FileUpload18Data = document.getElementById('<%= FileUpload18.ClientID %>');
                var FileUploadPath18 = FileUpload18Data.value;
                var FileUpload19Data = document.getElementById('<%= FileUpload19.ClientID %>');
                var FileUploadPath19 = FileUpload19Data.value;
                var FileUpload20Data = document.getElementById('<%= FileUpload20.ClientID %>');
                var FileUploadPath20 = FileUpload20Data.value;
                var fileCreated = $('[id$=hdnFileCounder]').val();
                if (fileCreated == "1" && FileUploadPath1 == '' && FileUploadPath2 == '' && FileUploadPath3 == '' && FileUploadPath4 == '' && FileUploadPath5 == '' && FileUploadPath6 == '' && FileUploadPath7 == '' && FileUploadPath8 == '' && FileUploadPath9 == '' && FileUploadPath10 == '' && FileUploadPath11 == '' && FileUploadPath12 == '' && FileUploadPath13 == '' && FileUploadPath14 == '' && FileUploadPath15 == '' && FileUploadPath16 == '' && FileUploadPath17 == '' && FileUploadPath18 == '' && FileUploadPath19 == '' && FileUploadPath20 == '') {
                    errmgs += "Please attach at least one file. \n";

                }
                if (FileUploadPath1 != '') {

                    if (ValidateFile1() == false) {
                        errmgs += "- Please attach valid file in File Control 1. \n";

                    }
                }
                if (FileUploadPath2 != '') {
                    if (ValidateFile2() == false) {
                        errmgs += "- Please attach valid file in File Control 2. \n";

                    }
                }
                if (FileUploadPath3 != '') {
                    if (ValidateFile3() == false) {
                        errmgs += "- Please attach valid file in File Control 2. \n";

                    }
                }
                if (FileUploadPath4 != '') {
                    if (ValidateFile4() == false) {
                        errmgs += "- Please attach valid file in File Control 3. \n";

                    }
                }
                if (FileUploadPath5 != '') {
                    if (ValidateFile5() == false) {
                        errmgs += "- Please attach valid file in File Control 4. \n";

                    }
                }
                if (FileUploadPath6 != '') {
                    if (ValidateFile6() == false) {
                        errmgs += "- Please attach valid file in File Control 5. \n";

                    }
                }
                if (FileUploadPath7 != '') {
                    if (ValidateFile7() == false) {
                        errmgs += "- Please attach valid file in File Control 6. \n";

                    }
                }
                if (FileUploadPath8 != '') {
                    if (ValidateFile8() == false) {
                        errmgs += "- Please attach valid file in File Control 7. \n";

                    }
                }
                if (FileUploadPath9 != '') {
                    if (ValidateFile9() == false) {
                        errmgs += "- Please attach valid file in File Control 8. \n";

                    }
                }
                if (FileUploadPath10 != '') {
                    if (ValidateFile10() == false) {
                        errmgs += "- Please attach valid file in File Control 9. \n";

                    }
                }
                if (FileUploadPath10 != '') {
                    if (ValidateFile10() == false) {
                        errmgs += "- Please attach valid file in File Control 10. \n";

                    }
                }
                if (FileUploadPath11 != '') {
                    if (ValidateFile11() == false) {
                        errmgs += "- Please attach valid file in File Control 11. \n";

                    }
                }
                if (FileUploadPath12 != '') {
                    if (ValidateFile12() == false) {
                        errmgs += "- Please attach valid file in File Control 12. \n";

                    }
                }
                if (FileUploadPath13 != '') {
                    if (ValidateFile13() == false) {
                        errmgs += "- Please attach valid file in File Control 13. \n";

                    }
                }
                if (FileUploadPath14 != '') {
                    if (ValidateFile14() == false) {
                        errmgs += "- Please attach valid file in File Control 14. \n";

                    }
                }
                if (FileUploadPath15 != '') {
                    if (ValidateFile15() == false) {
                        errmgs += "- Please attach valid file in File Control 15. \n";

                    }
                }
                if (FileUploadPath16 != '') {
                    if (ValidateFile16() == false) {
                        errmgs += "- Please attach valid file in File Control 16. \n";

                    }
                }
                if (FileUploadPath17 != '') {
                    if (ValidateFile17() == false) {
                        errmgs += "- Please attach valid file in File Control 17. \n";

                    }
                }
                if (FileUploadPath18 != '') {
                    if (ValidateFile18() == false) {
                        errmgs += "- Please attach valid file in File Control 18. \n";

                    }
                }
                if (FileUploadPath19 != '') {
                    if (ValidateFile19() == false) {
                        errmgs += "- Please attach valid file in File Control 19. \n";

                    }
                }
                if (FileUploadPath20 != '') {
                    if (ValidateFile20() == false) {
                        errmgs += "- Please attach valid file in File Control 20. \n";

                    }
                }
            }
        }
        return errmgs;
    }


    function ValidateFile1() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload1.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile2() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload2.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile3() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload3.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile4() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload4.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile5() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload5.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile6() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload6.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile9() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload9.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile10() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload10.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile11() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload11.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile12() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload12.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile13() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload13.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile14() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload14.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile15() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload15.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile16() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload16.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile17() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload17.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile18() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload18.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile19() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload19.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
    function ValidateFile20() {
        var validFilesTypes = ["bmp", "gif", "txt", "png", "jpg", "jpeg", "doc", "xls", "docx", "pdf", "ppt", "pdf", "pst", "xlsx"];
        var file = document.getElementById("<%=FileUpload20.ClientID%>");
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        return isValidFile;
    }
</script>
<asp:HiddenField ID="hdnactionuser" runat="server" />
<asp:HiddenField ID="hdnAppAction" runat="server" />
<asp:HiddenField ID="hdnCurrentStage" runat="server" />
<asp:HiddenField ID="hdnFileCounder" runat="server" />
<asp:HiddenField ID="hdncurrentuser" runat="server" />
<asp:HiddenField ID="hdnAuditStatus" runat="server" />
<table width="100%" style="border-color: Gray;" frame="box">
    <tr style="color: White; background-color: #001933;">
        <td colspan="2">
            <table width="100%" style="border-color: Gray;" frame="box">
                <tr>
                    <td style="font-family: trebuchet ms, lucida grande, sans-serif">
                        <asp:Label ID="lblciprojheader" Width="500px" runat="server" Font-Size="17pt" Text="Continuous Improvement Project Form"></asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td align="right" class="style1">
                                    <b>
                                        <asp:Label ID="lblWorkflowTop" runat="server" Text="Workflow Status"></asp:Label>
                                        <asp:Label ID="trWorkflowTop" runat="server" Text="NEW"></asp:Label>&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="chklanguage" runat="server" Checked="false" Style="text-align: right;" />
                                        <asp:Label ID="lblFrench" runat="server" Text="French" Style="text-align: right;"></asp:Label></b>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style1">
                                    <b>
                                        <asp:Label ID="Label11" runat="server" Text="Project Status"></asp:Label>
                                        <asp:Label ID="txtProjStatus" runat="server" Text="DRAFT" Style="border-color: Gray; padding: 3px;" />&nbsp;&nbsp;
                                        <asp:Label ID="lblAuditStatushdr" runat="server" Text="Audit Status"></asp:Label>
                                        <asp:Label ID="txtAudStatus" runat="server" Text="Draft" Style="background-color: Gray; border-color: Gray; padding: 3px;" /></b>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="style8">
            <table id="projectInformation" frame="box" width="100%">
                <tr style="color: black; background-color: #66d9ff; height: 25px;">
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
                        <span style="color: Red;">*</span>
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
                        <span style="color: Red;">*</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlfacilty" runat="server" AutoPostBack="true" Height="20px"
                            Width="250px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trCII">
                    <td>
                        <label id="lblciidea">
                            CI Idea # - CII
                        </label>
                        <span style="color: Red;">*</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCiIdeaNum" AutoPostBack="true" runat="server" Height="20px"
                            Width="250px">
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
                        <span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProjectName" runat="server" MaxLength="250" Height="15px" Width="245px"
                            Font-Size="8pt" />
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
                        <asp:TextBox ID="txtnormaluser" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblprojpriority">
                            Project Prioritization :
                        </label>
                        <span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlprojpriority" runat="server" Height="20px" Width="250px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblprjclasf">
                            Project Classification
                        </label>
                        <span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProjClasfction" runat="server" Height="20px" Width="250px">
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
                    <td>&nbsp;<asp:CheckBox ID="chlLeanBnft" runat="server" Checked="false" />
                    </td>
                </tr>
                <tr id="trLeanBn">
                    <td>
                        <label id="lblLeanBnType">
                            Lean Benefit Type
                        </label>
                    </td>
                    <td>&nbsp;<asp:DropDownList ID="ddlLeanbnftType" runat="server" Height="20px" Width="250px">
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trProjectType" runat="server">
                    <td style="vertical-align: top">
                        <label id="lblprjtype">
                            Project Type
                        </label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkCostAvoidance" runat="server" Text="Cost Avoidance" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkCostReduction" runat="server" Text="Cost Reduction" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkRevenueGrowth" runat="server" Text="Revenue Growth" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkCapacityIncrease" runat="server" Text="Capacity Increase" />
                                </td>
                            </tr>
                        </table>
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
            <table id="projectApproval" frame="box" style="height: 207px; width: 514px">
                <tr style="color: black; background-color: #66d9ff; height: 25px;">
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
                        <span style="color: Red">*</span>
                    </td>
                    <td></td>
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
                        <asp:DropDownList ID="ddlItReview" runat="server" Height="20px" Width="250px">
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
                        <asp:DropDownList ID="ddlCILeaderApprov" runat="server" Height="20px" Width="250px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblprojstatus">
                            Project Status
                        </label>
                    </td>
                    <td>
                        <asp:Label ID="lblprojstatusvalue" runat="server" Text="DRAFT" Style="border-color: Gray; font-weight: bold; padding: 3px;" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table frame="box">
    <tr>
        </br>
        <td colspan="2" style="background-color: #d6d6c2">
            <b>
                <asp:Label ID="lblProjectDescription" runat="server" Text="Project Description (Describe the project, background issue, objective)"></asp:Label></b>
            <span style="color: Red">*</span></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:TextBox runat="server" ID="txtProjectDescription" TextMode="MultiLine"
                Height="103px" Columns="100" Rows="8" RichText="true" RichTextMode="Compatible"
                AllowHyperlink="true" Width="970px" />
        </td>
    </tr>
    <tr>
        <td colspan="2" style="background-color: #d6d6c2">
            <b>
                <asp:Label ID="lblProjectBenefits" runat="server" Text="Project Benefits - Why are we looking at this project? Hard/Soft Benefits? In Scope/Out of Scope & include calculations"></asp:Label></b>
            <span style="color: Red">*</span></td>
    </tr>
    <tr>
        <td colspan="2" class="style3">
            <asp:TextBox runat="server" ID="txtProjectBenefits" TextMode="MultiLine"
                Height="103px" Columns="100" Rows="8" RichText="true" RichTextMode="Compatible"
                AllowHyperlink="true" Width="970px" />
        </td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="lblFileUpload" Visible="false" runat="server" Font-Bold="true" Text="You have checked this CI as confidential and are not able to upload documents to SharePoint.</br> As a result, please email all attachments to CIAuditor@scilogistics.com with the CI # in the Subject Line. </br>- Thank you, The CI Team."></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" width="100%" id="tblcalculation">
                <tr>
                    <td colspan="2" style="color: black; background-color: #66d9ff; height: 25px;">
                        <b style="font-size: 14px;">
                            <asp:Label ID="lblCapitalsav" runat="server" Text="CI Project Savings"></asp:Label>
                        </b>
                    </td>
                </tr>
            </table>
            <div style="width: 100%;">
                <div class="col1">
                    <table border="0" width="100%" style="padding-bottom: 33px; color: Black;">
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
                            <td>$
                                <asp:TextBox ID="txtcapExp" Style="padding-top: 4px; text-align: right" Text="0"
                                    runat="server" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);" onkeypress="return NumberOnly()"
                                    Height="15px" Width="133px" Font-Size="8pt"></asp:TextBox>&nbsp;<span class="errmsg"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblImplCost" runat="server" Text="Implementation Cost"></asp:Label>
                            </td>
                            <td>$
                                <asp:TextBox ID="txtimplcost" Text="0" Style="padding-top: 4px; text-align: right"
                                    runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                                    Height="15px" Width="133px" Font-Size="8pt"></asp:TextBox>&nbsp;<span class="errmsg"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbltotal" runat="server" Text="Total" Style="padding-top: 4px;"></asp:Label>
                            </td>
                            <td>$
                                <asp:Label ID="lbltotalval" Style="padding-top: 4px;" runat="server"></asp:Label>
                                <asp:HiddenField runat="server" ID="hdntotal" EnableViewState="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblProjStartDate" runat="server" Text="Project Start Date"></asp:Label>
                            </td>
                            <td>
                                <asp:Calendar ID="dtProjStartDate" runat="server" />
                            </td>
                            <td>(dd/mm/yyyy)<span style="color: Red">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblImpDate" runat="server" Text="Implementation Date"></asp:Label>
                            </td>
                            <td>
                                <asp:Calendar ID="dtImplDate" runat="server" />
                            </td>
                            <td>(dd/mm/yyyy)<span style="color: Red">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCompDate" runat="server" Text="Completion Date"></asp:Label>
                            </td>
                            <td>
                                <asp:Calendar ID="dtComplDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblcancelDate" runat="server" Text="Cancelled Date"></asp:Label>
                            </td>
                            <td>
                                <asp:Calendar ID="dtCanceDate" runat="server" />
                            </td>
                            <td>(dd/mm/yyyy)
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <asp:Label ID="lblcelbtype" runat="server" Text="Celebration Date"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkcelebtype" runat="server"></asp:CheckBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Calendar ID="dtCelebDate" runat="server" />
                            </td>
                            <td>(dd/mm/yyyy)
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
                    </table>
                </div>
                <div class="col2">
                    <table frame="box" style="width: 50%;">
                        <tr>
                            <td style="background-color: #66d9ff; color: Black;">
                                <b>
                                    <asp:Label ID="lblPeriod" runat="server" Text="Select Period"></asp:Label></b>
                            </td>
                            <td>
                                <b>
                                    <asp:DropDownList ID="ddlPeriod" runat="server" Width="100%">
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
                                </b>
                            </td>
                        </tr>
                    </table>
                    </br></br></br>
                    <table border="0" width="100%" style="vertical-align: top; padding-top: 4px;" id="hidecol2">
                        <tr id="twelveheader">
                            <td colspan="2" style="background-color: #66d9ff; color: Black;" class="style4">
                                <b>
                                    <asp:Label ID="Label1" runat="server" Text="This CI will save over 12 months"></asp:Label>
                                </b>
                            </td>
                        </tr>
                        <tr id="twelveCostAvoidance">
                            <td>
                                <asp:Label ID="lblca" runat="server" Text="CA"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="twelvtxtcavalue" runat="server" ReadOnly="true" Height="15px" Width="40%"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="twelveCostReduction">
                            <td>
                                <asp:Label ID="lblcr" runat="server" Text="CR"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="twelvtxtcrvalue" runat="server" ReadOnly="true" Height="15px" Width="40%"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="twelveRevenueGrowth">
                            <td>
                                <asp:Label ID="lblrg" runat="server" Text="RG"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="twelvtxtrgvalue" runat="server" ReadOnly="true" Height="15px" Width="40%"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="twelveCapacityIncrease">
                            <td>
                                <asp:Label ID="lblci" runat="server" Text="CI"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="twelvtxtcivalue" runat="server" ReadOnly="true" Height="15px" Width="40%"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="twelvetotal">
                            <td id="twelvetotals">
                                <asp:Label ID="lbltotalAmount" runat="server" Text="Total"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="twelvtxttatalvalue" runat="server" ReadOnly="true" Height="15px"
                                Width="40%" Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col3">
                    <table border="0" width="100%" style="vertical-align: top; color: Black;">
                        <tr id="yearheader">
                            <td colspan="2" style="background-color: #66d9ff;">
                                <b>
                                    <asp:Label ID="Label2" runat="server" Text="This CI has saved year to date"></asp:Label>
                                </b>
                            </td>
                        </tr>
                        <tr id="yearCostAvoidance">
                            <td>
                                <asp:Label ID="yearlblca" runat="server" Text="CA"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="yeartxtca" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="yearCostReduction">
                            <td>
                                <asp:Label ID="yearlblcr" runat="server" Text="CR"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="yeartxtcr" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="yearRevenueGrowth">
                            <td>
                                <asp:Label ID="yearlblrg" runat="server" Text="RG"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="yeartxtrg" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="yearCapacityIncrease">
                            <td>
                                <asp:Label ID="yearlblci" runat="server" Text="CI"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="yeartxtci" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="yeartotal">
                            <td>
                                <asp:Label ID="yearlbltotal" runat="server" Text="Total"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="yearlbltotalval" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table border="0" width="100%" style="vertical-align: top; color: Black;">
                        <tr id="estheader">
                            <td style="background-color: #66d9ff" colspan="2">
                                <b>
                                    <asp:Label ID="Label3" runat="server" Text="Estimated savings to be realized are"></asp:Label>
                                </b>
                            </td>
                        </tr>
                        <tr id="estCostAvoidance">
                            <td>
                                <asp:Label ID="estlblca" runat="server" Text="CA"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="esttxtca" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="estCostReduction">
                            <td>
                                <asp:Label ID="estlblcr" runat="server" Text="CR"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="esttxtcr" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="estRevenueGrowth">
                            <td>
                                <asp:Label ID="estlblrg" runat="server" Text="RG"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="esttxtrg" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="estCapacityIncrease">
                            <td>
                                <asp:Label ID="estlblci" runat="server" Text="CI"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="esttxtci" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="esttotal">
                            <td>
                                <asp:Label ID="estlbltotal" runat="server" Text="Total"></asp:Label>
                            </td>
                            <td>$<asp:TextBox ID="estlbltotalval" runat="server" ReadOnly="true" Height="15px" Width="133px"
                                Style="text-align: right" Font-Size="8pt"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <table id="dynamicTable" runat="server" border="0" width="100%" style="color: Black; table-layout: fixed; empty-cells: show; display: none"
                frame="box">
                <tr id="Tr1" style="background-color: Blue; color: White; border: 0px !Important;">
                    <td>
                        <b>
                            <asp:Label ID="lblprojtypheading" runat="server" Text="Project Type"></asp:Label></b>
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
                        <asp:TextBox ID="cat1" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                           Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat2" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat3" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat4" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat5" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat6" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat7" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat8" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat9" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat10" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat11" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cat12" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                </tr>
                <tr id="CostAvoidanceActual">
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Cost Avoidance-Actual"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="caa1" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa2" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa3" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa4" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa5" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa6" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa7" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa8" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa9" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa10" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa11" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="caa12" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                </tr>
                <tr id="CostReductionTarget">
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Cost Reduction-Target"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="crt1" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt2" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt3" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt4" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt5" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt6" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt7" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt8" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt9" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt10" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt11" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="crt12" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                </tr>
                <tr id="CostReductionActual">
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Cost Reduction-Actual"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="cra1" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra2" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra3" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra4" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra5" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra6" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra7" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra8" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra9" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra10" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra11" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cra12" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                </tr>
                <tr id="RevenueGrowthTarget">
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Revenue Growth-Target"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt1" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt2" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt3" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt4" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt5" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt6" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt7" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt8" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt9" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt10" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt11" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rgt12" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                </tr>
                <tr id="RevenueGrowthActual">
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Revenue Growth-Actual"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="rga1" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga2" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga3" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga4" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga5" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga6" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga7" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga8" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga9" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga10" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga11" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="rga12" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                </tr>
                <tr id="CapacityIncreaseTarget">
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Capacity Increase-Target"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="cit1" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit2" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit3" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit4" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit5" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit6" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit7" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit8" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit9" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit10" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit11" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cit12" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Target"></asp:TextBox>
                    </td>
                </tr>
                <tr id="CapacityIncreaseActual">
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Capacity Increase-Actual"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="cia1" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia2" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia3" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia4" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia5" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia6" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia7" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia8" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia9" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia10" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia11" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="cia12" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" CssClass="Actual"></asp:TextBox>
                    </td>
                </tr>
                <tr id="TotalTarget">
                    <td>
                        <b>
                            <asp:Label ID="targettotal" runat="server" Text="Target Total"></asp:Label></b>
                    </td>
                    <td>
                        <asp:TextBox ID="target1total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target2total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target3total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target4total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target5total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target6total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target7total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target8total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target9total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target10total" runat="server" onkeypress="return NumberOnly()"
                            onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);" Height="15px" Width="80%" Style="text-align: right"
                            Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target11total" runat="server" onkeypress="return NumberOnly()"
                            onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);" Height="15px" Width="80%" Style="text-align: right"
                            Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="target12total" runat="server" onkeypress="return NumberOnly()"
                            onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);" Height="15px" Width="80%" Style="text-align: right"
                            Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr id="TotalActual">
                    <td>
                        <b>
                            <asp:Label ID="ActualTotal" runat="server" Text="Actual Total"></asp:Label></b>
                    </td>
                    <td>
                        <asp:TextBox ID="actual1total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual2total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual3total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual4total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual5total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual6total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual7total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual8total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual9total" runat="server" onkeypress="return NumberOnly()" onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);"
                            Height="15px" Width="80%" Style="text-align: right" Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual10total" runat="server" onkeypress="return NumberOnly()"
                            onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);" Height="15px" Width="80%" Style="text-align: right"
                            Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual11total" runat="server" onkeypress="return NumberOnly()"
                            onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);" Height="15px" Width="80%" Style="text-align: right"
                            Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="actual12total" runat="server" onkeypress="return NumberOnly()"
                            onkeyup="FormatCurrency(this);" onkeydown="PreventCopyPaste(this);" Height="15px" Width="80%" Style="text-align: right"
                            Font-Size="8pt" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
            </table>
            </br>
            <div id="updatecalc">
                <asp:Button ID="btnupdatecal" runat="server" Text="Update Calculation" OnClick="btnupdatecal_Click"
                    Width="150px" />
            </div>
            </br>
            <div id="historycon" runat="server">
                <div id="wfhistory" runat="server" class="Audit">
                    <h3>Workflow History
                    </h3>
                </div>
                <div id="wfhistorycontent" runat="server">
                </div>
            </div>
            <table id="Audittable" class="Audits" runat="server" style="display: none;">
                <tbody>
                    <tr>
                        <th colspan="2" style="text-align: left; background: #FFCC99;">Audit Section
                        </th>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="lblauditstatuss" runat="server" Text="Audit Status"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlauditstatus" Width="30%">
                                <asp:ListItem Selected="True" Text="Select" Value="Select"></asp:ListItem>
                                <asp:ListItem Selected="False" Text="Green" Value="Green"></asp:ListItem>
                                <asp:ListItem Selected="False" Text="Black" Value="Black"></asp:ListItem>
                                <asp:ListItem Selected="False" Text="Grey" Value="Grey"></asp:ListItem>
                                <asp:ListItem Selected="False" Text="Red" Value="Red"></asp:ListItem>
                                <asp:ListItem Selected="False" Text="Yellow" Value="Yellow"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:Label ID="lblauditstatusvalue" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="alt">
                        <td class="style6">
                            <asp:Label ID="lblauditedby" runat="server" Text="Audited By"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblaudtedbyvalue" runat="server"></asp:Label>
                            <asp:Label runat="server" ID="audittimevalue" Width="40%"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="lblauditcomment" runat="server" Text="Audit Comment :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtauditcomment" TextMode="MultiLine"
                                Columns="100" Rows="3" RichText="true" RichTextMode="Compatible" AllowHyperlink="true"
                                Width="100%" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <table id="tblReassign" class="Audits" runat="server" visible="false">
                <tbody>
                    <tr class="Audit">
                        <th colspan="2" style="text-align: left; background: #FFCC99;">ReAssign Task :
                        </th>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="lblreasUser" Text="ReAssign User :" runat="server"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="color: black; background-color: #66d9ff; height: 25px;" colspan="2">
            <b style="font-size: 14px;">&nbsp;<asp:Label ID="lblCIIdeaDocumentation" Font-Size="15px"
                runat="server" Text="CI Project Documentation"></asp:Label></b>
        </td>
    </tr>
    <tr id="trAssociateDocumentslbl" runat="server" visible="false">
        <td style="background-color: #d6d6c2" colspan="2">
            <b>&nbsp;<asp:Label ID="lblFileAssociated" runat="server" Text="Following files are associated with this item :"></asp:Label></b>
        </td>
    </tr>
    <tr id="trAssociateDocuments" runat="server" visible="false">
        <td colspan="2">
            <asp:Repeater ID="rptCIDocuments" runat="server">
                <HeaderTemplate>
                    <table border="0" width="200px" cellpadding="2" cellspacing="1" style="border: 1px solid #000;"
                        frame="box">
                        <tr bgcolor="#d6d6c2">
                            <th>
                                <asp:Label ID="lblFileName" runat="server" Text="File Name"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lblAction" runat="server" Text="Action"></asp:Label>
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HyperLink ID="hyAssociateDocuments" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.FileURL")%>'><%# DataBinder.Eval(Container, "DataItem.FileName")%></asp:HyperLink>
                        </td>
                        <td width="100">
                            <asp:Button ID="btnAction" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure to delete attachment?');"
                                CommandArgument='<%#Eval("ItemId") + ";" +Eval("FileName")%>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="background-color: #d6d6c2">
            <b>&nbsp;<asp:Label ID="lblProjectTracking" runat="server" Text="Project Tracking"></asp:Label></b>

        </td>
    </tr>
    <tr>
        <td colspan="2">
            <b>
                <asp:Label ID="lblListofAttachments" runat="server" Text="List of Attachments"></asp:Label></b>
        </td>
    </tr>
    <tr>
        <td colspan="2" id="trListOfAttachment" runat="server">
            <table>
                <tr id="FileControl1">
                    <td>
                        <asp:FileUpload ID="FileUpload1" EnableViewState="true" runat="server" />&nbsp;
                        <button id="btnFileUpload1">
                            Add New File</button>
                    </td>
                </tr>
                <tr id="FileControl2">
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl3">
                    <td>
                        <asp:FileUpload ID="FileUpload3" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl4">
                    <td>
                        <asp:FileUpload ID="FileUpload4" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl5">
                    <td>
                        <asp:FileUpload ID="FileUpload5" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl6">
                    <td>
                        <asp:FileUpload ID="FileUpload6" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl7">
                    <td>
                        <asp:FileUpload ID="FileUpload7" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl8">
                    <td>
                        <asp:FileUpload ID="FileUpload8" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl9">
                    <td>
                        <asp:FileUpload ID="FileUpload9" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl10">
                    <td>
                        <asp:FileUpload ID="FileUpload10" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl11">
                    <td>
                        <asp:FileUpload ID="FileUpload11" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl12">
                    <td>
                        <asp:FileUpload ID="FileUpload12" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl13">
                    <td>
                        <asp:FileUpload ID="FileUpload13" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl14">
                    <td>
                        <asp:FileUpload ID="FileUpload14" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl15">
                    <td>
                        <asp:FileUpload ID="FileUpload15" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl16">
                    <td>
                        <asp:FileUpload ID="FileUpload16" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl17">
                    <td>
                        <asp:FileUpload ID="FileUpload17" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl18">
                    <td>
                        <asp:FileUpload ID="FileUpload18" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl19">
                    <td>
                        <asp:FileUpload ID="FileUpload19" runat="server" />
                    </td>
                </tr>
                <tr id="FileControl20">
                    <td>
                        <asp:FileUpload ID="FileUpload20" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        </br>
        <td colspan="2" style="background-color: #d6d6c2">
            <b>
                <asp:Label ID="lblCommnets" runat="server" Text="Comments / Updates"></asp:Label></b>

        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:TextBox runat="server" ID="txtComments" TextMode="MultiLine"
                Height="103px" Columns="100" Rows="8" RichText="true" RichTextMode="Compatible"
                AllowHyperlink="true" Width="970px" /></br></br>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td nowrap="true" valign="top" width="213px">
                        <div id="Action" runat="server">
                            <asp:Label ID="lblaction" runat="server" Text="Task Action :"></asp:Label><span style="color: Red;">*</span>&nbsp;&nbsp;
                            <asp:DropDownList ID="ddlRequesterStatus" runat="server">
                                <asp:ListItem Text="" Value="Select" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="Draft"></asp:ListItem>
                                <asp:ListItem Value="Submit"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                    <td style="text-align: right">
                        <asp:Button ID="btnSave" runat="server" Text="Submit" OnClick="btnSave_Click" Font-Bold="True"
                            Font-Size="Medium" OnClientClick="return ApprovalValidation(); " />&nbsp;
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="false" Font-Bold="True"
                            Font-Size="Medium" Text="Cancel" />&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
