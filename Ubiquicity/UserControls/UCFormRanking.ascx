<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormRanking.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormRanking" %>
<div class="modal-body">
    <div class="row justify-content-center">
        <div class="form-group col-12">
            <label for="radioOptionList">¿Qué te pareció el recurso? ¿te gustó? ¡adelante, a calificar!</label>

            <asp:RadioButtonList ID="radioOptionList" runat="server" CssClass="mkcLetraNaranja">
                <asp:ListItem Text='<i class="fa fa-star" aria-hidden="true"></i>' Value="1" />
                <asp:ListItem Text='<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>' Value="2" />
                <asp:ListItem Text='<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>' Value="3" Selected="True" />
                <asp:ListItem Text='<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>' Value="4" />
                <asp:ListItem Text='<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>' Value="5" />
            </asp:RadioButtonList>
        </div>
    </div>
</div>
