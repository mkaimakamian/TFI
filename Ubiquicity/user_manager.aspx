<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="user_manager.aspx.cs" Inherits="Ubiquicity.user" %>

<%@ Register Src="~/UserControls/UCcrudGrid.ascx" TagPrefix="UCmkc" TagName="UCcrudGrid" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    
<%--    <div class="row bg-secondary">
        <div class="col-1"><img src="Resources/id-card.svg" width="32" height="32" /> </div>
        <div class="col-11">Gestión de usuarios</div> 
    </div>--%>
<span class="border p-1 m-1 rounded">Se supone que esto tiene un borde</span>

    <UCmkc:UCcrudGrid runat="server" id="UCcrudGrid" />

    <!-- Register form -->
    <div class="modal fade" id="ucModalNewMember" tabindex="-1" role="dialog" aria-labelledby="Registro" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <ucmkc:ucformnewmember runat="server" ID="UCFormNewMember" />
                <div class="modal-footer">
                    <asp:Button ID="ucModalNewMember_btnAccept" runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="ucModalNewMember_btnAcceptClick"/>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
