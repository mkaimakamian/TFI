<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormRanking.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormRanking" %>
<div class="modal-body">
    <div class="row justify-content-center">
        <div class="form-group col-12">
            <label for="radioOptionList">¿Qué te pareció el recurso? ¿te gustó? ¡adelante, a calificar!</label>

            <asp:RadioButtonList ID="radioOptionList" runat="server">
                <asp:ListItem Text='<img src="../Resources/star.svg" alt="1" />' Value="1" />
                <asp:ListItem Text='<img src="../Resources/star.svg" alt="2"/>' Value="2" />
                <asp:ListItem Text='<img src="../Resources/star.svg" alt="3"/>' Value="3" Selected="True" />
                <asp:ListItem Text='<img src="../Resources/star.svg" alt="4"/>' Value="4" />
                <asp:ListItem Text='<img src="../Resources/star.svg" alt="5"/>' Value="5" />
            </asp:RadioButtonList>
            <%--<input id="nameInput" runat="server" type="text" class="form-control form-control-sm">--%>
        </div>
    </div>
</div>
