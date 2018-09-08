<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormUserRole.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormUserRole" %>
<div class="modal-body">
 <%--   <div class="form-group">
    <label for="userDrop">Nombre</label>
    <asp:DropDownList ID="userDrop" runat="server"/>
    </div>--%><asp:Label ID="lblUserName" runat="server"/>
    
    <div class="form-group">
        <label for="lstPermissionGranted">Obtenidos</label>
        <asp:ListBox ID="lstPermissionGranted" runat="server"/>
    </div>
    <asp:Button ID="btnUngrant" runat="server" Text=">>" OnClick="btnUngrant_Click" />
    <asp:Button ID="btnGrant" runat="server" Text="<<" OnClick="btnGrant_Click" />
    <div class="form-group">
        <label for="lstPermissionToGrant">A otorgar</label>
        <asp:ListBox ID="lstPermissionToGrant" runat="server"/>
    </div>
</div>