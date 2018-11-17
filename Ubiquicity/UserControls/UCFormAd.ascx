<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormAd.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormAd" %>
<div class="modal-body">
    <div class="row">
        <div class="form-group col">
            <label for="nameInput">Url</label>
            <input id="urlInput" runat="server" type="text" class="form-control form-control-sm" maxlength="250">
        </div>
    </div>
    <div class="row">
        <div class="form-group col">
            <label id="lblResource" runat="server" for="resourceInput">Recurso</label>
            <asp:FileUpload ID="resourceInput" runat="server"
                class="form-control form-control-sm btn-choose" />
        </div>
    </div>
  
</div>
