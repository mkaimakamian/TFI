<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="Ubiquicity.shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="row">
        <asp:Repeater ID="shopRepeater" runat="server">
            <ItemTemplate>
                <div class="card" style="width: 14rem; margin: 4px">
                    <img class="card-img-top" src="<%# Eval("Image") %>">
                    <div class="card-body">
                        <h4 class="card-title"><%# Eval("Name") %></h4>
                        <h6 class="card-subtitle mb-2 text-muted">Categoría de producto</h6>
                        <p class="card-text"><%# Eval("Description") %></p>
                        <a href="#" class="card-link">Card link</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
