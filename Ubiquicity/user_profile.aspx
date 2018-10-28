<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="user_profile.aspx.cs" Inherits="Ubiquicity.user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">

    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/backup_manager01.svg" Title="Perfil de usuario" Subtitle="En este apartado podrás..." Content="Administrar los datos de tu cuenta y conocer tus movimientos." />
    
    <UCmkc:UCHeaderBackOffice runat="server"  Content="Estado de cuenta"/>
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <UCmkc:UCHeaderBackOffice runat="server"  Content="Tus productos adquiridos"/>
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGridTracking" />



    <%--<div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-3">
            </div>
            <div class="col-md-6 border border-success bg-light rounded p-3">
                <div class="row justify-content-center text-center pb-3">
                    <div class="col">
                        <img src="Resources/logo_azul.png" height="96" />
                    </div>
                </div>
                    <h3 class="justify-content-center text-center">¡La compra finalizó con éxito!</h3>
                <blockquote class="blockquote">
                    <p class="mb-1 mt-4">
                        Gracias por haber adquirido uno de nuestros producto ;D... te dejamos una breve encuesta para que nos hagas saber qué tal fue el proceso de compra.
                    </p>
                    <footer class="blockquote-footer">
                        Sólo tomará unos segundos.
                    </footer>
                </blockquote>

                <!-- Mensaje de éxito -->
                <div id="divSuccessMessage" runat="server" class="row justify-content-center text-center" visible="false">
                    <div class="col">
                        <h3 class="text-success">¡Has sido desuscripto!</h3>
                    </div>
                </div>

            </div>
            <div class="col-md-3">
            </div>
        </div>
    </div>  --%>
</asp:Content>
