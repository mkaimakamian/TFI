<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="unsuscribe_action.aspx.cs" Inherits="Ubiquicity.unsuscribe_action" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4 border border-danger bg-light rounded p-3">
                <div class="row justify-content-center text-center pb-3">
                    <div class="col">
                        <img src="Resources/logo_azul.png" height="96" />
                    </div>
                </div>
                <h3>¡Oh!... te vas :'(</h3>
                <blockquote class="blockquote">
                    <p class="mb-1 mt-4">
                        Gracias por haber confiado en nosotros y esperamos que regreses pronto; a lo mejor te interese formar parte activa de la comunidad... registrate ;D.
                    </p>
                    <footer class="blockquote-footer">
                        Te vamos a extrañar mucho.
                    </footer>
                </blockquote>

                <div id="divForm" runat="server" class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="mailInput">
                                Correo electrónico
                            </label>
                            <input id="mailInput" runat="server" class="form-control form-control-sm" type="email" />
                        </div>
                        <div class="checkbox">
                            <label>
                                <input id="chkConfirm" runat="server" type="checkbox" />
                                Sí, quiero desuscribirme
                            </label>
                        </div>
                        <asp:Button ID="btnUnsuscribe" runat="server" CssClass="btn btn-sm btn-danger" OnClick="PerformUnsuscribe" Text="Confirmar" />
                    </div>
                </div>

                <!-- Mensaje de éxito -->
                <div id="divSuccessMessage" runat="server" class="row justify-content-center text-center" visible="false">
                    <div class="col">
                        <h3 class="text-success">¡Has sido desuscripto!</h3>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
            </div>
        </div>
    </div>
</asp:Content>
