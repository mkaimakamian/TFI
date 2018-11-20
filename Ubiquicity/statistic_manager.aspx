<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="statistic_manager.aspx.cs" Inherits="Ubiquicity.statistic_manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/global.svg" Title="Reportes" Subtitle="En este apartado podrás..." Content="Generar reportes y analizar los datos." />

    <div class="container-fluid">
        <asp:UpdatePanel ID="upUCCrudGrid" runat="server">
    <ContentTemplate>
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
                        <asp:ListBox ID="lstReports" runat="server" Width="300" 
                            CssClass="form-control" OnSelectedIndexChanged="SelectReport" AutoPostBack="True"></asp:ListBox>
                    </div>
                </div>

                <div class="row" runat="server" id="divDates" visible="false">
                    <div class="col-12">
                        <label >Períodos</label>
                    </div>
                    <div class="col" runat="server" id="divMonth">
                        <asp:DropDownList ID="dropMonth" CssClass="dropdown-toggle form-control form-control-sm" Font-Size="Small" runat="server">
                            <asp:ListItem Value="1">Enero</asp:ListItem>
                            <asp:ListItem Value="2">Febrero</asp:ListItem>
                            <asp:ListItem Value="3">Marzo</asp:ListItem>
                            <asp:ListItem Value="4">Abril</asp:ListItem>
                            <asp:ListItem Value="5">Mayo</asp:ListItem>
                            <asp:ListItem Value="6">Junio</asp:ListItem>
                            <asp:ListItem Value="7">Julio</asp:ListItem>
                            <asp:ListItem Value="8">Agosto</asp:ListItem>
                            <asp:ListItem Value="9">Septiembre</asp:ListItem>
                            <asp:ListItem Value="10">Octubre</asp:ListItem>
                            <asp:ListItem Value="11">Noviembre</asp:ListItem>
                            <asp:ListItem Value="12">Diciembre</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col">
                        <asp:DropDownList ID="dropYear" CssClass="dropdown-toggle form-control form-control-sm" Font-Size="Small" runat="server">
                            <asp:ListItem Value="2017">2017</asp:ListItem>
                            <asp:ListItem Value="2018">2018</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:Button runat="server" CssClass="btn btn-primary btn-sm mt-3" Text="Aceptar" OnClick="ShowReport" />
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
    </ContentTemplate>
            </asp:UpdatePanel>
    </div>
</asp:Content>
