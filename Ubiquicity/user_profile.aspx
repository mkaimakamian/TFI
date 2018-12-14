<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="user_profile.aspx.cs" Inherits="Ubiquicity.user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/backup_manager01.svg" Title="Perfil de usuario" Subtitle="En este apartado podrás..." Content="Administrar los datos de tu cuenta y conocer tus movimientos." />

    <UCmkc:UCHeaderBackOffice runat="server" Content="Estado de cuenta" />
    <div class="row rounded border p-0 m-0">
        <div class="col-12 p-0">
            <div class="row m-0 bg-light">
                <div class="col-1">
                </div>
                <div class="col-1">
                    <p>Comp.</p>
                </div>
                <div class="col-3">
                    <p>Concepto</p>
                </div>
                <div class="col-2">
                    <p>Estado</p>
                </div>
                <div class="col-2">
                    <p>Emisión</p>
                </div>
                <div class="col-1">
                    <p>Debe</p>
                </div>
                <div class="col-1">
                    <p>Haber</p>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="invoiceRepeater" runat="server" OnItemDataBound="ResolveDownloadLink" OnItemCommand="PerformDownload">
                    <ItemTemplate>
                        <div class="col-12">
                            <div class="row m-0">
                                <div class="col-1">
                                    <asp:LinkButton ID="downloadLink" runat="server"
                                        CommandName="PerformDownload" CommandArgument='<%#Eval("IssuedId") %>'>Descargar</asp:LinkButton>
                                </div>
                                <div class="col-1">
                                    <p>#<%#Eval("IssuedId") %></p>
                                </div>
                                <div class="col-3">
                                    <p><%#Eval("Description") %></p>
                                </div>
                                <div class="col-2">
                                    <p><%#Eval("Status") %></p>
                                </div>
                                <div class="col-2">
                                    <p><%#Eval("Date") %></p>
                                </div>
                                <div class="col-1">
                                    <p><%# Eval("Debe", "{0:c}") %></p>
                                </div>
                                <div class="col-1">
                                    <p><%#Eval("Haber", "{0:c}") %></p>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <UCmkc:UCHeaderBackOffice runat="server" Content="Tus productos adquiridos" />
    <div class="row rounded border p-0 m-0">
        <div class="col-12 p-0">
            <div class="row m-0 bg-light">
                <div class="col-1">
                    <p>Factura</p>
                </div>
                <div class="col-2">
                    <p>Producto</p>
                </div>
                <div class="col-1">
                    <p>Precio</p>
                </div>
                <div class="col-1">
                    <p>Estado</p>
                </div>
                <div class="col-2">
                    <p>Actualizado</p>
                </div>
                <div class="col">
                    <p>Acciones / Observaciones</p>
                </div>
                <div class="col">
                    <p>Postventa</p>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="productRepeater" runat="server" OnItemDataBound="ResolveActionLink" OnItemCommand="PerformTrackingAction">
                    <ItemTemplate>
                        <div class="col-12">
                            <div class="row m-0">
                                <div class="col-1">
                                    <p>#<%#Eval("InvoiceId") %></p>
                                </div>
                                <div class="col-2">
                                    <p><%#Eval("InvoiceItem.Resource.Name") %></p>
                                </div>
                                <div class="col-1">
                                    <p><%#Eval("InvoiceItem.Resource.Price") %></p>
                                </div>
                                <div class="col-1">
                                    <p><%#Eval("Status") %></p>
                                </div>
                                <div class="col-2">
                                    <p><%#Eval("Date") %></p>
                                </div>
                                <div class="col">
                                    <asp:LinkButton ID="claimCNLink" runat="server" CommandArgument='<%#Eval("InvoiceItem.Id") %>'>Reclamar</asp:LinkButton>
                                </div>

                                <div class="col">
                                    <asp:LinkButton ID="supportLink" runat="server" CommandName="PerformSupport" CommandArgument='<%#Eval("InvoiceItem.Id") %>'>Consultar</asp:LinkButton>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <!-- Ranking form -->
    <div id="modalRanking" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <%--  <asp:UpdatePanel ID="upUCModalForm" runat="server" UpdateMode="Conditional">--%>
                <%--<ContentTemplate>--%>
                <UCmkc:UCFormRanking runat="server" ID="UCFormRanking" />
                <%--                    </ContentTemplate>
                </asp:UpdatePanel>--%>
                <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="PerformRanking" />
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalInvoiceItemSupport" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <%--  <asp:UpdatePanel ID="upUCModalForm" runat="server" UpdateMode="Conditional">--%>
                <%--<ContentTemplate>--%>
                <UCmkc:UCModalInvoiceItemSupport runat="server" ID="UCModalInvoiceItemSupport" />
                <%--                    </ContentTemplate>
                </asp:UpdatePanel>--%>
                <div class="modal-footer">
                    <%--<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" />--%>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
