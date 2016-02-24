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
    $('[id$=lblciprojheader]').text("Continuous Improvement Project Form");
    $('[id$=Label11]').text("Project Status :");
    $('[id$=lblAuditStatushdr]').text("Audit Status :");
    $('[id$=lblFrench]').text("French");
    $('[id$=lblProjectInformation]').text("Project Information ");
    $('[id$=lblProjAcpt]').text("Was this Project an accepted CI Idea? :");
    $('[id$=lblfacility]').text("Facility / Site :");


    $('[id$=lblciidea]').text("CI Idea # :");
    $('[id$=lblprocejcid]').text("Project ID - CIP :");
    $('[id$=prjName]').text("Project Name :");
    $('[id$=lblprojldrchk]').text("Project Leader in AD :");
    $('[id$=lblprojldr]').text("Project Leader :");
    $('[id$=lblprjclasf]').text("Project Classification :");
    $('[id$=lblconfCI]').text("Confidential CI :");
    $('[id$=lblbnftchk]').text("Lean Benefits :");
    $('[id$=lblprjtype]').text("Project Type :");
    $('[id$=lblLeanBnType]').text("Lean Benefit Type :");
    $('[id$=lblBenefitType]').text("Business Cost Model :");
    $('[id$=lblconfCI]').text("Confidential CI :");
    $('[id$=lblProjectApprovals]').text("Project Approvals ");
    $('[id$=itresource]').text("IT Resources Required :");
    $('[id$=lblitreview]').text("IT Review :");
    $('[id$=lblfinreview]').text("Finance Review :");
    $('[id$=lblcileaderapp]').text("CI Leader Approval :");
    $('[id$=lblprojstatus]').text("Project Status :");
    $('[id$=lblProjectDescription]').text("Project Description (Describe the project, background issue, objective) :");
    $('[id$=lblProjectBenefits]').text("Project Benefits - Why are we looking at this project? Hard/Soft Benefits? In Scope/Out of Scope & include calculation :");
    $('[id$=lblCIIdeaDocumentation]').text("CI Project Documentation ");
    $('[id$=lblProjectTracking]').text("Project Tracking ");
    $('[id$=lblListofAttachments]').text("List of Attachments ");
    $('[id$=lblComments]').text("Comments ");
    $('[id$=btnSave]').val("Submit");
    $('[id$=btnCancel]').val("Cancel");

    $('[id$=lblProjApBy]').text("Project Approved By :");

    $('[id$=lblCapitalsav]').text("CI Project Savings ");
    $('[id$=lblcaprequire]').text("Capital Required :");
    $('[id$=lblCapExpAmount]').text("CapEx Amount :");
    $('[id$=lblImplCost]').text("Implementation Cost :");
    $('[id$=lbltotal]').text("Total ");
    $('[id$=lblProjStartDate]').text("Project Start Date :");
    $('[id$=lblImpDate]').text("Implementation Date :");
    $('[id$=lblCompDate]').text("Completion Date :");
    $('[id$=lblcancelDate]').text("Cancelled Date :");
    $('[id$=lblcelbtype]').text("Celebration Date :");    
    $('[id$=lblCelebType]').text("Celebration Type :");
    $('[id$=lblPeriod]').text("Select Period");

    $('[id$=Label1]').text("This CI will save over 12 months :");
    $('[id$=Label2]').text("This CI has saved year to date :");
    $('[id$=Label3]').text("Estimated savings to be realized are :");
    $('[id$=lbltotalAmount]').text("Total ");
    $('[id$=yearlbltotal]').text("Total ");
    $('[id$=estlbltotal]').text("Total ");
    $('[id$=lblWorkflowTop]').text("Workflow Status :");
    $('[id$=lblCommnets]').text("Comments / Updates");
    $('[id$=btnupdatecal]').val("Update Calculation");
    $('[id$=lblWorkflowHistory]').text("Workflow History");
    $('[id$=lblReassignTask]').text("ReAssign Task");
    $('[id$=lblreasUser]').text("ReAssign User :");
    $('[id$=btnreassign]').val("Re-assign");
    $('[id$=lblAuditSection]').text("Audit Section");
    $('[id$=btnApprove]').val("Submit");
    $('[id$=lblaction]').text("Task Action :");
    $('[id$=lblaudithistory]').text("Audit History");
    $('[id$=lblAuditSection]').text("Audit Section");
    $('[id$=lblauditstatuss]').text("Audit Status");
    $('[id$=lblauditedby]').text("Audited By");
    $('[id$=lblauditcomment]').text("Audit Comment :");
    $('[id$=lblCIApproverComments]').text("CI Approver Comment");
    $('[id$=lblReassignTask]').text("ReAssign Task ");
    $('[id$=lblreasUser]').text("ReAssign User :");
    // = Help Text
    $('[id$=imgHelpProjectInformation]').attr("title", "Project Information Help");
    
}

