<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="Ubiquicity.shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">

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

            <!-- filtros & carrito -->
<%--            <div class="col-2">
                <div class="card bg-light mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Filtros</h5>
                        <p class="card-text">Utilizá los filtros para acotar la búsqueda.</p>
                        <hr />
                        <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Comparar" OnClick="PerformCompare" />
                        <input id="selectedItemsInput" type="hidden" runat="server" />
                        <hr />
                        <asp:LinkButton ID="btnCart" runat="server" CssClass="btn btn-warning btn-sm"
                            Text="<i class='fa fa-tags' aria-hidden='true'></i> Sin elementos"
                            OnClick="GoToInvoice" />
                    </div>
                </div>
            </div>--%>

            <!-- Galeria de elementos -->
            <div class="col-12">
                <div class="row">
                    <%--<div class="card-deck">--%>
                    <asp:Repeater ID="shopRepeater" runat="server" OnItemCommand="shopRepeater_ItemCommand">
                        <ItemTemplate>
                            <div class="col-3 border border-secondary bg-light rounded m-1">
                                <div class="row pb-3 pt-3">
                                    <div class="col">
                                        <img src="<%# Eval("Image") %>" class="img-thumbnail" />
                                    </div>
                                </div>
                                <h5><%# Eval("Name") %></h5>
                                <blockquote class="blockquote">
                                    <p class="mb-1 mt-2 text-truncate" style="font-size: 14px;">
                                        <%# Eval("Description") %>
                                    </p>
                                    <footer class="blockquote-footer mkcLetraNaranja">
                                        <i class="fa fa-tags"></i>$AR <%# Eval("Price") %>
                                    </footer>
                                </blockquote>
                                <div class="form-group">
                                    <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Adquirir" CommandName="AddToCart" CommandArgument='<%# Eval("id") %>' />
                                    <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Ver detalle" CommandName="ShowDetail" CommandArgument='<%# Eval("id") %>' />
                                </div>

                                <input type="checkbox" value="<%# Eval("Id") %>" onclick="AddToCompare(this.value)" />Comparar

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>
    <UCmkc:UCModalCompare runat="server" ID="ModalCompare" />
    <UCmkc:UCModalItemShop runat="server" ID="ModalItemShop" />
</asp:Content>
