<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="credit_manager.aspx.cs" Inherits="Ubiquicity.credit_manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/global.svg" Title="Crédito / débito" Subtitle="En este apartado podrás..." Content="Aprobar y rechazar notas de crédito." />
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Credit note form -->
    <div id="modalMap" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <asp:UpdatePanel ID="upUCModalForm" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--<UCmkc:UCFormMap runat="server" ID="UCFormMap" />--%>
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
