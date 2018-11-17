<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="recovery_action.aspx.cs" Inherits="Ubiquicity.recovery_action" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <%--   <div class="row">
        <div class="col-4">
        </div>
        <div id="passwordControls" runat="server" class="form-row table-bordered rounded col-2">
                Por favor, ingresá el nuevo password.
              <div class="form-group col-md-12">
                <label for="passwordInput">Password</label>
                <input id="passwordInput" runat="server" type="password" class="form-control form-control-sm"  placeholder="Ingresá tu password">
              </div>
              <div class="form-group col-md-12">
                <label for="passwordConfirmInput">Confirmar password</label>
                <input id="passwordVerificationInput" runat="server" type="password" class="form-control form-control-sm" placeholder="Reingresá tu password">
              </div>
              <div class="form-group col-md-12">
                <asp:Button ID="btnPassword" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnPassword_Click" Text="Cambiar"/>
              </div>     
           </div>
        <div>
        </div>
    </div>
    <br />--%>

    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4 border border-secondary bg-light rounded p-3">
                <div class="row justify-content-center text-center pb-3">
                    <div class="col">
                        <img src="Resources/logo_azul.png" height="96" />
                    </div>
                </div>
                <h3>Tiempo de cambiar</h3>
                <blockquote class="blockquote">
                    <p class="mb-1 mt-4">
                        Solo tomará unos segundos cambiar tu clave.
                    </p>
                    <footer class="blockquote-footer">
                        ¡No te desesperes!.
                    </footer>
                </blockquote>

                <!-- Formulario -->
                <div id="divForm" runat="server" class="row">
                    <div class="col">

                        <div class="form-group col-md-12">
                            <label for="passwordInput">Password</label>
                            <input id="passwordInput" runat="server" type="password" class="form-control form-control-sm" 
                                placeholder="Ingresá tu password" maxlength="50" mixlength="6">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="passwordConfirmInput">Confirmar password</label>
                            <input id="passwordVerificationInput" runat="server" type="password" 
                                class="form-control form-control-sm" placeholder="Reingresá tu password"
                                maxlength="50" mixlength="6">
                        </div>
                        <div class="form-group col-md-12">
                            <asp:Button ID="btnPassword" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnPassword_Click" Text="Cambiar" />
                        </div>

                    </div>
                </div>

                <!-- Mensaje de éxito -->
                <div id="divSuccessMessage" runat="server" class="row justify-content-center text-center" visible="false">
                    <div class="col">
                        <h3 class="text-success">¡Tu password ha sido cambiado!</h3>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
            </div>
        </div>
    </div>
</asp:Content>
