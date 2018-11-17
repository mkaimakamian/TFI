<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="register_action.aspx.cs" Inherits="Ubiquicity.register_action" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">

    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4 border border-success bg-light rounded p-3">
                <div class="row justify-content-center text-center pb-3">
                    <div class="col">
                        <img src="Resources/logo_azul.png" height="96" />
                    </div>
                </div>
                <h3>¡Gracias por registrarte!</h3>
                <blockquote class="blockquote">
                    <p class="mb-1 mt-4">
                        Solo tomará unos segundos activar tu cuenta.
                    </p>
                    <footer class="blockquote-footer">
                        Te estábamos esperando ;D.
                    </footer>
                </blockquote>

                <!-- Formulario -->
                <div id="divForm" runat="server" class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="activationCodeInput">
                                Código de activación
                            </label>
                            <input id="activationCodeInput" runat="server" class="form-control form-control-sm" maxlength="50" type="text" />
                        </div>
                        <asp:Button ID="btnApplyCode" runat="server" CssClass="btn btn-sm btn-success" OnClick="ApplyCode" Text="Confirmar" />
                    </div>
                </div>

                <!-- Mensaje de éxito -->
                <div id="divSuccessMessage" runat="server" class="row justify-content-center text-center" visible="false">
                    <div class="col">
                        <h3 class="text-success">¡Tu cuenta ha sido activada!</h3>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
            </div>
        </div>
    </div>
</asp:Content>
