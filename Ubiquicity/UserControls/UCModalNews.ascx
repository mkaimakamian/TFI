<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCModalNews.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalNews" %>
<div class="modal fade" id="ucModalNews" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" runat="server" id="ucModalNewsLabel">xxx</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="ucModalNewsMessage" runat="server">
                <%--<img id="UCImage" runat="server" class="pt-1" height="128" width="128" />--%>
                XXXXXXX
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
