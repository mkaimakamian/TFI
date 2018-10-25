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
    <asp:UpdatePanel ID="upShop" runat="server">
        <ContentTemplate>
            <div class="container-fluid pt-2">
                <%--<UCmkc:UCHeaderWeb runat="server" Label="Catálogo" Imgsource="~/Resources/shop01.svg" />--%>
                <UCmkc:UCItemShopFilter runat="server" ID="UCItemShopFilter" />

                <div class="row">
                    <!-- Comparar, adquirir y resumen -->
                    <div class="col-2 text-center">
                        <div class="row border rounded mt-1">

                            <div class="form-group col-12 bg-light pb-2">
                                <label for="compareBtn">Seleccioná hasta 4 ítems para compararlos.</label>
                                <asp:LinkButton ID="compareBtn" runat="server" CssClass="btn btn-success btn-sm" Text="<i class='fa fa-clone' aria-hidden='true'></i> Comparar" OnClick="PerformCompare" />
                                <input id="selectedItemsInput" type="hidden" runat="server" />
                            </div>

                            <!-- Visibilidad controlada por back -->
                            <div class="row" id="divLoggedShop" runat="server">
                                <div class="col-12">
                                    <div class="form-group col-12">
                                        <label for="cartBtn">
                                            ¿Terminaste de agregar?
                                             <br />
                                            ¡Pasemos al pago!</label>
                                        <asp:LinkButton ID="cartBtn" runat="server" CssClass="btn btn-warning btn-sm"
                                            Text="<i class='fa fa-tags' aria-hidden='true'></i> Adquirir"
                                            OnClick="GoToInvoice" />

                                    </div>
                                    <div class="form-group col-12">
                                        <hr class="mb-2 mt-0" />
                                        <label class="blockquote">Tu listado</label>
                                        <asp:Repeater ID="cartItemRepeater" runat="server" OnItemCommand="shopRepeater_ItemCommand">
                                            <ItemTemplate>
                                                <div class="row bg-light mb-1">
                                                    <div class="col-10 text-left">
                                                        <p class="m-0" style="font-size: 12px;" runat="server"><%#Eval("Name") %></p>
                                                    </div>
                                                    <div class="col-2">
                                                        <asp:LinkButton ID="btnDelete" runat="server" Text="<i class='fa fa-trash-o' aria-hidden='true'></i>" CommandName="RemoveItemCart" CommandArgument='<%# Eval("id") %>' />
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>

                                </div>
                            </div>
                            
                            <div class="row" id="divNotLogged" runat="server">
                                <div class="form-group col-12">
                                    <label for="loginBtn">¿No estás logueado?</label>
                                    <asp:LinkButton ID="loginBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-user' aria-hidden='true'></i> Ingresar :D" OnClick="LogIn" />
                                </div>
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
                                        <asp:ImageButton runat="server" src='<%# Eval("Image") %>' CssClass="img-thumbnail" CommandName="ShowDetail" CommandArgument='<%# Eval("id") %>' />
                                        <%--<img src="<%# Eval("Image") %>" class="img-thumbnail" />--%>

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
                                            <%--<asp:LinkButton ID="btnDetail" runat="server" CssClass="btn btn-primary btn-sm" Text="Detalle" CommandName="ShowDetail" CommandArgument='<%# Eval("id") %>' />--%>
                                        </div>

                                        <input type="checkbox" value="<%# Eval("Id") %>" onclick="AddToCompare(this.value)" />
                                        <small>Comparar</small>

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
