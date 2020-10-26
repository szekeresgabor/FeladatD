<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmProdct.aspx.cs" Inherits="FeladatD.frmProdct" culture="en-us" meta:resourcekey="PageResource1" uiculture="en-us" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblCategory" runat="server" meta:resourcekey="lblCategoryResource1"></asp:Label>
        <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="dsCategory" DataTextField="CategoryName" DataValueField="CategoryID" AutoPostBack="True" meta:resourcekey="ddlCategoryResource1"></asp:DropDownList>
        <br />
        <asp:Label ID="lblSubCategory" runat="server"  meta:resourcekey="lblSubCategoryResource1"></asp:Label>
        <asp:DropDownList ID="ddlSubCategory" runat="server" AutoPostBack="True" DataSourceID="dsSubCategory" DataTextField="SubcategoryName" DataValueField="SubcategoryNameId" meta:resourcekey="ddlSubCategoryResource1"></asp:DropDownList>
        <br />
        <asp:GridView ID="grdProcut" runat="server" DataSourceID="dsProduct" AutoGenerateColumns="False" OnSelectedIndexChanged="grdProcut_SelectedIndexChanged" meta:resourcekey="grdProcutResource1">
            <Columns>
                <asp:BoundField DataField="ProductID"  ReadOnly="True" InsertVisible="False" SortExpression="ProductID" meta:resourcekey="BoundFieldResource1"></asp:BoundField>
                <asp:BoundField DataField="ProductName" SortExpression="ProductName" meta:resourcekey="BoundFieldResource2"></asp:BoundField>
                <asp:BoundField DataField="Color" SortExpression="Color" meta:resourcekey="BoundFieldResource3"></asp:BoundField>
                <asp:BoundField DataField="Size" SortExpression="Size" meta:resourcekey="BoundFieldResource4"></asp:BoundField>
                <asp:BoundField DataField="ListPrice" DataFormatString="{0:c}" SortExpression="ListPrice" meta:resourcekey="BoundFieldResource5"></asp:BoundField>
                <asp:BoundField DataField="SellStartDate" DataFormatString="{0:d}"  SortExpression="SellStartDate" meta:resourcekey="BoundFieldResource6"></asp:BoundField>
                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1"></asp:CommandField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="btnOK" runat="server" Text="OK" />

        <asp:SqlDataSource ID="dsCategory" runat="server" 
            ConnectionString='<%$ ConnectionStrings:AdventureWorks2017ConnectionString %>' 
            SelectCommand="SELECT C.ProductCategoryID as CategoryID, C.[Name] as CategoryName
                            FROM Production.ProductCategory C
                            Order by CategoryName"/>
         <asp:SqlDataSource ID="dsSubCategory" runat="server" 
            ConnectionString='<%$ ConnectionStrings:AdventureWorks2017ConnectionString %>' 
            SelectCommand="Select S.ProductSubcategoryID as SubcategoryNameId, s.Name as SubcategoryName
                            FROM Production.ProductSubcategory as S
                            Where s.ProductCategoryID = @CategoryID
                            Order by SubcategoryName">
             <SelectParameters>
                 <asp:ControlParameter ControlID="ddlCategory" PropertyName="SelectedValue" Name="CategoryID"/>
             </SelectParameters>
         </asp:SqlDataSource>
           <asp:SqlDataSource ID="dsProduct" runat="server" 
            ConnectionString='<%$ ConnectionStrings:AdventureWorks2017ConnectionString %>' 
            SelectCommand="Select P.ProductID, p.Name as ProductName, P.Color, p.Size, P.ListPrice, P.SellStartDate 
                            FROM Production.Product P
                            Where P.ProductSubcategoryID = @SubcategoryID
                            Order by ProductName">
             <SelectParameters>
                 <asp:ControlParameter ControlID="ddlSubCategory" PropertyName="SelectedValue" Name="SubcategoryID"/>
             </SelectParameters>
         </asp:SqlDataSource>
    </form>
</body>
</html>
