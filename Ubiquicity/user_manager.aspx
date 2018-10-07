<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="user_manager.aspx.cs" Inherits="Ubiquicity.user" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
 
<UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/user_manager01.svg" Title="Gestión de usuarios" Subtitle="En este apartado podrás..." Content="Crear nuevos usuarios, editar sus datos y eliminar registros." />
<UCmkc:UCcrudGrid runat="server" id="UCcrudGrid" />

    <!-- Register form -->
    <div class="modal fade" id="ucModalNewMember" tabindex="-1" role="dialog" aria-labelledby="Registro" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <ucmkc:ucformnewmember runat="server" ID="UCFormNewMember" />
                <div class="modal-footer">
                    <asp:Button ID="ucModalNewMember_btnAccept" runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="AccepCreateOrModify"/>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
