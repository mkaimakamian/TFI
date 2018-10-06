<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="newsletter.aspx.cs" Inherits="Ubiquicity.newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="row">
        <div class="form-group col-2">
            <label for="checksCategoryInput">Categoría</label>
            <asp:CheckBoxList ID="checksCategoryInput" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeNewsCategory" />
        </div>
    </div>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <asp:Repeater ID="newsRepeater" runat="server" OnItemCommand="newsRepeater_ItemCommand">
                    <ItemTemplate>
                        <%--                <div class="card" style="width: 18rem; margin: 4px">
                    <div class="card-body">
                        <img class="card-img-top" src="<%# Eval("Image") %>">
                        <h4 class="card-title"><%# Eval("Title") %></h4>
                        <h6 class="card-subtitle mb-2 text-muted"><%# Eval("Category.Name") %></h6>
                        <p class="card-text"><%# Eval("Resume").ToString().Substring(0, 50) %></p>
                        <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Leer más" CommandArgument='<%# Eval("id") %>' />
                        <h6 class="card-subtitle mb-2 text-muted"><%# Eval("Created") %></h6>                    </div>
                </div>--%>

                        <div class="col-md-4">
                            <div class="card flex-md-row mb-4 box-shadow h-md-250">
                                <div class="card-body d-flex flex-column align-items-start">
                                    <strong class="d-inline-block mb-2 mkcLetraNaranja"><%# Eval("Category.Name") %></strong>
                                    <h5 class="mb-0">
                                        <a class="text-dark" href="#"><%# Eval("Title") %></a>
                                    </h5>
                                    <div class="mb-1 text-muted"><%# Eval("Created") %></div>
                                    <p class="card-text mb-auto"><%# Eval("Resume").ToString().Substring(0, 50) %></p>
                                    <a href="#">Leer más</a>
                                </div>
                                <img class="card-img-right flex-auto d-none d-md-block"
                                    data-src="holder.js/200x250?theme=thumb" alt="Thumbnail [200x250]" style="width: 150px; height: 150px;" src="<%# Eval("Image") %>" data-holder-rendered="true">
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>




    <UCmkc:UCModalNews runat="server" ID="ModalNewsletter" />
</asp:Content>
