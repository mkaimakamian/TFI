<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="user_role_manager.aspx.cs" Inherits="Ubiquicity.user_role_manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    Relación usuario roles
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Role / Permission form -->
    <div class="modal fade" id="modalUserRole" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <UCmkc:UCFormUserRole runat="server" id="UCFormUserRole" />
                <div class="modal-footer">
                    <asp:Button ID="ucModalLanguage_btnAccept" runat="server" CssClass="btn btn-primary" Text="Aceptar" OnClick="modalUserRole_btnAcceptClick"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
