<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmSalesOrderDetail.aspx.cs" Inherits="FeladatD.frmSalesOrderDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="grdSOD" runat="server" DataSourceID="dsSOD" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="SalesOrderDetailID" HeaderText="SalesOrderDetailID" InsertVisible="False" SortExpression="SalesOrderDetailID"></asp:BoundField>
                <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" SortExpression="OrderQty"></asp:BoundField>
                <asp:BoundField DataField="CarrierTrackingNumber" HeaderText="CarrierTrackingNumber" SortExpression="CarrierTrackingNumber"></asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
                <asp:BoundField DataField="UnitPrice" DataFormatString="{0:c2}" HeaderText="Egys&#233;g&#225;r" SortExpression="UnitPrice"></asp:BoundField>
                <asp:BoundField DataField="LineTotal" DataFormatString="{0:c2}" HeaderText="LineTotal" SortExpression="LineTotal"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsSOD" runat="server" 
            ConnectionString='<%$ ConnectionStrings:AdventureWorks2017ConnectionString %>' 
            SelectCommand="Select SOD.SalesOrderDetailID, SOD.OrderQty, SOD.CarrierTrackingNumber, SO.Description, SOD.UnitPrice, SOD.LineTotal 
                FROM Sales.SalesOrderDetail SOD
                INNER JOIN  Sales.SpecialOffer SO ON SOD.SpecialOfferID = SO.SpecialOfferID
                Where SOD.ProductID = @ProductID
                ORDER BY 1">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="ProductID" Name="ProductID"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

