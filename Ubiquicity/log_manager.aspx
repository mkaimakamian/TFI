<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="log_manager.aspx.cs" Inherits="Ubiquicity.logManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">

    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/log.svg" Title="Bitácora" Subtitle="En este apartado podrás..." Content="Realizar auditoría de los eventos que el sistema registró."/>
    <UCmkc:UCcrudGrid ID="UCcrudGrid" runat="server" />
</asp:Content>
