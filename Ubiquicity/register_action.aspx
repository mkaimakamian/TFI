<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="register_action.aspx.cs" Inherits="Ubiquicity.register_action" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <p>¡Hey!... hola de nuevo :D</p>
    <div class="form-group">
        <label for="activationCodeInput">Código de activación</label>
        <input id="activationCodeInput" runat="server" type="text" class="form-control"  placeholder="Ingresa el código de activación">
        <asp:Button ID="btnApplyCode" runat="server" CssClass="btn btn-primary" OnClick="btnApplyCode_Click" Text="Activar cuenta"/>
    </div>
</asp:Content>
