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
                    <p>#</p>
                </div>
                <div class="col-3">
                    <p>Concepto</p>
                </div>
                <div class="col-1">
                    <p>Monto</p>
                </div>
                <div class="col-1">
                    <p>Estado</p>
                </div>
                <div class="col-2">
                    <p>Emisión</p>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="invoiceRepeater" runat="server" OnItemDataBound="invoiceRepeater_ItemDataBound" OnItemCommand="PerformDownload">
                    <ItemTemplate>
                        <div class="col-12">
                            <div class="row m-0">
                                <div class="col-1">
                                    <asp:LinkButton ID="downloadLink" runat="server"
                                        CommandName="PerformDownload" CommandArgument='<%#Eval("IssuedId") %>'>Descargar</asp:LinkButton>
                                </div>
                                <div class="col-1">
                                    <p><%#Eval("IssuedId") %></p>
                                </div>
                                <div class="col-3">
                                    <p><%#Eval("Description") %></p>
                                </div>
                                <div class="col-1">
                                    <p><%#Eval("Amount") %></p>
                                </div>
                                <div class="col-1">
                                    <p><%#Eval("Status") %></p>
                                </div>
                                <div class="col-2">
                                    <p><%#Eval("Date") %></p>
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
                <div class="col-2">
                    <p>Producto</p>
                </div>
                <div class="col-1">
                    <p>Estado</p>
                </div>
                <div class="col-2">
                    <p>Actualizado</p>
                </div>

                <div class="col-6">
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="productRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-12">
                            <div class="row m-0">
                                <div class="col-2">
                                    <p><%#Eval("Resource") %></p>
                                </div>
                                <div class="col-1">
                                    <p><%#Eval("Status") %></p>
                                </div>
                                <div class="col-2">
                                    <p><%#Eval("Date") %></p>

                                </div>

                                <div class="col-6">
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <%-- <UCmkc:UCHeaderBackOffice runat="server"  Content="Estado de cuenta"/>
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <UCmkc:UCHeaderBackOffice runat="server"  Content="Tus productos adquiridos"/>
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGridTracking" />--%>
</asp:Content>
