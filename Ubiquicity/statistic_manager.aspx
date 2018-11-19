<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="statistic_manager.aspx.cs" Inherits="Ubiquicity.statistic_manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <UCmkc:UCHeaderBackOffice runat="server" ID="UCHeaderBackOffice" Image="~/Resources/global.svg" Title="Reportes" Subtitle="En este apartado podrás..." Content="Generar reportes y analizar los datos." />

    <div class="container-fluid">
        <div class="row">
            <div class="col-5">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Ficha de opinión</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Encuestas</a>
                        <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Ventas</a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <asp:ListBox ID="bListSPoll" runat="server" Width="300"></asp:ListBox>
                        <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="ShowSPoll" />
                        
                    </div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <asp:ListBox ID="bListPoll" runat="server" Width="300"></asp:ListBox>
                        <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="ShowPoll" />
                    </div>
                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                        <asp:ListBox ID="bListSell" runat="server" Width="300"></asp:ListBox>
                        <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Aceptar" OnClick="ShowSell" />

                    </div>
                </div>
            </div>
            <div class="col-7">
                <div class="col-12">
                    <asp:Chart ID="Chart1" runat="server" Height="400px" Width="700px">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
        </div>
    </div>
    <%--<UCmkc:UCModalChart runat="server" id="UCModalChart" />--%>
</asp:Content>
