<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="language_manager.aspx.cs" Inherits="Ubiquicity.language" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    
    Agregar título!
    <UCmkc:UCcrudGrid runat="server" ID="UCcrudGrid" />

    <!-- Language form -->
    <div class="modal fade" id="ucModalLanguage" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <ucmkc:ucformlanguage runat="server" id="UCFormLanguage" />
                <div class="modal-footer">
                    <asp:Button ID="ucModalLanguage_btnAccept" runat="server" CssClass="btn btn-primary" Text="Aceptar" OnClick="ucModalLanguage_btnAcceptClick"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
