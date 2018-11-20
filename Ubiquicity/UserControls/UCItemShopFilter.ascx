<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCItemShopFilter.ascx.cs" Inherits="Ubiquicity.UserControls.UCItemShopFilter" %>
<div class="row border rounded align-items-end p-1">
    <div class="form-group col">
        <label for="nameInput">Nombre</label>
        <input id="nameInput" runat="server" type="text" class="form-control form-control-sm" maxlength="50">
    </div>
    <div class="form-group col">
        <label for="descriptionInput">Descripción</label>
        <input id="descriptionInput" runat="server" type="text" class="form-control form-control-sm" maxlength="250">
    </div>
    <div class="form-group col">
        <label for="minInput">Montó mínimo</label>
        <input id="minInput" runat="server" class="form-control form-control-sm"
            type="number" placeholder="1.0" step="0.01" min="0" max="9999">
    </div>
    <div class="form-group col">
        <label for="maxInput">Monto máximo</label>
        <input id="maxInput" runat="server" class="form-control form-control-sm"
            type="number" placeholder="200.0" step="0.01" min="0" max="9999">
    </div>

    <div class="form-group col">
        <label for="dropCategoryInput">Categoría</label>
        <asp:DropDownList ID="dropCategoryInput" runat="server" Font-Size="Small" CssClass="dropdown-toggle form-control form-control-sm" />
    </div>
    <div class="form-group col align-content-bottom">
        <button id="btnSearch" runat="server" class="btn btn-primary btn-sm" onserverclick="PerformSearch">
            <i class="fa fa-search" aria-hidden="true"></i> Buscar</button>
    </div>
</div>
