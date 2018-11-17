<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCModalSearch.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalSearch" %>

<div class="modal fade" id="ucModalSearch" tabindex="-1" role="dialog" aria-labelledby="ucModalSearchLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" runat="server" id="ucModalSearchLabel">Resultado de la búsqueda</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="ucModalSearchMessage" runat="server">

                <div class="row" id="resultDiv" runat="server" visible="false">
                    <div class="col-12">
                        <asp:Repeater ID="searchRepeater" runat="server">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-12">
                                        <a href="<%# Page.ResolveUrl(Eval("Url")+"") %>"><%# Eval("Description") %></a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="row" id="noResultDiv" runat="server" visible="false">
                    <div class="col-12">
                        No se han encontrado resultados para la búsqueda :(
                    </div>
                </div>





            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
