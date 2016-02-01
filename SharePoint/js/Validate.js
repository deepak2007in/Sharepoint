
var Checkboxs = ['chkCostAvoidance', 'chkCostReduction', 'chkRevenueGrowth', 'chkCapacityIncrease'];
var tablevalues = ['CostAvoidance', 'CostReduction', 'RevenueGrowth', 'CapacityIncrease'];

function getValueSelected(checkBox) {
    var checkBoxName = checkBox.attr('name');
    if (checkBoxName.indexOf('CostAvoidance') >= 0) {
        return 'CostAvoidance';
    }
    if (checkBoxName.indexOf('CostReduction') >= 0) {
        return 'CostReduction';
    }
    if (checkBoxName.indexOf('RevenueGrowth') >= 0) {
        return 'RevenueGrowth';
    }
    if (checkBoxName.indexOf('CapacityIncrease') >= 0) {
        return 'CapacityIncrease';
    }
    return '';
}
function hideAggregateRow(checkBox) {
    var valueSelected = getValueSelected(checkBox);
    if (valueSelected != '') {
        var isChecked = checkBox.is(':checked');
        if (isChecked) {
            showTableData();
            showCheckBoxSelectedRaw(valueSelected);
            displayAggregate(valueSelected, true);
        }
        else {
            HideSelectedRaw(valueSelected);
            checkAllcheckboxes();
            displayAggregate(valueSelected, false);
        }
    }
}
$(document).ready(function () {

    CheckBoxesSelected();
    checkAllcheckboxes();
    $(":checkbox").each(function () {
        hideAggregateRow($(this));
    });
    // cost avoidance click event chekbox
    $('[id*="chkCostAvoidance"]').click(function () {
        hideAggregateRow($(this));
    });

    // cost Reduction click event chekbox
    $('[id*="chkCostReduction"]').click(function () {
        hideAggregateRow($(this));
    });
    // Revenue Growth click event chekbox
    $('[id*="chkRevenueGrowth"]').click(function () {
        hideAggregateRow($(this));
    });
    // Capacity Increase click event chekbox
    $('[id*="chkCapacityIncrease"]').click(function () {
        hideAggregateRow($(this));
    });

    if ($('[id$=rdoCIAccept] input:checked').val() == "No")
    { $('[id$=ddlCiIdeaNum]').prop("disabled", true); }
    else { $('[id$=ddlCiIdeaNum]').prop("disabled", false); }
    if ($('[id$=chkIdentyAd]').is(':checked'))
        $('[id$=txtProjLeaderUser]').hide();  // checked
    else
        $('[id$=txtProjLeaderUser]').show(); // unchecked


    if ($('[id$=chlLeanBnft]').is(':checked')) {
        $('[id$=ddlLeanbnftType]').prop("disabled", false);  // checked
        $('[id*="col2"]').hide();        
        $('[id*="col3"]').hide();
        $('[id*="dynamicTable"]').hide();
    }

    else {
        $('[id$=ddlLeanbnftType]').prop("disabled", true); // unchecked
        $('[id*="col2"]').show();
        $('[id*="col3"]').show();        
        $('[id*="dynamicTable"]').show();
    }

    //    var capexpamount = document.getElementById("<%=txtcapExp.ClientID %>");
    //    var implemcost = document.getElementById("<%=txtimplcost.ClientID %>");
    //    ValidateNumeric(capexpamount);
    //    ValidateNumeric(implemcost);


    $('[id$=ddlfacilty]').change(function () {
        if ($('[id*="ddlfacilty"]').children("option").filter(":selected").text() != "Select") {
            GetFacility($('[id*="ddlfacilty"]').children("option").filter(":selected").text());
        }

    });
    //check CI Accept yes or no


    $('[id*="rdoCIAccept"] input').change(function () {
        if ($(this).val() == "Yes") {
            $('[id*="ddlCiIdeaNum"]').prop("disabled", false);
        }
        else { $('[id*="ddlCiIdeaNum"]').prop("disabled", true); }
    });
    //chech project leader identity

    $('[id*="chkIdentyAd"]').click(function () {
        if ($(this).is(":checked")) {
            $('[id*="txtProjLeaderUser"]').hide();
            $('[id*="ProjLeaderUser"]').show();
        } else {
            $('[id*="txtProjLeaderUser"]').show();
            $('[id*="ProjLeaderUser"]').hide();
        }
    });

    //confidental ci

    var msg = "You have checked this CI as confidential and are not able to upload documents to SharePoint.</br> As a result, please email all attachments to CIAuditor@scilogistics.com with the CI # in the Subject Line. </br>- Thank you, The CI Team.";
    $('[id*="rdoconfCI"] input').change(function () {
        if ($(this).val() == "Yes") {
            alert(msg);
            //hide the attachement controls
        }
        else { //show attachemnt controls 
        }
    });




    // lean benefit type
    $('[id$=chlLeanBnft]').click(function () {
        if ($(this).is(":checked")) {
            $('[id*="ddlLeanbnftType"]').prop("disabled", false);
            $('[id*="chkCostAvoidance"]').prop('disabled', true); // Unchecks it
            $('[id*="chkCostReduction"]').prop('disabled', true); // Unchecks it
            $('[id*="chkRevenueGrowth"]').prop('disabled', true); // Unchecks it
            $('[id*="chkCapacityIncrease"]').prop('disabled', true); // Unchecks it
            $('[id*="chkCapacityIncrease"]').prop('checked', false); // Unchecks it
            $('[id*="chkCostAvoidance"]').prop('checked', false); // Unchecks it
            $('[id*="chkCostReduction"]').prop('checked', false); // Unchecks it
            $('[id*="chkRevenueGrowth"]').prop('checked', false); // Unchecks it

            $('[id*="cisavetwelve"]').hide();
            $('[id*="cisaveyear"]').hide();
            $('[id*="ciest"]').hide();
            $('[id*="dynamicTable"]').hide();


        } else {
            $('[id*="ddlLeanbnftType"]').prop("disabled", true);
            $('[id*="ddlLeanbnftType"]').prop('selectedIndex', 0);
            $('[id*="cisavetwelve"]').show();
            $('[id*="cisaveyear"]').show();
            $('[id*="ciest"]').show();
            $('[id*="chkCostAvoidance"]').prop('disabled', false); // Unchecks it
            $('[id*="chkCostReduction"]').prop('disabled', false); // Unchecks it
            $('[id*="chkRevenueGrowth"]').prop('disabled', false); // Unchecks it
            $('[id*="chkCapacityIncrease"]').prop('disabled', false); // Unchecks it
            $('[id*="dynamicTable"]').show();

        }
    });


    $('[id*="chkcelebtype"]').click(function () {
        if ($(this).is(":checked")) {
            $('[id*="dtCelebDate"]').removeAttr("disabled");
            $('[id*="dtCelebDate"]').focus();
        } else {
            $('[id*="dtCelebDate"]').attr("disabled", "disabled");
        }
    });


});

