<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCcrudGrid.ascx.cs" Inherits="Ubiquicity.UserControls.UCcrudGrid" %>
    
<asp:Button ID="btnNewItem" runat="server" CssClass="btn btn-primary" Text="Nuevo" OnClick="btnNewItem_Click" />
    
<asp:GridView AllowPaging="true" PageSize="10" OnPageIndexChanging="gvItem_PageIndexChanging"
    ID="gvItem" runat="server" OnRowCommand="gvItem_OnRowCommand" class="table table-bordered bs-table table-striped table-sm" >
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="btnDelete" runat="server"  CssClass="btn btn-secondary" CausesValidation="false" CommandName="DeleteItem" Text="Eliminar" CommandArgument='<%# Eval("id") %>'/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server"  CssClass="btn btn-secondary" CausesValidation="false" CommandName="EditItem" Text="Editar" CommandArgument='<%# Eval("id") %>'/>
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
</asp:GridView>