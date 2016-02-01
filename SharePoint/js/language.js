$(document).ready(function () {

    DefaultLableValues();
    $('[id$=chklanguage]').change(function () {

        if ($(this).is(":checked")) {
            SetFrenchLables();
        } else {
            DefaultLableValues();
        }
    });

    if($('[id$=chklanguage]').is(':checked'))
        SetFrenchLables();
    else
        DefaultLableValues();

});

function DefaultLableValues() {
    $('[id$=lblHeader]').text("CONTINUOUS IMPROVMENT PROJECT FORM");
    $('[id$=Label11]').text("Project Status");
    $('[id$=lblAuditStatushdr]').text("Audit Status");
    $('[id$=lblFrench]').text("french");
    $('[id$=lblProjectInformation]').text("Project Information");
    $('[id$=lblProjAcpt]').text("Was this Project an accepted CI Idea?");
    $('[id$=lblfacility]').text("Facility / Site");


    $('[id$=lblciidea]').text("CI Idea #");
    $('[id$=lblprocejcid]').text("Project ID - CIP");
    $('[id$=prjName]').text("Project Name");
    $('[id$=lblprojldrchk]').text("Project Leader in AD");
    $('[id$=lblprojldr]').text("Project Leader");
    $('[id$=lblprjclasf]').text("Project Classification");
    $('[id$=lblconfCI]').text("Confidential CI");
    $('[id$=lblbnftchk]').text("Lean Benefits");
    $('[id$=lblprjtype]').text("Project Type");
    $('[id$=lblLeanBnType]').text("Lean Benefit Type");
    $('[id$=lblBenefitType]').text("Business Cost Model");
    $('[id$=lblconfCI]').text("Confidential CI");
    $('[id$=lblProjectApprovals]').text("Project Approvals");
    $('[id$=itresource]').text("IT Resources Required");
    $('[id$=lblitreview]').text("IT Review");
    $('[id$=lblfinreview]').text("Finance Review");
    $('[id$=lblcileaderapp]').text("CI Leader Approval");
    $('[id$=lblprojstatus]').text("Project Status");
    $('[id$=lblProjectDescription]').text("Project Description (Describe the project, background issue, objective)");
    $('[id$=lblProjectBenefits]').text("Project Benefits - Why are we looking at this project? Hard/Soft Benefits? In Scope/Out of Scope & include calculation");
    $('[id$=lblCIIdeaDocumentation]').text("CI Project Documentation");
    $('[id$=lblProjectTracking]').text("Project Tracking");
    $('[id$=lblListofAttachments]').text("Document Attachement");
    $('[id$=lblComments]').text("Comments");
    $('[id$=btnSave]').val("Submit");
    $('[id$=btnCancel]').val("Cancel");

    $('[id$=lblProjApBy]').text("Project Approved By");

    $('[id$=lblCapitalsav]').text("CI Project Savings");
    $('[id$=lblcaprequire]').text("Capital Required");
    $('[id$=lblCapExpAmount]').text("CapEx Amount");
    $('[id$=lblImplCost]').text("Implementation Cost");
    $('[id$=lbltotal]').text("Total");
    $('[id$=lblProjStartDate]').text("Project Start Date");
    $('[id$=lblImpDate]').text("Implementation Date");
    $('[id$=lblCompDate]').text("Completion Date");
    $('[id$=lblcancelDate]').text("Cancelled Date");
    $('[id$=lblcelbtype]').text("Celebration Type");
    $('[id$=lblCelebrDate]').text("Celebration Date");
    $('[id$=lblCelebType]').text("Celebration Type");
    $('[id$=lblPeriod]').text("Period");

    $('[id$=Label1]').text("This CI will save over 12months");
    $('[id$=Label2]').text("This CI has saved year to date");
    $('[id$=Label3]').text("Estimated savings to be realized are");
    $('[id$=lbltotalAmount]').text("Total");
    $('[id$=yearlbltotal]').text("Total");
    $('[id$=estlbltotal]').text("Total");

}
function SetFrenchLables() {
    $('[id$=lblHeader]').text("CONTINUOUS IMPROVMENT PROJECT FORM_Fr");
    $('[id$=Label11]').text("Project Status_Fr");
    $('[id$=lblAuditStatushdr]').text("Audit Status_Fr");
    $('[id$=lblFrench]').text("french_Fr");
    $('[id$=lblProjectInformation]').text("Project Information_Fr");
    $('[id$=lblProjAcpt]').text("Was this Project an accepted CI Idea?_Fr");
    $('[id$=lblfacility]').text("Facility / Site_Fr");


    $('[id$=lblciidea]').text("CI Idea #_Fr");
    $('[id$=lblprocejcid]').text("Project ID - CIP_Fr");
    $('[id$=prjName]').text("Project Name_Fr");
    $('[id$=lblprojldrchk]').text("Project Leader in AD_Fr");
    $('[id$=lblprojldr]').text("Project Leader_Fr");
    $('[id$=lblprjclasf]').text("Project Classification_Fr");
    $('[id$=lblconfCI]').text("Confidential CI_Fr");
    $('[id$=lblbnftchk]').text("Lean Benefits_Fr");
    $('[id$=lblprjtype]').text("Project Type_Fr");
    $('[id$=lblLeanBnType]').text("Lean Benefit Type_Fr");
    $('[id$=lblBenefitType]').text("Business Cost Model_Fr");
    $('[id$=lblconfCI]').text("Confidential CI_Fr");
    $('[id$=lblProjectApprovals]').text("Project Approvals_Fr");
    $('[id$=itresource]').text("IT Resources Required_Fr");
    $('[id$=lblitreview]').text("IT Review_Fr");
    $('[id$=lblfinreview]').text("Finance Review_Fr");
    $('[id$=lblcileaderapp]').text("CI Leader Approval_Fr");
    $('[id$=lblprojstatus]').text("Project Status_Fr");
    $('[id$=lblProjectDescription]').text("Project Description (Describe the project, background issue, objective)_Fr");
    $('[id$=lblProjectBenefits]').text("Project Benefits - Why are we looking at this project? Hard/Soft Benefits? In Scope/Out of Scope & include calculation_Fr");
    $('[id$=lblCIIdeaDocumentation]').text("CI Project Documentation_Fr");
    $('[id$=lblProjectTracking]').text("Project Tracking_Fr");
    $('[id$=lblListofAttachments]').text("Document Attachement_Fr");
    $('[id$=lblComments]').text("Comments_Fr");
    $('[id$=btnSave]').val("Submit_Fr");
    $('[id$=btnCancel]').val("Cancel_Fr");

    $('[id$=lblProjApBy]').text("Project Approved By_Fr");

    $('[id$=lblCapitalsav]').text("CI Project Savings_Fr");
    $('[id$=lblcaprequire]').text("Capital Required_Fr");
    $('[id$=lblCapExpAmount]').text("CapEx Amount_Fr");
    $('[id$=lblImplCost]').text("Implementation Cost_Fr");
    $('[id$=lbltotal]').text("Total_Fr");
    $('[id$=lblProjStartDate]').text("Project Start Date_Fr");
    $('[id$=lblImpDate]').text("Implementation Date_Fr");
    $('[id$=lblCompDate]').text("Completion Date_Fr");
    $('[id$=lblcancelDate]').text("Cancelled Date_Fr");
    $('[id$=lblcelbtype]').text("Celebration Type_Fr");
    $('[id$=lblCelebrDate]').text("Celebration Date_Fr");
    $('[id$=lblCelebType]').text("Celebration Type_Fr");
    $('[id$=lblPeriod]').text("Period_Fr");

    $('[id$=Label1]').text("This CI will save over 12months_Fr");
    $('[id$=Label2]').text("This CI has saved year to date_Fr");
    $('[id$=Label3]').text("Estimated savings to be realized are_Fr");
    $('[id$=lbltotalAmount]').text("Total_Fr");
    $('[id$=yearlbltotal]').text("Total_Fr");
    $('[id$=estlbltotal]').text("Total_Fr");


}