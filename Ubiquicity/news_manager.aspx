<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="news_manager.aspx.cs" Inherits="Ubiquicity.news_manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">

    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/roles_permisos.svg" Title="Gestión de novedades" Subtitle="En este apartado podrás..." Content="Agregar novedades al sistema, editarlas y eliminarlas." />
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Map form -->
    <div id="modalNews" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <asp:UpdatePanel ID="upUCModalForm" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <UCmkc:UCFormNews runat="server" ID="UCFormNews" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal-footer">
                    <asp:Button ID="modalMap_btnAccept" runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="AccepCreateOrModify" />
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