function GetFacility(selectedFacility) {

    var params = JSON.stringify({ selectedFacility: selectedFacility });
    $.ajax({
        type: "POST",
        async: false,
        url: "/_layouts/SCICIProjectWF/CustomJSFunctions.aspx/GetProjectType",
        contentType: "application/json; charset=utf-8",
        data: params,
        dataType: "json",
        success: function (msg) {
            if (msg.d.length > 0) {
                objdata = $.parseJSON(msg.d);

                GetContent(objdata);
            }


        },
        error: function (data) {
            //console.log('Error');
            alert("failed");
        }
    });
}


function GetContent(objdata) {

    if (objdata.length > 0) {
        $('[id$=hdnbnfttype]').val(objdata[0].BenefitType);
        $('[id$=lblbnfttype]').text(objdata[0].BenefitType);

        $('[id$=lblfinancevalue]').text(objdata[0].FinanceLead);
        $('[id$=hdnfinvalue]').val(objdata[0].FinanceLead);
    }

}

// on load check checkboxes
function CheckBoxesSelected() {
    for (var i = 0; i < Checkboxs.length; i++) {
        if ($('[id*="' + Checkboxs[i] + '"]').prop('checked') == true) {
            showTableData();
            showCheckBoxSelectedRaw(tablevalues[i]);
        }
        else { HideSelectedRaw(tablevalues[i]); }
    }
}
function checkAllcheckboxes() {
    var uncheckall = false;
    for (var i = 0; i < Checkboxs.length; i++) {
        if ($('[id*="' + Checkboxs[i] + '"]').prop('checked') == true)
            uncheckall = true;
    }
    if (!uncheckall)
        HideTableData();
}

