<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="newsletter.aspx.cs" Inherits="Ubiquicity.newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="row">
        <asp:Repeater ID="newsRepeater" runat="server" OnItemCommand="newsRepeater_ItemCommand">
            <ItemTemplate>
                <div class="card" style="width: 18rem; margin:4px">
                    <div class="card-body">
                        <h4 class="card-title"><%# Eval("Title") %></h4>
                        <h6 class="card-subtitle mb-2 text-muted"><%# Eval("Category.Name") %></h6>
                        <p class="card-text"><%# Eval("Resume").ToString().Substring(0, 50) %></p>
                        <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Leer más" CommandArgument='<%# Eval("id") %>'/>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <UCmkc:UCModalNews runat="server" ID="ModalNewsletter" />
</asp:Content>
