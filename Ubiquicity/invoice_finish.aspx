<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="invoice_finish.aspx.cs" Inherits="Ubiquicity.invoide_finish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">

    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-3">
            </div>
            <div class="col-md-6 border border-success bg-light rounded p-3">
                <div class="row justify-content-center text-center pb-3">
                    <div class="col">
                        <img src="Resources/logo_azul.png" height="96" />
                    </div>
                </div>
                <h3 class="justify-content-center text-center">¡La compra finalizó con éxito!</h3>
                <blockquote class="blockquote">
                    <p class="mb-1 mt-4">
                        Gracias por haber adquirido uno de nuestros producto ;D... te dejamos una breve encuesta para que nos hagas saber qué tal fue el proceso de compra.
                    </p>
                    <footer class="blockquote-footer">
                        Sólo tomará unos segundos.
                    </footer>
                </blockquote>

                <!-- encuesta de opinion -->
                <div class="row">
                    <div id="divPoll" runat="server" class="col-12">
                        <asp:Repeater ID="pollRepeater" runat="server" OnItemCreated="PopulateOptions">
                            <ItemTemplate>
                                <h5 itemid="<%# Eval("Id") %>"><%# Eval("Question") %></h5>
                                <asp:HiddenField ID="lblQuestion" runat="server" Value='<%# Eval("Id") %>' />
                                <asp:RadioButtonList ID="radioOptionList" runat="server" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="form-group text-center">
                            <asp:LinkButton ID="btnPoll" runat="server" CssClass="btn btn-primary btn-sm" Text="Contestar" OnClick="SubmitAnswer" />
                        </div>
                    </div>
                </div>

                <!-- Mensaje de éxito -->
                <div id="divSuccessMessage" runat="server" class="row justify-content-center text-center" visible="false">
                    <div class="col">
                        <h3 class="text-success">¡Gracias por participar!</h3>
                            <asp:Button runat="server" CssClass="btn btn-secondary btn-sm mr-4" Text="Descargar factura" OnClick="PerformDownload" />

                    </div>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
    </div>

</asp:Content>
