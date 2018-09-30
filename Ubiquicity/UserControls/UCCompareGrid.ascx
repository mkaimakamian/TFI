<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCCompareGrid.ascx.cs" Inherits="Ubiquicity.UserControls.UCCompareGrid" %>
<%--<%@ Register TagPrefix="UCmkc" TagName="UCCompareItem" Src="~/UserControls/UCCompareItem.ascx" %>--%>
<asp:GridView ID="compareGridView" runat="server" OnRowDataBound="compareGridView_RowDataBound">
    <Columns>
         <%--<asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <UCmkc:UCCompareItem runat="server" ID="miId" />
            </ItemTemplate>
        </asp:TemplateField>--%>
    </Columns>
</asp:GridView>
