<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="inquiry_manager.aspx.cs" Inherits="Ubiquicity.inquiry_manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/global.svg" Title="Preguntas" Subtitle="En este apartado podrás..." Content="Responder las preguntas de los clientes y moderarlas." />
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Map form -->
    <div id="modalInquiry" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <asp:UpdatePanel ID="upUCModalForm" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <UCmkc:UCFormInquiry runat="server" ID="UCFormInquiry" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="PerformAnswer" />
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
