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
        <div class="row">
            <div class="col-2">
                <div class="card bg-light mb-3" style="max-width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Filtros</h5>
                        <p class="card-text">Utilizá los filtros para acotar la búsqueda.</p>
                        <hr />
                        <h6 class="card-title">Categoría</h6>

                        <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Comparar" OnClick="PerformCompare" />
                        <input id="selectedItemsInput" type="hidden" runat="server" />
                        <hr />
                    </div>
                </div>
            </div>

            <div class="col-10">
                <div class="card-deck">
                    <asp:Repeater ID="shopRepeater" runat="server">
                        <ItemTemplate>
                            <%--<div class="card" style="width: 14rem; margin: 4px">
                                <button id="<%# Eval("Id") %>" type="button" class="btn btn-primary" data-toggle="button"
                                    onclick="AddToCompare(this.id)">
                                    Comparar</button>
                                <img class="card-img-top" src="<%# Eval("Image") %>">
                                <div class="card-body">
                                    <h4 class="card-title"><%# Eval("Name") %></h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Categoría de producto</h6>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                    <a href="#" class="card-link">Card link</a>
                                </div>
                            </div>--%>

                            <div class="card" style="width: 18rem;">
                                <div class="card-body justify-content-center text-center" style="padding-bottom: 1px;">
                                    <h5 class="card-title"><%# Eval("Name") %></h5>
                                    <%--<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>--%>
                                    <img src="<%# Eval("Image") %>" class="rounded-circle" width="128" height="128" />
                                    <p class="card-text text-truncate"><%# Eval("Description") %></p>
                                    <hr />
                                    $$$
                                    <hr />
                                    <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Adquirir"/>
                                    <%--<span class="badge badge-pill badge-info">Categoría</span>--%>
                                <div class="row text-left " style="padding-top: 20px;">
                                    <div class="col">
                                        <input type="checkbox" value="<%# Eval("Id") %>" onclick="AddToCompare(this.value)" />Comparar
                                    </div>
                                </div>
                                </div>
                                
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <UCmkc:UCModalCompare runat="server" ID="ModalCompare" />
</asp:Content>
