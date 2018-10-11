<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="password_reset.aspx.cs" Inherits="Ubiquicity.password_reset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="row">
        <div class="col-12">
            <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/lock.svg" Title="Resetear contraseña" Subtitle="En este apartado podrás..." Content="Cambiar la contraseña." />
        </div>
    </div>
    <div class="row">
        <div class="col-12">

            <div id="passwordControls" runat="server" class="form-row table-bordered rounded col-2">
                Por favor, ingresá el nuevo password.
              <div class="form-group col-md-12">
                  <label for="passwordInput">Password</label>
                  <input id="passwordInput" runat="server" type="password" class="form-control form-control-sm" placeholder="Ingresá tu password">
              </div>
                <div class="form-group col-md-12">
                    <label for="passwordConfirmInput">Confirmar password</label>
                    <input id="passwordVerificationInput" runat="server" type="password" class="form-control form-control-sm" placeholder="Reingresá tu password">
                </div>
                <div class="form-group col-md-12">
                    <asp:Button ID="btnPassword" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnPassword_Click" Text="Cambiar" />
                </div>
            </div>
            <div>
            </div>
        </div>

    </div>
</asp:Content>
