<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="newsletter.aspx.cs" Inherits="Ubiquicity.newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="row">
        <div class="form-group col-2">
            <label for="checksCategoryInput">Categoría</label>

        <asp:CheckBoxList ID="checksCategoryInput" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeNewsCategory"/>
            <%--<asp:DropDownList ID="dropCategoryInput" runat="server"
                cclass="btn btn-secondary dropdown-toggle form-control form-control-sm"
                OnSelectedIndexChanged="ChangeNewsCategory" AutoPostBack="True" />--%>
        </div>
    </div>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <div class="row">
        <asp:Repeater ID="newsRepeater" runat="server" OnItemCommand="newsRepeater_ItemCommand">
            <ItemTemplate>
                <div class="card" style="width: 18rem; margin: 4px">
                    <div class="card-body">
                        <img class="card-img-top" src="<%# Eval("Image") %>">
                        <h4 class="card-title"><%# Eval("Title") %></h4>
                        <h6 class="card-subtitle mb-2 text-muted"><%# Eval("Category.Name") %></h6>
                        <p class="card-text"><%# Eval("Resume").ToString().Substring(0, 50) %></p>
                        <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" Text="Leer más" CommandArgument='<%# Eval("id") %>' />
                        <h6 class="card-subtitle mb-2 text-muted"><%# Eval("Created") %></h6>                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>




    <UCmkc:UCModalNews runat="server" ID="ModalNewsletter" />
</asp:Content>
