<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="Ubiquicity.user" %>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    Agregar barra de título 
    <asp:GridView ID="gvUser" runat="server" OnRowCommand="gvUser_OnRowCommand">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CausesValidation="false" CommandName="DeleteItem" Text="Eliminar" CommandArgument='<%# Eval("id") %>'/>
                    <asp:Button ID="btnEdit" runat="server" CausesValidation="false" CommandName="EditItem" Text="Editar" CommandArgument='<%# Eval("id") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
    </asp:GridView>

    <!-- new member -->
    <div class="modal fade" id="ucModalNewMember" tabindex="-1" role="dialog" aria-labelledby="Registro" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <ucmkc:ucformnewmember runat="server" ID="UCFormNewMember" />
                <div class="modal-footer">
                    <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary" Text="Aceptar"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
