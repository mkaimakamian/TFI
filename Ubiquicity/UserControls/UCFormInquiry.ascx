<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormInquiry.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormInquiry" %>
<div class="modal-body">
    <div class="row">
        <div class="col">
            <p id="txtTitle" runat="server"></p>
        <h6 id="txtProduct" runat="server"></h6>
        <h6 id="txtCategory" runat="server"></h6>
        <h6 id="txtRanking" runat="server"></h6>

         </div>
        <%--<input id="txtProductId" runat="server" type="hidden" />--%>
    </div>
    <div class="row">
        <div class="form-group col">
            <%--<label for="txtInquiry">Usuario</label>--%>
            <p></p>
            <textarea id="txtInquiry" runat="server" class="form-control form-control-sm"
                disabled rows="3" maxlength="250"></textarea>
        </div>
    </div>
    <div class="row">
        <div class="form-group col">
            <label for="txtAnswer">Respuesta</label>
            <textarea id="txtAnswer" runat="server" class="form-control form-control-sm"
                rows="3" maxlength="250"></textarea>
        </div>
    </div>
</div>
