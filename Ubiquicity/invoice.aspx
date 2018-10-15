<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="Ubiquicity.invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="container-fluid">
        <UCmkc:UCHeaderWeb runat="server" ID="UCHeaderWeb" Label="Nosotros" Imgsource="~/Resources/about01.svg" />

        <div class="row">
            <!-- Productos a pagar -->
            <div class="col-3" >
                <div class="card">
                    <div class="card-header">
                        1) Revisá tus artículos
                    </div>
                    <div class="card-body text-primary">
                        <h5 class="card-title">Artículos</h5>
                        <asp:Repeater ID="checkoutRepeater" runat="server">
                            <ItemTemplate>
                                <p class="card-text"><%# Eval("Name") %> - <%# Eval("Price") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>
            </div>
            <div class="col-3">
                <div class="card">
                    <div class="card-header">
                        2) Elije tus medios de pago
                    </div>
                    <div class="card-body text-primary">
                        <h5 class="card-title">Medios de pago</h5>
                        <!-- Nota de credito -->
                        <div class="form-group">
                            <label for="checkCreditNotes">Notas de crédito</label>
                            <asp:CheckBoxList ID="checkCreditNotes" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="checkCard">Tarjetas</label>
                            <asp:CheckBoxList ID="checkCard" runat="server" />
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        3) Completá los datos
                    </div>
                    <div class="card-body text-primary">
                        <h5 class="card-title">Dirección de facturación</h5>
                    </div>

                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-12">
            <asp:LinkButton ID="btnCheckout" runat="server" CssClass="btn btn-warning btn-sm" 
                            Text="Comprar" OnClick="PerformCheckout"/>
            </div>
        </div>
    </div>
</asp:Content>
