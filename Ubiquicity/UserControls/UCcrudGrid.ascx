<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCcrudGrid.ascx.cs" Inherits="Ubiquicity.UserControls.UCcrudGrid" %>
    <asp:Button ID="btnNewItem" runat="server" CssClass="btn btn-primary" Text="Nuevo" OnClick="btnNewItem_Click" />
    <asp:GridView ID="gvItem" runat="server" OnRowCommand="gvItem_OnRowCommand">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CausesValidation="false" CommandName="DeleteItem" Text="Eliminar" CommandArgument='<%# Eval("id") %>'/>
                    <asp:Button ID="btnEdit" runat="server" CausesValidation="false" CommandName="EditItem" Text="Editar" CommandArgument='<%# Eval("id") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
    </asp:GridView>