<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="support_manager.aspx.cs" Inherits="Ubiquicity.support_manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/global.svg" Title="Soporte post venta" Subtitle="En este apartado podrás..." Content="Responder inquietudes." />
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Support form -->
<div id="modalInvoiceItemSupport" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <asp:UpdatePanel ID="upUCModalInvoiceItemSupport" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                <UCmkc:UCModalInvoiceItemSupport runat="server" ID="UCModalInvoiceItemSupport" />
                                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
