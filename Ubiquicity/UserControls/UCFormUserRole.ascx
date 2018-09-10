<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormUserRole.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormUserRole" %>
<div class="modal-body">
    <div class="row justify-content-center">
        <div class="col-12">
            <asp:Label ID="lblUserName" runat="server" />
        </div>
        <div class="col-5 form-group">
            <label for="lstPermissionGranted">Obtenidos</label>
            <asp:ListBox ID="lstPermissionGranted" runat="server" CssClass="form-control" />
        </div>
        <div class="col-2 form-group my-3">
            <asp:Button ID="btnUngrant" runat="server" Text=">>" OnClick="btnUngrant_Click" CssClass="form-control"/>
            <asp:Button ID="btnGrant" runat="server" Text="<<" OnClick="btnGrant_Click" CssClass="form-control"/>
        </div>
        <div class="col-5 form-group">
            <label for="lstPermissionToGrant">A otorgar</label>
            <asp:ListBox ID="lstPermissionToGrant" runat="server" CssClass="form-control"/>
        </div>
    </div>
</div>