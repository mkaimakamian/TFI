﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCcrudGrid.ascx.cs" Inherits="Ubiquicity.UserControls.UCcrudGrid" %>
<asp:UpdatePanel ID="upUCCrudGrid" runat="server">
    <ContentTemplate>
        <div id="divBtnNew" runat="server" class="row border p-1 m-1 rounded">
            <button id="btnNewItem" runat="server" class="btn btn-primary btn-sm" onserverclick="btnNewItem_Click">
                <i class="fa fa-plus" aria-hidden="true"></i> Crear nuevo</button>
        </div>
        <div class="row border p-1 m-1 rounded">
            <asp:GridView ID="gvItem" runat="server" AllowPaging="true" PageSize="10" OnRowDataBound="gvItem_RowDataBound" OnPageIndexChanging="gvItem_PageIndexChanging"
                OnRowCommand="gvItem_OnRowCommand" class="table table-bordered bs-table table-striped table-sm mkcGridview">
                <Columns>
                    <asp:TemplateField ShowHeader="False" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm" CausesValidation="false" CommandName="DeleteItem" Text="<i class='fa fa-minus' aria-hidden='true'></i> Eliminar" CommandArgument='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-warning btn-sm" CausesValidation="false" CommandName="EditItem" Text="<i class='fa fa-pencil-square-o' aria-hidden='true'></i> Editar" CommandArgument='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" Visible="false" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnGenericAction" runat="server" CssClass="btn btn-primary btn-sm" CausesValidation="false" CommandName="GenericActionItem" CommandArgument='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" Visible="false" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <img src="<%# EvalProperty("Image") %>" width="96" height="96" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
