<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLogFilter.ascx.cs" Inherits="Ubiquicity.UserControls.UCLogFilter" %>
<div class="row border p-1 m-1 rounded align-items-end">
    <div class="form-group col-2">
        <label for="inputLogLevel">Criticidad</label>
        <input id="inputLogLevel" runat="server" type="text" class="form-control form-control-sm" 
            placeholder="Criticidad" maxlength="50">
    </div>
    <div class="form-group col-2">
        <label for="inputAction">Acción</label>
        <input id="inputAction" runat="server" type="text" class="form-control form-control-sm" 
            placeholder="Acción" maxlength="50">
    </div>
    <div class="form-group col-2">
        <label for="inputDescription">Descripción</label>
        <input id="inputDescription" runat="server" type="text" class="form-control form-control-sm" 
            placeholder="Description" maxlength="250">
    </div>
    <div class="form-group col-2">
        <label for="inputEntity">Entidad</label>
        <input id="inputEntity" runat="server" type="text" class="form-control form-control-sm" 
            placeholder="Entidad" maxlength="50">
    </div>
    <div class="form-group col-2">
        <label for="dateSince">Desde</label>
        <UCmkc:UCCalendar ID="dateSince" runat="server" />
    </div>
    <div class="form-group col-2">
        <label for="dateUntil">Hasta</label>
        <UCmkc:UCCalendar ID="dateUntil" runat="server" />
    </div>
    <div class="form-group col-2">
        <label for="inputUser">Usuario</label>
        <input id="inputUser" runat="server" type="text" class="form-control form-control-sm" 
            placeholder="Usuario" maxlength="50">
    </div>
    <div class="form-group col-10 align-content-bottom">
        <button id="btnSearch" runat="server" class="btn btn-primary btn-sm" onserverclick="PerformSearch">
            <i class="fa fa-search" aria-hidden="true"></i> Buscar</button>
    </div>
</div>
