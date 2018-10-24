<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="role_manager.aspx.cs" Inherits="Ubiquicity.role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">

    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Content="Agrupar los permisos en roles, lo que permitirá más adelante otorgarle privilegios a los usuarios más fácilmente." Image="~/Resources/roles_permisos.svg" Subtitle="En este apartado podrás..." Title="Asignación de roles a usuarios" />

    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Role / Permission form -->
    <div class="modal fade" id="modalRolePermission" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <asp:UpdatePanel ID="upUCModalForm" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <UCmkc:UCFormRolePermission runat="server" ID="UCFormRolePermission" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal-footer">
                    <asp:Button ID="ucModalLanguage_btnAccept" runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="AccepCreateOrModify" />
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
