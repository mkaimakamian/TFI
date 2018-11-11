<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCPanelPoll.ascx.cs" Inherits="Ubiquicity.UserControls.UCPanelPoll" %>
<div class="container-fluid">

    <div class="row" id="divPoll" runat="server">
        <div runat="server" class="col">
            <asp:Repeater ID="pollRepeater" runat="server" OnItemCreated="PopulateOptions">
                <ItemTemplate>
                    <h5 itemid="<%# Eval("Id") %>"><%# Eval("Question") %></h5>
                    <asp:HiddenField ID="lblQuestion" runat="server" Value='<%# Eval("Id") %>' />
                    <asp:RadioButtonList ID="radioOptionList" runat="server" RepeatDirection="Horizontal">
                    </asp:RadioButtonList>
                </ItemTemplate>
            </asp:Repeater>
            <div class="form-group text-center">
                <asp:LinkButton ID="btnPoll" runat="server" CssClass="btn btn-primary btn-sm" Text="Contestar" OnClick="SubmitAnswer" />
            </div>
        </div>
    </div>
    <div id="divPollStatistics" runat="server" class="row justify-content-center text-center" visible="false">
        <div class="col">
            <h3 class="text-success">¡Gracias por participar!</h3>
        </div>
    </div>
</div>
