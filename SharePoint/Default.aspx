<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SharePoint.Default" %>

<%@ Register Src="~/CalculationControl.ascx" TagPrefix="calculation" TagName="CalculationControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" method="post">
        <calculation:CalculationControl ID="calc" runat="server" />
    </form>
</body>
</html>
