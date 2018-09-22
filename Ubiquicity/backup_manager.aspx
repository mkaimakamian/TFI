<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="backup_manager.aspx.cs" Inherits="Ubiquicity.backup_manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/note.svg" Title="Gestión de respaldo" Subtitle="En este apartado podrás..." Content="Generar copias de respaldo del sistema y restaurarlas." />

    <UCmkc:UCcrudGrid runat="server" id="UCcrudGrid" />

</asp:Content>
