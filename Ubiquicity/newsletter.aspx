<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="newsletter.aspx.cs" Inherits="Ubiquicity.newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="container-fluid">
        <%--        <UCmkc:UCHeaderWeb runat="server" Label="Novedades" Imgsource="~/Resources/news01.svg" />--%>
        <div class="row pt-2">
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
                <div class="row">
                    <asp:Repeater ID="newsRepeater" runat="server" OnItemCommand="newsRepeater_ItemCommand">
                        <ItemTemplate>
                            <div class="border rounded bg-light p-1 m-1" style="width: 240px;">
                                <asp:ImageButton runat="server" src='<%# Eval("Image") %>' CssClass="img-thumbnail" CommandName="ShowDetail" CommandArgument='<%# Eval("id") %>' />
                                <p class="mb-1 mb-2 text-truncate" style="font-size: 14px;">
                                    <i class="fa fa-calendar" aria-hidden="true"></i> Publicado el <%# Convert.ToDateTime(Eval("Created")).ToString("yyyy-MM-dd") %>
                                </p>
                                <h5 class="text-truncate"><%# Eval("Title") %></h5>

                                <blockquote class="blockquote">
                                    <p class="mb-1 mt-2 text-truncate" style="font-size: 14px;">
                                        <%# Eval("Resume") %>
                                    </p>
                                    <footer class="blockquote-footer">
                                        <%# Eval("Category.Name") %>
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
