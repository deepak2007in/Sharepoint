
var Checkboxs = ['chkCostAvoidance', 'chkCostReduction', 'chkRevenueGrowth', 'chkCapacityIncrease'];
var tablevalues = ['CostAvoidance', 'CostReduction', 'RevenueGrowth', 'CapacityIncrease'];

$(document).ready(function () {
    HideAttachmentControls();
    $(":checkbox").each(function () {
        hideAggregateRow($(this));
    });


    // audit action
    $('[id*="ddlauditstatus"]').change(function () {
        if ($('[id*="ddlauditstatus"]').children("option").filter(":selected").text() != "") {

            $('[id*="lblauditstatusvalue"]').show();
            $('[id*="lblauditstatusvalue"]').text($('[id*="ddlauditstatus"]').children("option").filter(":selected").text() + "Status");
            $('[id*="lblauditstatusvalue"]').css('background-color', $('[id*="ddlauditstatus"]').children("option").filter(":selected").text());
            $('[id*="lblauditstatusvalue"]').css('color', $('[id*="ddlauditstatus"]').children("option").filter(":selected").text());
            $('[id*="txtAudStatus"]').show();
            $('[id*="lblAuditStatushdr"]').show();
            $('[id*="txtAudStatus"]').css('background-color', $('[id*="ddlauditstatus"]').children("option").filter(":selected").text());
            $('[id*="txtAudStatus"]').text($('[id*="ddlauditstatus"]').children("option").filter(":selected").text());
        }
        else {

            $('[id*="lblauditstatusvalue"]').hide();
            $('[id*="lblauditstatusvalue"]').text("");
            $('[id*="txtAudStatus"]').hide();
            $('[id*="lblAuditStatushdr"]').hide();
        }
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
    //check confidention ci value
    if ($('[id$=rdoconfCI] input:checked').val() == "No") {
        $('[id*="FileControl1"]').show();
        HideAttachmentControls();
    }
    else {

        $('[id*="FileControl1"]').hide();
    }
    AuditSection();
    HideFileControls();
    CheckBoxesSelected();
    checkAllcheckboxes();
    ProjectTypeChangeEvent();




    //    $('[id$="lbltotalval"]')
    //    $('[id$="hdntotal"]')

    //    $('#total_price').val(Number(a) + Number(b));
    //    if (!isNaN($('input[name=service_price]').val())
    $('[id$="txtcapExp"]').blur(function () {
        var total = parseInt($('[id$="txtcapExp"]').val().replace(/,/g, '').trim().replace('', '0'), 10) + parseInt($('[id$="txtimplcost"]').val().replace(/,/g, '').trim().replace('', '0'), 10);
        $('[id$="lbltotalval"]').text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $('[id$="hdntotal"]').val($('[id$="lbltotalval"]').val());
    });

    $('[id$="txtimplcost"]').blur(function () {
        var total = parseInt($('[id$="txtcapExp"]').val().replace(/,/g, '').trim().replace('', '0'), 10) + parseInt($('[id$="txtimplcost"]').val().replace(/,/g, '').trim().replace('', '0'), 10);
        $('[id$="lbltotalval"]').text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $('[id$="hdntotal"]').val($('[id$="lbltotalval"]').val());
    });


    if ($('[id$=rdoCIAccept] input:checked').val() == "No")
    { $('[id$=ddlCiIdeaNum]').prop("disabled", true); }
    else { $('[id$=ddlCiIdeaNum]').prop("disabled", false); }
    if ($('[id$=chkIdentyAd]').is(':checked'))
        $('[id$=txtnormaluser]').hide();  // checked
    else
        $('[id$=txtnormaluser]').show(); // unchecked


    if ($('[id$=chlLeanBnft]').is(':checked')) {
        $('[id$=ddlLeanbnftType]').prop("disabled", false);  // checked
        $('[id*="col2"]').hide();
        //$('[id*="hidecol2"]').hide();

        $('[id*="col3"]').hide();
        $('[id*="dynamicTable"]').hide();
        $('[id*="chkCostAvoidance"]').hide(); // Unchecks it
        $('[id*="chkCostReduction"]').hide(); // Unchecks it
        $('[id*="chkRevenueGrowth"]').hide(); // Unchecks it
        $('[id*="chkCapacityIncrease"]').hide(); // Unchecks it	
        $('[id*="trLeanBn"]').show();
        $('[id*="trProjectType"]').hide();
    }

    else {
        $('[id$=ddlLeanbnftType]').prop("disabled", true); // unchecked
        $('[id*="col2"]').show();
        //$('[id*="hidecol2"]').show();
        $('[id*="col3"]').show();
        $('[id*="dynamicTable"]').show();
        $('[id*="trLeanBn"]').hide();
        $('[id*="trProjectType"]').show();
    }

    //check celebrationtype

    if ($('[id$=chkcelebtype]').is(':checked')) {
        $('[id*="dtCelebDate"]').removeAttr("disabled");
        $('[id*="dtCelebDate"]').focus();
        $('[id*="ddlCelebType"]').prop("disabled", false);
    }
    else { $('[id*="dtCelebDate"]').prop("disabled", "disabled"); $('[id*="ddlCelebType"]').prop("disabled", "disabled"); }

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
            $('[id*="txtnormaluser"]').hide();

        } else {
            $('[id*="txtnormaluser"]').show();

        }
    });


    ///attachement changefunction
    var fileCounter = 21;
    var fileCreated = $('[id$=hdnFileCounder]').val();
    $('[id$=btnFileUpload1]').click(function (e) {
        fileCreated++;
        if (fileCreated != fileCounter) {
            $('#FileControl' + fileCreated).show();
        }
        e.preventDefault();
    });
    //confidental ci

    var msg = "You have checked this CI as confidential and are not able to upload documents to SharePoint.As a result, please email all attachments to CIAuditor@scilogistics.com with the CI # in the Subject Line.- Thank you, The CI Team.";
    $('[id*="rdoconfCI"] input').change(function () {
        if ($(this).val() == "Yes") {
            alert(msg);
            $('[id*="FileControl1"]').hide();
            HideAttachmentControls();


            //hide the attachement controls
        }
        else { //show attachemnt controls 
            $('[id*="FileControl1"]').show();
            HideAttachmentControls();

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


            $('[id*="trLeanBn"]').show();
            $('[id*="trProjectType"]').hide();

            $('[id*="dynamicTable"]').hide();
            $('[id*="btnupdatecal"]').hide();
            $('.col3').hide();
            $('.col2').hide();
            //            $('#hidecol2').css("display", "none");




        } else {


            $('[id*="ddlLeanbnftType"]').prop("disabled", true);
            $('[id*="ddlLeanbnftType"]').prop('selectedIndex', 0);
            $('[id*="chkCostAvoidance"]').prop('disabled', false); // Unchecks it
            $('[id*="chkCostReduction"]').prop('disabled', false); // Unchecks it
            $('[id*="chkRevenueGrowth"]').prop('disabled', false); // Unchecks it
            $('[id*="chkCapacityIncrease"]').prop('disabled', false); // Unchecks it


            $('[id*="trLeanBn"]').hide();
            $('[id*="trProjectType"]').show();
            $('[id*="dynamicTable"]').show();
            $('.col3').show();
            $('.col2').show();


        }
    });


    $('[id*="chkcelebtype"]').click(function () {
        if ($(this).is(":checked")) {
            $('[id*="dtCelebDate"]').removeAttr("disabled");
            $('[id*="dtCelebDate"]').focus();
            $('[id*="ddlCelebType"]').prop("disabled", false);
        } else {
            $('[id*="dtCelebDate"]').prop("disabled", "disabled"); $('[id*="ddlCelebType"]').prop("disabled", "disabled");
        }
    });
});

