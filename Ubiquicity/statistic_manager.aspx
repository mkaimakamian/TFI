<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="statistic_manager.aspx.cs" Inherits="Ubiquicity.statistic_manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/global.svg" Title="Reportes" Subtitle="En este apartado podrás..." Content="Generar reportes y analizar los datos." />

    <div class="container-fluid">

        <div class="row">
            <div class="col-3">
                <div class="row">
                    <div class="form-group col">
                        <label for="dropReportType">Tipo de reportes</label>
                        <asp:DropDownList ID="dropReportType" runat="server" Font-Size="Small" Width="300px"
                            CssClass="dropdown-toggle form-control form-control-sm" OnSelectedIndexChanged="Listreports" AutoPostBack="True">
                            <asp:ListItem Value="0">::: Reportes :::</asp:ListItem>
                            <asp:ListItem Value="1">Opinión / Satisfacción</asp:ListItem>
                            <asp:ListItem Value="2">Encuestas generales</asp:ListItem>
                            <asp:ListItem Value="3">Ventas</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col">
                        <label for="lstReports">Reportes</label>
                        <asp:ListBox ID="lstReports" runat="server" Width="300" CssClass="form-control"></asp:ListBox>
                        <asp:Button runat="server" CssClass="btn btn-primary btn-sm mt-2" Text="Aceptar" OnClick="ShowReport" />
                    </div>
                </div>
            </div>

            <div class="col">
                <asp:Chart ID="Chart1" runat="server" Height="400px" Width="700px">
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
    </div>
</asp:Content>