/// validate button click event
function ValidateSaveFields() {
    var intFlag = 0;

    var strErrMsg = "Please complete the following field(s):\n\n";
    if ($('[id*="ddlfacilty"]').children("option").filter(":selected").text() == "Select") {
        strErrMsg = strErrMsg + "facility Required \n";
        intFlag++;
    }

    if (!$('[id*="txtProjectName"]').val().length > 0) {
        strErrMsg = strErrMsg + "Project Name Required \n";
        intFlag++;
    }

    if ($('[id*="ddlprojpriority"]').children("option").filter(":selected").text() == "Select") {
        strErrMsg = strErrMsg + "Project Prioritization Type Required \n";
        intFlag++;
    }
    if ($('[id*="ddlProjClasfction"]').children("option").filter(":selected").text() == "Select") {
        strErrMsg = strErrMsg + "Project Classification Type Required \n";
        intFlag++;
    }

    if ($('[id*="chlLeanBnft"]').is(":checked")) {
        if ($('[id*="ddlLeanbnftType"]').children("option").filter(":selected").text() == "Select") {
            strErrMsg = strErrMsg + "Lean Benefit Type Required \n";
            intFlag++;
        }
    }
    else {
        if (!$('[id*="chkCostAvoidance"]').is(":checked") && !$('[id*="chkCostReduction"]').is(":checked") && !$('[id*="chkRevenueGrowth"]').is(":checked") && !$('[id*="chkCapacityIncrease"]').is(":checked")) {
            strErrMsg += "Please select at least one Project Type. \n";
            intFlag++;
        }
    }

    if ($('[id*="rdoITResrc"] input:checked').val() == "Yes") {
        if ($('[id*="ddlItReview"]').children("option").filter(":selected").text() == "Select") {
            strErrMsg = strErrMsg + "IT Reviewer Required \n";
            intFlag++;
        }
    }
    if ($('[id*="ddlCILeaderApprov"]').children("option").filter(":selected").text() == "Select") {
        strErrMsg = strErrMsg + "CI Leader Required \n";
        intFlag++;
    }
    //    var ProjDescp = RTE_GetRichEditTextOnly($('[id*="txtProjectDescription"]'));
    //    if (ProjDescp == "") {
    //        strErrMsg += "Project Description Required \n";
    //        intFlag++;
    //    }
    //    var ProjBenfit = RTE_GetRichEditTextOnly($('[id*="txtProjectBenefits"]'));
    //    if (ProjBenfit == "") {
    //        strErrMsg += "Project Benefit Required \n";
    //        intFlag++;
    //    }
    // CI Saving Part
    if (!$('[id*="chlLeanBnft"]').is(":checked")) {

        var capitalrequired = $('[id*="rdoCapitalrequi"] input:checked').val();
        if (capitalrequired == "Yes") {
            if (!capexpamount.length > 0) {
                strErrMsg = strErrMsg + "CapEx Amount is Required \n";
                intFlag++;
            }
        }

        var selectedDateTimeVal = $('input[id*="dtProjStartDate"]').val();
        if (selectedDateTimeVal == '') {
            strErrMsg = strErrMsg + "Project Start Date Required \n";
            intFlag++;
        }

        if ($('[id*="chkcelebtype"]').is(":checked")) {
            var CelebDate = $('input[id*="dtCelebDate"]').val();
            if (CelebDate == '') {
                strErrMsg = strErrMsg + "Celebration Date Required \n";
                intFlag++;
            }
            var celebType = $('[id*="ddlCelebType"]').children("option").filter(":selected").text();
            if (celebType == "Select") {
                strErrMsg = strErrMsg + "Celebration Type Required \n";
                intFlag++;
            }

        }
        if ($('[id*="ddlPeriod"]').children("option").filter(":selected").text() == "Select") {
            strErrMsg = strErrMsg + "Period Required \n";
            intFlag++;
        }
    }
    // Display error message if a field is not completed
    if (intFlag != 0) {
        return strErrMsg;
    }
    else
        return "";

}





function validatePeopleEditor(messageText) {
    var $pe = $('[id*="ProjLeaderUser"]');
    var $peValHolder = $pe.find("input[id$='hiddenSpanData']");

    $peValHolder.rules("add", {
        required: true,
        messages: {
            required: messageText
        }
    });
}


function ConfirmApproval(objMsg) {
        alert(objMsg)
        window.location = "/Pages/CIProjectView.aspx";
        return true;
}





function showTableData() {
    $('[id*="dynamicTable"]').show();
    $('[id*="Header"]').show();
    $('[id*="TotalActual"]').show();
    $('[id*="TotalTarget"]').show();
    $('[id*="twelvetotal"]').show();
    $('[id*="yeartotal"]').show();
    $('[id*="esttotal"]').show();
    $('[id*="twelveheader"]').show();
    $('[id*="yearheader"]').show();
    $('[id*="estheader"]').show();
}
function showCheckBoxSelectedRaw(val) {
    $('[id*="' + val + 'Actual"]').show();
    $('[id*="' + val + 'Target"]').show();
}
function HideSelectedRaw(val) {
    $('[id*="' + val + 'Actual"]').hide();
    $('[id*="' + val + 'Target"]').hide();
}

function HideTableData() {
    $('[id*="dynamicTable"]').hide();
    $('[id*="Header"]').hide();
    $('[id*="TotalActual"]').hide();
    $('[id*="TotalTarget"]').hide();
    displayAggregate("header", false);
    displayAggregate("total", false);
    displayAggregate("CostAvoidance", false);
    displayAggregate("CostReduction", false);
    displayAggregate("RevenueGrowth", false);
    displayAggregate("CapacityIncrease", false);
}

function displayAggregate(val, flagShow) {
    if (flagShow) {
        $('[id*="twelve' + val + '"]').show();
        $('[id*="year' + val + '"]').show();
        $('[id*="est' + val + '"]').show();
    }
    else {
        $('[id*="twelve' + val + '"]').hide();
        $('[id*="year' + val + '"]').hide();
        $('[id*="est' + val + '"]').hide();
    }
}
