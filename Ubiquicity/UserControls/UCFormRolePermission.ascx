<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormRolePermission.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormRolePermission" %>
<div class="modal-body">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <div class="row justify-content-center">
        <div class="form-group col-12">
            <label for="roleNameInput">Nombre</label>
            <input id="roleNameInput" runat="server" type="text" class="form-control"  placeholder="Ingresa el nombre">
        </div>
        <div class="form-group col-12">
            <label for="roleDescriptionInput">Descripción</label>
            <input id="roleDescriptionInput" runat="server" type="text" class="form-control"  placeholder="Ingresa la descripcióno">
        </div>
            <div class="form-group col-5">
                <label for="lstPermissionGranted">Obtenidos</label>
                <asp:ListBox ID="lstPermissionGranted" runat="server" CssClass="form-control" Width="300" Height="150"/>
            </div>
           <div class="col-2 form-group my-3">
                <asp:Button ID="btnUngrant" runat="server" Text=">>" OnClick="btnUngrant_Click" CssClass="form-control btn-sm"/>
                <asp:Button ID="btnGrant" runat="server" Text="<<" OnClick="btnGrant_Click" CssClass="form-control btn-sm"/>
            </div>
            <div class="col-5 form-group">
                <label for="lstPermissionToGrant">A otorgar</label>
                <asp:ListBox ID="lstPermissionToGrant" runat="server" CssClass="form-control" Width="300" Height="150"/>
            </div>
    </div>
</ContentTemplate>
</asp:UpdatePanel>
</div>
