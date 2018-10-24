﻿<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="Ubiquicity.shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <asp:UpdatePanel ID="upShop" runat="server">
<ContentTemplate>
    <script type="text/javascript">
        var itemList = [];

        function AddToCompare(itemId) {

            if (itemList.length == 4) return;
            var found = false;

            for (var i = itemList.length - 1; 0 < i + 1 && !found; --i) {

                if (itemList[i] == itemId) {
                    itemList.splice(i, 1);
                    found = true;
                }
            }

            if (!found) {
                itemList.push(itemId);
            }

            //Asigno al hidden input la variable para poder levantarla desde el code behind
            var hidden = document.getElementById('contentHolder_selectedItemsInput');
            hidden.value = itemList;
        }
    </script>
    <div class="container-fluid">
        <UCmkc:UCHeaderWeb runat="server" Label="Catálogo" Imgsource="~/Resources/shop01.svg" />
        <UCmkc:UCItemShopFilter runat="server" ID="UCItemShopFilter" />
        
        <div class="row">
            <!-- Comparar, comprar y resumen -->
            <div class="col-2 text-center">
                <div class="row border rounded mt-1">
                    <div class="form-group col-12 bg-light pb-2">
                        <label for="compareBtn">Seleccioná hasta 4 ítems para compararlos.</label>
                        <asp:LinkButton ID="compareBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-clone' aria-hidden='true'></i> Comparar" OnClick="PerformCompare" />
                        <input id="selectedItemsInput" type="hidden" runat="server" />
                    </div>

                    <div class="form-group col-12">
                        <label for="cartBtn">¿Terminaste de agregar? <br />¡Pasemos al pago!</label>
                        <asp:LinkButton ID="cartBtn" runat="server" CssClass="btn btn-warning btn-sm"
                            Text="<i class='fa fa-tags' aria-hidden='true'></i> Adquirir"
                            OnClick="GoToInvoice" />
                    </div>

                    <div class="form-group col-12">
                        <hr />
                        <label>Vistazo rápido</label>
                        
                    </div>
                </div>
            </div>

            <!-- Galeria de elementos -->
            <div class="col-10">
                <%--justify-content-between--%>
                <div class="row">
                    <asp:Repeater ID="shopRepeater" runat="server" OnItemCommand="shopRepeater_ItemCommand">
                        <ItemTemplate>
                            <div class="border rounded bg-light p-1 m-1" style="width: 240px;">
                          <%--      <div class="row pb-1">
                                    <div class="col">--%>
                                        <img src="<%# Eval("Image") %>" class="img-thumbnail"/>
                    <%--                </div>
                                </div>--%>
                                <h5><%# Eval("Name") %></h5>
                                <blockquote class="blockquote">
                                    <p class="mb-1 mt-2 text-truncate" style="font-size: 14px;">
                                        <%# Eval("Description") %>
                                    </p>
                                    <footer class="blockquote-footer mkcLetraNaranja">
                                        <i class="fa fa-tags"></i>$AR <%# Eval("Price") %>
                                    </footer>
                                </blockquote>
                                <div class="form-group text-center">
                                    <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="¡Lo quiero!" CommandName="AddToCart" CommandArgument='<%# Eval("id") %>' />
                                    <asp:LinkButton ID="btnDetail" runat="server" CssClass="btn btn-primary btn-sm" Text="Detalle" CommandName="ShowDetail" CommandArgument='<%# Eval("id") %>' />
                                </div>

                                <input type="checkbox" value="<%# Eval("Id") %>" onclick="AddToCompare(this.value)" />Comparar

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    </ContentTemplate>
</asp:UpdatePanel>
    <UCmkc:UCModalCompare runat="server" ID="ModalCompare" />
    <UCmkc:UCModalItemShop runat="server" ID="ModalItemShop" />
</asp:Content>
