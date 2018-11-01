<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="newsletter.aspx.cs" Inherits="Ubiquicity.newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="container-fluid">
        <UCmkc:UCHeaderWeb runat="server" Label="Novedades" Imgsource="~/Resources/news01.svg" />
        <div class="row">
            <div class="col-2">
                <div class="card bg-light mb-3" style="max-width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Filtros</h5>
                        <p class="card-text">Utilizá los filtros para acotar la búsqueda.</p>
                        <hr />
                        <h6 class="card-title">Categoría</h6>
                        <asp:CheckBoxList ID="checksCategoryInput" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeNewsCategory" />
                        <hr />
                        <h6 class="card-title">Fecha</h6>
                        <p class="card-text">Muy pronto :D</p>
                    </div>
                </div>
            </div>

            <div class="col-10">
                <%--              <div class="card-deck">
                    <asp:Repeater ID="newsRepeater" runat="server" OnItemCommand="newsRepeater_ItemCommand">
                        <ItemTemplate>
                            <div class="col-4">
                                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                                    <div class="card-body d-flex flex-column align-items-start">
                                        <strong class="d-inline-block mb-2 mkcLetraNaranja"><%# Eval("Category.Name") %></strong>
                                        <h5 class="mb-0">
                                            <a class="text-dark" href="#"><%# Eval("Title") %></a>
                                        </h5>
                                        <div class="mb-1 text-muted"><%# Eval("Created") %></div>
                                        <p class="card-text mb-auto"><%# Eval("Resume").ToString().Substring(0, 50) %></p>
                                        <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Leer más" CommandArgument='<%# Eval("id") %>' />
                                    </div>
                                    <img class="card-img-right flex-auto d-none d-md-block"
                                        data-src="holder.js/200x250?theme=thumb" alt="Thumbnail [200x250]" style="width: 150px; height: 150px;" src="<%# Eval("Image") %>" data-holder-rendered="true">
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>--%>
                <div class="row">
                    <asp:Repeater ID="newsRepeater" runat="server" OnItemCommand="newsRepeater_ItemCommand">                    
                        <ItemTemplate>
                            <div class="border rounded bg-light p-1 m-1" style="width: 240px;">
                                <asp:ImageButton runat="server" src='<%# Eval("Image") %>' CssClass="img-thumbnail" CommandName="ShowDetail" CommandArgument='<%# Eval("id") %>' />
                                <h5><%# Eval("Title") %></h5>
                                <blockquote class="blockquote">
                                    <p class="mb-1 mt-2 text-truncate" style="font-size: 14px;">
                                        <%# Eval("Resume") %>
                                    </p>
                                    <footer class="blockquote-footer">
                                        <%# Eval("Category.Name") %> - <%# Eval("Created") %>
                                    </footer>
                                </blockquote>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <UCmkc:UCModalNews runat="server" ID="ModalNewsletter" />
</asp:Content>
