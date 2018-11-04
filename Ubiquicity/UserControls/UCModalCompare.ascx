<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCModalCompare.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalCompare" %>
<div class="modal fade" id="ucModalCompare" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <asp:UpdatePanel ID="upCompare" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" runat="server" id="ucModalNewsLabel">xxx</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="ucModalNewsMessage" runat="server">


        <%--<div class="row">
            <div class="col-10">--%>
                <div class="card-deck">
                    <asp:Repeater ID="compareRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card" style="width: 14rem; margin: 4px">
                                <img class="card-img-top" src="<%# Eval("Image") %>">
                                <div class="card-body">
                                    <h4 class="card-title"><%# Eval("Name") %></h4>
                                    <h6 class="card-subtitle mb-2 text-muted"><%# Eval("Category.Name") %></h6>
                                    <h5 class="card-subtitle mb-2 mkcLetraNaranja"><i class="fa fa-tags"></i> $AR <%# Eval("Price") %></h5>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
 <%--           </div>
        </div>--%>





            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</div>