function SetFrenchLables() {
    $('[id$=lblciprojheader]').text("Continuous Improvement Project Form_Fr");
    $('[id$=Label11]').text("Project Status_Fr :");
    $('[id$=lblAuditStatushdr]').text("Audit Status_Fr :");
    $('[id$=lblFrench]').text("French_Fr");
    $('[id$=lblaudithistory]').text("Audit History_Fr");
    $('[id$=lblAuditSection]').text("Audit Section_Fr");
    $('[id$=lblauditstatuss]').text("Audit Status_Fr");
    $('[id$=lblauditedby]').text("Audited By_Fr");
    $('[id$=lblauditcomment]').text("Audit Comment_Fr :");
    $('[id$=lblCIApproverComments]').text("CI Approver Comment_Fr");
    $('[id$=lblProjectInformation]').text("Project Information_Fr ");
    $('[id$=lblProjAcpt]').text("Was this Project an accepted CI Idea?_Fr :");
    $('[id$=lblfacility]').text("Facility / Site_Fr :");
    $('[id$=lblreasUser]').val("ReAssign User_Fr :");
    $('[id$=lblReassignTask]').val("ReAssign Task_Fr");
    $('[id$=lblciidea]').text("CI Idea #_Fr :");
    $('[id$=lblprocejcid]').text("Project ID - CIP_Fr :");
    $('[id$=prjName]').text("Project Name_Fr :");
    $('[id$=lblprojldrchk]').text("Project Leader in AD_Fr :");
    $('[id$=lblprojldr]').text("Project Leader_Fr :");
    $('[id$=lblprjclasf]').text("Project Classification_Fr :");
    $('[id$=lblprojpriority]').text("Project Prioritization_Fr :");
    
    $('[id$=lblconfCI]').text("Confidential CI_Fr :");
    $('[id$=lblbnftchk]').text("Lean Benefits_Fr :");
    $('[id$=lblprjtype]').text("Project Type_Fr :");
    $('[id$=lblLeanBnType]').text("Lean Benefit Type_Fr :");
    $('[id$=lblBenefitType]').text("Business Cost Model_Fr :");
    $('[id$=lblconfCI]').text("Confidential CI_Fr :");
    $('[id$=lblProjectApprovals]').text("Project Approvals_Fr ");
    $('[id$=itresource]').text("IT Resources Required_Fr :");
    $('[id$=lblitreview]').text("IT Review_Fr :");
    $('[id$=lblfinreview]').text("Finance Review_Fr :");
    $('[id$=lblcileaderapp]').text("CI Leader Approval_Fr :");
    $('[id$=lblprojstatus]').text("Project Status_Fr :");
    $('[id$=lblProjectDescription]').text("Project Description (Describe the project, background issue, objective)_Fr :");
    $('[id$=lblProjectBenefits]').text("Project Benefits - Why are we looking at this project? Hard/Soft Benefits? In Scope/Out of Scope & include calculation_Fr :");
    $('[id$=lblCIIdeaDocumentation]').text("CI Project Documentation_Fr ");
    $('[id$=lblProjectTracking]').text("Project Tracking_Fr ");
    $('[id$=lblListofAttachments]').text("List of Attachments_Fr ");
    $('[id$=lblComments]').text("Comments_Fr ");
    $('[id$=btnSave]').val("Submit_Fr");
    $('[id$=btnCancel]').val("Cancel_Fr");
    
    
    $('[id$=lblProjApBy]').text("Project Approved By_Fr :");

    $('[id$=lblCapitalsav]').text("CI Project Savings_Fr ");
    $('[id$=lblcaprequire]').text("Capital Required_Fr :");
    $('[id$=lblCapExpAmount]').text("CapEx Amount_Fr :");
    $('[id$=lblImplCost]').text("Implementation Cost_Fr :");
    $('[id$=lbltotal]').text("Total_Fr ");
    $('[id$=lblProjStartDate]').text("Project Start Date_Fr :");
    $('[id$=lblImpDate]').text("Implementation Date_Fr :");
    $('[id$=lblCompDate]').text("Completion Date_Fr :");
    $('[id$=lblcancelDate]').text("Cancelled Date_Fr :");
    $('[id$=lblcelbtype]').text("Celebration Date_Fr :");    
    $('[id$=lblCelebType]').text("Celebration Type_Fr :");
    $('[id$=lblPeriod]').text("Select Period_Fr ");

    $('[id$=Label1]').text("This CI will save over 12 months_Fr :");
    $('[id$=Label2]').text("This CI has saved year to date_Fr :");
    $('[id$=Label3]').text("Estimated savings to be realized are_Fr :");
    $('[id$=lbltotalAmount]').text("Total_Fr ");
    $('[id$=yearlbltotal]').text("Total_Fr ");
    $('[id$=estlbltotal]').text("Total_Fr ");
    $('[id$=lblWorkflowTop]').text("Workflow Status_Fr :");
    $('[id$=btnupdatecal]').val("Update Calculation_Fr");
    $('[id$=lblWorkflowHistory]').text("Workflow History_Fr");
    $('[id$=btnreassign]').val("Re-assign_Fr");
    $('[id$=btnApprove]').val("Submit_Fr");    
    $('[id$=lblAuditSection]').text("Audit Section_Fr");
    $('[id$=lblCommnets]').text("Comments / Updates_Fr");
    $('[id$=lblaction]').text("Task Action_Fr :");
    $('[id$=lblReassignTask]').text("ReAssign Task_Fr ");
    $('[id$=lblreasUser]').text("ReAssign User_Fr :");
    // = Help Text
    //console.log($('[id$=imgHelpProjectInformation]').attr('title'));
    $('[id$=imgHelpProjectInformation]').attr("title", "Information sur le projet Aide");
}