//function GetFacility(selectedFacility) {

//    var params = JSON.stringify({ selectedFacility: selectedFacility });
//    $.ajax({
//        type: "POST",
//        async: false,
//        url: "/_layouts/SCICIProjectWF/CustomJSFunctions.aspx/GetProjectType",
//        contentType: "application/json; charset=utf-8",
//        data: params,
//        dataType: "json",
//        success: function (msg) {
//            if (msg.d.length > 0) {
//                objdata = $.parseJSON(msg.d);

//                GetContent(objdata);
//            }


//        },
//        error: function (data) {
//            //console.log('Error');
//            alert("failed");
//        }
//    });
//}


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
    { HideTableData(); $('[id*="btnupdatecal"]').hide(); }
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

    if ($('[id*="ddlprojpriority"]').children("option").filter(":selected").text() == "Select" || $('[id*="ddlprojpriority"]').children("option").filter(":selected").text() == "") {
        strErrMsg = strErrMsg + "Project Prioritization Type Required \n";
        intFlag++;
    }
    if ($('[id*="ddlProjClasfction"]').children("option").filter(":selected").text() == "Select" || $('[id*="ddlProjClasfction"]').children("option").filter(":selected").text() == "") {
        strErrMsg = strErrMsg + "Project Classification Type Required \n";
        intFlag++;
    }

    if ($('[id*="chlLeanBnft"]').is(":checked")) {
        if ($('[id*="ddlLeanbnftType"]').children("option").filter(":selected").text() == "Select" || $('[id*="ddlLeanbnftType"]').children("option").filter(":selected").text() == "") {
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
        if ($('[id*="ddlItReview"]').children("option").filter(":selected").text() == "Select" || $('[id*="ddlItReview"]').children("option").filter(":selected").text() == "") {
            strErrMsg = strErrMsg + "IT Reviewer Required \n";
            intFlag++;
        }
    }
    if ($('[id*="ddlCILeaderApprov"]').children("option").filter(":selected").text() == "Select" || $('[id*="ddlCILeaderApprov"]').children("option").filter(":selected").text() == "") {
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
            if (!$('[id$="txtcapExp"]').length > 0 || $('[id$="txtcapExp"]').val() == 0 || $('[id$="txtcapExp"]').val() == "") {
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
            if (CelebDate != "") {
                if (celebType == "Select") {
                    strErrMsg = strErrMsg + "Celebration Type Required \n";
                    intFlag++;
                }
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
    window.location = "/sci_ci/Pages/CIProjectView.aspx";
    return true;
}





function showTableData() {
    $('[id*="dynamicTable"]').show();
    $('[id*="Tr1"]').show();
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
    $('[id*="btnupdatecal"]').show();
}
function HideSelectedRaw(val) {
    $('[id*="' + val + 'Actual"]').hide();
    $('[id*="' + val + 'Target"]').hide();
}

function HideAttachmentControls() {
    //Hide File Control

    $('[id$="FileControl2"]').hide();
    $('[id$="FileControl3"]').hide();
    $('[id$="FileControl4"]').hide();
    $('[id$="FileControl5"]').hide();
    $('[id$="FileControl6"]').hide();
    $('[id$="FileControl7"]').hide();
    $('[id$="FileControl8"]').hide();
    $('[id$="FileControl9"]').hide();
    $('[id$="FileControl10"]').hide();
    $('[id$="FileControl11"]').hide();
    $('[id$="FileControl12"]').hide();
    $('[id$="FileControl13"]').hide();
    $('[id$="FileControl14"]').hide();
    $('[id$="FileControl15"]').hide();
    $('[id$="FileControl16"]').hide();
    $('[id$="FileControl17"]').hide();
    $('[id$="FileControl18"]').hide();
    $('[id$="FileControl19"]').hide();
    $('[id$="FileControl20"]').hide();

}

function AuditSection() {
    if ($('[id*="ddlRequesterStatus"]') != null)
        $('[id*="ddlRequesterStatus"]').css("width", "100px");
    if ($('[id*="ddlciapprovstatus"]') != null)
        $('[id*="ddlciapprovstatus"]').css("width", "100px");
    // change auti status value
    if ($('[id*="ddlauditstatus"]').children("option").filter(":selected").text() == "Select" || $('[id*="ddlauditstatus"]').children("option").filter(":selected").text() == "") {
        $('[id*="lblauditstatusvalue"]').hide();
        $('[id*="txtAudStatus"]').hide();
        $('[id*="lblAuditStatushdr"]').hide();

    }
    else {
        $('[id*="lblauditstatusvalue"]').show();
        $('[id*="lblauditstatusvalue"]').text($('[id*="ddlauditstatus"]').children("option").filter(":selected").text() + "Status");
        $('[id*="lblauditstatusvalue"]').css('background-color', $('[id*="ddlauditstatus"]').children("option").filter(":selected").text());
        $('[id*="lblauditstatusvalue"]').css('color', $('[id*="ddlauditstatus"]').children("option").filter(":selected").text());
        $('[id*="txtAudStatus"]').show();
        $('[id*="lblAuditStatushdr"]').show();
        $('[id*="txtAudStatus"]').css('background-color', $('[id*="ddlauditstatus"]').children("option").filter(":selected").text());
        $('[id*="txtAudStatus"]').text($('[id*="ddlauditstatus"]').children("option").filter(":selected").text());

    }
    if ($('[id*="hdnAuditStatus"]').val() != "") {

        $('[id*="txtAudStatus"]').css('background-color', $('[id*="hdnAuditStatus"]').val());
        $('[id*="txtAudStatus"]').text($('[id*="hdnAuditStatus"]').val());
        $('[id*="txtAudStatus"]').show();
        $('[id*="lblAuditStatushdr"]').show();
    }
    else {

        $('[id*="txtAudStatus"]').hide();
        $('[id*="lblAuditStatushdr"]').hide();
    }

}

function ProjectTypeChangeEvent() {
    // cost avoidance click event chekbox
    $('[id*="chkCostAvoidance"]').click(function () {
        if ($(this).is(":checked")) {
            showTableData();
            showCheckBoxSelectedRaw("CostAvoidance");
            $('[id*="twelveca"]').show();
        }
        else {
            HideSelectedRaw("CostAvoidance");
            checkAllcheckboxes();
            $('[id*="twelveca"]').hide();
        }

    });


    // cost Reduction click event chekbox
    $('[id*="chkCostReduction"]').click(function () {
        if ($(this).is(":checked")) {
            showTableData();
            showCheckBoxSelectedRaw("CostReduction");
            $('[id*="twelvecr"]').show();
        }
        else {
            HideSelectedRaw("CostReduction");
            checkAllcheckboxes();
            $('[id*="twelvecr"]').hide();
        }
    });
    // Revenue Growth click event chekbox
    $('[id*="chkRevenueGrowth"]').click(function () {
        if ($(this).is(":checked")) {
            showTableData();
            showCheckBoxSelectedRaw("RevenueGrowth");
            $('[id*="twelverg"]').show();
        }
        else {
            HideSelectedRaw("RevenueGrowth");
            checkAllcheckboxes();
            $('[id*="twelverg"]').hide();
        }

    });
    // Capacity Increase click event chekbox
    $('[id*="chkCapacityIncrease"]').click(function () {
        if ($(this).is(":checked")) {
            showTableData();
            showCheckBoxSelectedRaw("CapacityIncrease");
            $('[id*="twelveci"]').show();
        }
        else {
            HideSelectedRaw("CapacityIncrease");
            $('[id*="twelveci"]').hide();
        }

    });
}





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

function HideTableData() {
    $('[id*="dynamicTable"]').hide();
    $('[id*="Tr1"]').hide();
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


function HideFileControls() {
    //Hide File Control
    $('[id$="FileControl2"]').hide();
    $('[id$="FileControl3"]').hide();
    $('[id$="FileControl4"]').hide();
    $('[id$="FileControl5"]').hide();
    $('[id$="FileControl6"]').hide();
    $('[id$="FileControl7"]').hide();
    $('[id$="FileControl8"]').hide();
    $('[id$="FileControl9"]').hide();
    $('[id$="FileControl10"]').hide();
    $('[id$="FileControl11"]').hide();
    $('[id$="FileControl12"]').hide();
    $('[id$="FileControl13"]').hide();
    $('[id$="FileControl14"]').hide();
    $('[id$="FileControl15"]').hide();
    $('[id$="FileControl16"]').hide();
    $('[id$="FileControl17"]').hide();
    $('[id$="FileControl18"]').hide();
    $('[id$="FileControl19"]').hide();
    $('[id$="FileControl20"]').hide();
}
