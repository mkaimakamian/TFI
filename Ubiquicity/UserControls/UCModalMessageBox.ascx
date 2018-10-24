<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCModalMessageBox.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalMessageBox" %>

<div class="modal fade" id="ucModalMessageBox" tabindex="-1" role="dialog" aria-labelledby="ucModalMessageBoxLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <asp:UpdatePanel ID="upModalMessageBox" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-header">
                        <h5 class="modal-title" runat="server" id="ucModalMessageBoxLabel">xxx</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="ucModalMessageBoxMessage" runat="server">
                        XXXXXXX
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnMainAction" runat="server" CssClass="btn btn-primary btn-sm" Text="xxx" OnClick="btnMainAction_Click" Visible="false" />
                        <asp:Button ID="btnSecondAction" runat="server" CssClass="btn btn-primary btn-sm" Text="xxx" OnClick="btnSecondAction_Click" Visible=" false" />
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
