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

        <!-- filtros & carrito -->
        <%--        <div class="row border rounded align-items-end mt-1">
            <div class="form-group col">
                <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Comparar" OnClick="PerformCompare" />
                <input id="selectedItemsInput" type="hidden" runat="server" />
            </div>
            <div class="form-group col">
                <asp:LinkButton ID="btnCart" runat="server" CssClass="btn btn-warning btn-sm"
                    Text="<i class='fa fa-tags' aria-hidden='true'></i> Sin elementos"
                    OnClick="GoToInvoice" />
            </div>


        </div>--%>

        <div class="row">
            <div class="col-2  text-center">
                <div class="row border rounded mt-1">
                    <div class="form-group col bg-light pb-2">
                        <label for="compareBtn">Elije hasta 4 ítems para compararlos.</label>
                        <asp:LinkButton ID="compareBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Comparar" OnClick="PerformCompare" />
                        <input id="selectedItemsInput" type="hidden" runat="server" />
                    </div>

                    <div class="form-group col">
                        <label for="cartBtn">¿Terminaste de agregar ítems? presiona en éste botón para realizar el checkout.</label>
                        <asp:LinkButton ID="cartBtn" runat="server" CssClass="btn btn-warning btn-sm"
                            Text="<i class='fa fa-tags' aria-hidden='true'></i> Sin elementos"
                            OnClick="GoToInvoice" />
                    </div>


                </div>
            </div>
            <!-- Galeria de elementos -->
            <div class="col-10">
                <div class="row">
                    <asp:Repeater ID="shopRepeater" runat="server" OnItemCommand="shopRepeater_ItemCommand">
                        <ItemTemplate>
                            <div class="col-2 border border bg-light rounded p-1 m-1">
                                <div class="row pb-1">
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
                </div>
            </div>
        </div>
    </div>
    <UCmkc:UCModalCompare runat="server" ID="ModalCompare" />
    <UCmkc:UCModalItemShop runat="server" ID="ModalItemShop" />
</asp:Content>
