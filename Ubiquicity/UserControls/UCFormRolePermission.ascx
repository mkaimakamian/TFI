﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormRolePermission.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormRolePermission" %>
<div class="modal-body">
    <div class="form-group">
    <label for="rolNameInput">Nombre</label>
    <input id="rolNameInput" runat="server" type="text" class="form-control"  placeholder="Ingresa el nombre">
    </div>
    <div class="form-group">
    <label for="rolDescriptionInput">Descripción</label>
    <input id="rolDescriptionInput" runat="server" type="text" class="form-control"  placeholder="Ingresa la descripcióno">
    </div>
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
