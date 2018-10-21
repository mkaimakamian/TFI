<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="Ubiquicity.invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="container-fluid">
        <UCmkc:UCHeaderWeb runat="server" ID="UCHeaderWeb" Label="Nosotros" Imgsource="~/Resources/about01.svg" />

        <div class="row border rounded mb-3 p-1">
            <div class="col-10" style="height: 190px;">
                <%-- overflow-x: hidden; overflow-y: scroll;--%>
                <div class="row">

                    <!-- Listado horizontal de artículos -->
                    <asp:Repeater ID="checkoutRepeater" runat="server">
                        <ItemTemplate>
                            <div class="border rounded bg-light  p-1 m-1" style="width: 160px;">
                                <img src="<%# Eval("Image") %>" class="img-thumbnail" />
                                <h6 class="text-truncate"><%# Eval("Name") %></h6>
                                <blockquote class="blockquote">
                                    <p class="mb-1 mt-2 text-truncate" style="font-size: 14px;">
                                        <%# Eval("Description") %>
                                    </p>
                                    <footer class="blockquote-footer mkcLetraNaranja">
                                        <i class="fa fa-tags"></i>$AR <%# Eval("Price") %>
                                    </footer>
                                </blockquote>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

            <!-- Resumen de lo que se adquirió-->
            <div class="col-2 rounded mkcMenu">
                <h6>Resumen de compra</h6>
                Artículos: XX<br />
                Total: $AR XXX
            </div>
        </div>

        <!-- Listado horizontal de medios de pago-->
        <div class="row border rounded mb-3 p-1">
            <div class="col-2 rounded mkcMenu">
                <h6>Medios de Pago</h6>
            </div>

            <div class="col-10">
                <div class="row">
                    <!-- Modo de pago -->
                    <div class="col-3">
                        <h6>¿Cómo vas a pagar?</h6>
                        <p class="text-muted">Recorá que podés usar ambos medios de pago.</p>
                        <asp:CheckBox ID="creditNotesChk" runat="server" Text="Notas de crédito" /><br />
                        <asp:CheckBox ID="cardChk" runat="server" Text="Con tarjeta" />
                    </div>

                    <!-- Notas de crédito -->
                    <div class="col-4 border-left">
                        <h6>Notas de crédito</h6>
                        <div class="form-group">
                            <label class="text-muted" for="checkCreditNotes">¡Podés elegir varias: son todas tuyas :D!</label>
                            <asp:CheckBoxList ID="checkCreditNotes" runat="server" />
                        </div>
                    </div>

                    <!-- Trajeta -->
                    <div class="col-5 border-left">
                        <h6>Tarjeta de crédito</h6>

                        <div class="row">
                            <div class="form-group col">
                                <label for="dropCategoryInput">Banco</label>
                                <asp:DropDownList ID="dropCardInput" runat="server" Font-Size="Small" CssClass="dropdown-toggle form-control form-control-sm" />
                            </div>
                            <div class="form-group col-3">
                                <label for="cvvInput">Código</label>
                                <input id="cvvInput" runat="server" type="text" class="form-control form-control-sm">
                            </div>
                            <div class="form-group">
                                <label for="duedateInput">Vencimiento</label>
                                <UCmkc:UCCalendar runat="server" ID="duedateInput" />
                            </div>
                        </div>
                        <div class="row pb-2">
                            <div class="col">
                                Número de latarjeta
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <input id="card1Input" runat="server" type="text" class="form-control form-control-sm">
                            </div>
                            -
                            <div class="form-group col">
                                <input id="card2Input" runat="server" type="text" class="form-control form-control-sm">
                            </div>
                            -
                            <div class="form-group col">
                                <input id="card3Input" runat="server" type="text" class="form-control form-control-sm">
                            </div>
                            -                       
                            <div class="form-group col">
                                <input id="card4Input" runat="server" type="text" class="form-control form-control-sm">
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>

        <!-- Formulario de dirección-->
        <div class="row border rounded mb-3 p-1">
            <div class="col-10" style="height: 190px;">
                <div class="row">
                </div>
            </div>

            <div class="col-2 rounded mkcMenu">
                <h6>Resumen de compra</h6>
                Artículos: XX<br />
                Total: $AR XXX
            </div>
        </div>



        <div class="row">
            <div class="col-12">
                <asp:LinkButton ID="btnCheckout" runat="server" CssClass="btn btn-warning btn-sm"
                    Text="Comprar" OnClick="PerformCheckout" />
            </div>
        </div>
    </div>
</asp:Content>
