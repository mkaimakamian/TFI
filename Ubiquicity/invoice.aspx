﻿<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="Ubiquicity.invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="container-fluid pt-2">
        <%--<UCmkc:UCHeaderWeb runat="server" ID="UCHeaderWeb" Label="Nosotros" Imgsource="~/Resources/about01.svg" />--%>

        <div class="row border rounded mb-3 p-1">
            <div class="col-10" style="height: 190px; overflow-x: hidden; overflow-y: scroll;">
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
            <div class="col-2 rounded mkcCheckoutEnd text-center">
                <h6 class="mt-2">Resumen de compra</h6>
                <p style="font-size: 64px" class="m-0 mkcLetraNaranja">#1</p>
                <p id="totalItems" runat="server" class="m-0"></p>
                <p id="totalAmount" runat="server" class="m-0"></p>
            </div>
        </div>

        <!-- Listado horizontal de medios de pago-->
        <div class="row border rounded mb-3 p-1">
            <div class="col-2 rounded mkcCheckoutEnd text-center">
                <h6 class="mt-2">Medios de pago</h6>
                <p style="font-size: 64px" class="m-0 mkcLetraNaranja">#2</p>
                <p class="m-0">¿Tarjeta? ¿Crétito?<br />
                    ¡todo vale!</p>
            </div>

            <div class="col-10">
                <div class="row">
                    <!-- Modo de pago -->
                    <div class="col-3">
                        <h6>¿Cómo vas a pagar?</h6>
                        <p class="text-muted">Recordá que podés utilizar múltiples medios de pago.</p>
                        <asp:CheckBox ID="creditNotesChk" runat="server" Text="Notas de crédito" /><br />
                        <asp:CheckBox ID="cardChk" runat="server" Text="Tarjeta de crédito" />
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
                                <label for="dropCardInput">Banco</label>
                                <asp:DropDownList ID="dropCardInput" runat="server" Font-Size="Small" CssClass="dropdown-toggle form-control form-control-sm" />
                            </div>
                            <div class="form-group col-3">
                                <label for="cvvInput">Código</label>
                                <input id="cvvInput" runat="server" type="text" minlength="3" maxlength="3"
                                    class="form-control form-control-sm">
                            </div>
                            <div class="form-group">
                                <label for="duedateInput">Vencimiento</label>
                                <UCmkc:UCCalendar runat="server" ID="duedateInput" DefaultView="Months" />
                            </div>
                        </div>
                        <div class="row pb-2">
                            <div class="col">
                                Número de latarjeta
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <input id="card1Input" runat="server" type="text" minlength="4" maxlength="4"
                                     pattern="[0-9]{4}" class="form-control form-control-sm">
                            </div>
                            -
                            <div class="form-group col">
                                <input id="card2Input" runat="server" type="text" minlength="4" maxlength="4"
                                     pattern="[0-9]{4}" class="form-control form-control-sm">
                            </div>
                            -
                            <div class="form-group col">
                                <input id="card3Input" runat="server" type="text" minlength="4" maxlength="4"
                                    pattern="[0-9]{4}" class="form-control form-control-sm">
                            </div>
                            -                       
                            <div class="form-group col">
                                <input id="card4Input" runat="server" type="text" minlength="4" maxlength="4"
                                    pattern="[0-9]{4}" class="form-control form-control-sm">
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>

        <!-- Formulario de dirección-->
        <div class="row border rounded mb-3 p-1">
            <div class="col-10">
                <div class="row">
                    <!-- Nombre -->
                    <div class="col-3">
                        <h6>¿A quién le facturamos?</h6>
                        <div class="form-group">
                            <label for="namesInput">Nombres</label>
                            <input id="firstNamesInput" runat="server" type="text" maxlength="50" 
                                pattern="[a-zA-Z]{1-50}" class="form-control form-control-sm">
                        </div>
                        <div class="form-group">
                            <label for="lastNamesInput">Apellidos</label>
                            <input id="lastNamesInput" runat="server" type="text" maxlength="50"
                                pattern="[a-zA-Z]{1-50}" class="form-control form-control-sm">
                        </div>
                    </div>

                    <!-- Dirección de facturación -->
                    <div class="col-9  border-left">
                        <h6>¿A qué dirección facturamos?</h6>
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="form-group col-6">
                                        <label for="streetInput">Calle</label>
                                        <input id="streetInput" runat="server" type="text" maxlength="50"
                                            class="form-control form-control-sm">
                                    </div>
                                    <div class="form-group col-3">
                                        <label for="numberInput">Número</label>
                                        <input id="numberInput" runat="server" type="text" maxlength="5"
                                            pattern="[0-9]{0-5}"
                                            class="form-control form-control-sm">
                                    </div>
                                    <div class="form-group col-3">
                                        <label for="zipInput">C. P.</label>
                                        <input id="zipInput" runat="server" type="text" class="form-control form-control-sm" maxlength="10">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col">
                                        <label for="cityInput">Ciudad</label>
                                        <input id="cityInput" runat="server" type="text" class="form-control form-control-sm" maxlength="50">
                                    </div>
                                    <div class="form-group col">
                                        <label for="countryInput">País</label>
                                        <input id="countryInput" runat="server" type="text" class="form-control form-control-sm" maxlength="50">
                                    </div>
                                </div>

                            </div>
                            <div class="col-4">
                                <label for="observationInput">Observación</label>
                                <textarea id="observationInput" runat="server" class="form-control form-control-sm" rows="5" maxlength="250"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-2 rounded mkcCheckoutEnd text-center">
                <h6 class="mt-2">Fin de la operación</h6>
                <p style="font-size: 64px" class="m-0 mkcLetraNaranja">#3</p>
                <asp:LinkButton ID="btnCheckout" runat="server" CssClass="btn btn-warning btn-sm"
                    Text="¡Pagar!" OnClick="PerformCheckout" />
            </div>


        </div>

    </div>
</asp:Content>
