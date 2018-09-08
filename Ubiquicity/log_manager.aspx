<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="log_manager.aspx.cs" Inherits="Ubiquicity.logManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <%--<asp:GridView ID="gvLogEntry" runat="server" class="table table-bordered bs-table table-striped table-sm" />--%>
    <UCmkc:UCcrudGrid ID="UCcrudGrid" runat="server" />
</asp:Content>
