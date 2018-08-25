<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCModalMessageBox.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalMessageBox" %>
<!-- Creado por Mariano Kaimakamian Carrau -->
<div class="modal fade" id="ucModalMessageBox" tabindex="-1" role="dialog" aria-labelledby="ucModalMessageBoxLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>