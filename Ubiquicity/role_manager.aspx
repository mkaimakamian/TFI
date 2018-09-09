<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="role_manager.aspx.cs" Inherits="Ubiquicity.role" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    Título<br />
&nbsp;<UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Role / Permission form -->
    <div class="modal fade" id="modalRolePermission" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <UCmkc:UCFormRolePermission runat="server" ID="UCFormRolePermission" />
                <div class="modal-footer">
                    <asp:Button ID="ucModalLanguage_btnAccept" runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="modalRolePermission_btnAcceptClick"/>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
