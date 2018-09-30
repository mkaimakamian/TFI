<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="user_role_manager.aspx.cs" Inherits="Ubiquicity.user_role_manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">

    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Content="Asignarle a cada usuario los roles, los que representan un conjunto de permisos." Image="~/Resources/usuarios_roles.svg" Subtitle="En este apartado podrás..." Title="Asignación de roles a usuarios" />
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Role / Permission form -->
    <div id="modalUserRole" class="modal fade"  tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <UCmkc:UCFormUserRole runat="server" id="UCFormUserRole" />
                <div class="modal-footer">
                    <asp:Button ID="ucModalLanguage_btnAccept" runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="AccepCreateOrModify"/>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
