<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCPanelPoll.ascx.cs" Inherits="Ubiquicity.UserControls.UCPanelPoll" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%--<div class="container-fluid">--%>

    <div class="row" id="divPoll" runat="server" visible="false">
        <div runat="server" class="col border rounded mt-1" style="background:#cee1ff">
            <p id="txtPollTitle" runat="server"></p>
            <asp:Repeater ID="pollRepeater" runat="server" OnItemCreated="PopulateOptions">
                <ItemTemplate>
                    <font color="Blue"><%# Eval("Question") %></font> 
                    <asp:HiddenField ID="lblQuestion" runat="server" Value='<%# Eval("Id") %>' />
                    <asp:RadioButtonList ID="radioOptionList" runat="server" RepeatDirection="Vertical">
                    </asp:RadioButtonList>
                </ItemTemplate>
            </asp:Repeater>
            <div class="form-group text-center">
                <asp:LinkButton ID="btnPoll" runat="server" CssClass="btn btn-primary btn-sm" Text="Contestar" OnClick="SubmitAnswer" />
            </div>
        </div>
    </div>
    <!-- CHART -->
    <div id="divPollStatistics" runat="server" class="row justify-content-center text-center" visible="false">
        <div class="col border rounded mt-1">
            <asp:Chart ID="Chart1" runat="server">
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </div>
<%--</div>--%>
