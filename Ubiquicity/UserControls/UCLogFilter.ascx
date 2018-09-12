﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLogFilter.ascx.cs" Inherits="Ubiquicity.UserControls.UCLogFilter" %>
<div class="row row border p-1 m-1 rounded">
    <div class="form-group col-2">
        <label for="inputLogLevel">Criticidad</label>
        <input id="inputLogLevel" runat="server" type="text" class="form-control form-control-sm" placeholder="Criticidad">
    </div>
    <div class="form-group col-2">
        <label for="inputAction">Acción</label>
        <input id="inputAction" runat="server" type="text" class="form-control form-control-sm" placeholder="Acción">
    </div>
    <div class="form-group col-2">
        <label for="inputDescription">Descripción</label>
        <input id="inputDescription" runat="server" type="text" class="form-control form-control-sm" placeholder="Description">
    </div>
    <div class="form-group col-2">
        <label for="inputEntity">Entidad</label>
        <input id="inputEntity" runat="server" type="text" class="form-control form-control-sm" placeholder="Entidad">
    </div>
    <div class="form-group col-2">
        <label for="dateSince">Desde</label>
        <input id="dateSince" runat="server" type="text" class="form-control form-control-sm" placeholder="Desde">
    </div>
    <div class="form-group col-2">
        <label for="dateUntil">Hasta</label>
        <input id="dateUntil" runat="server" type="text" class="form-control form-control-sm" placeholder="Hasta">
    </div>
    <div class="form-group col-2">
        <label for="inputUser">Usuario</label>
        <input id="inputUser" runat="server" type="text" class="form-control form-control-sm" placeholder="Usuario">
    </div>
    <div class="form-group col-10 align-bottom">
        <button ID="btnSearch" runat="server" class="btn btn-primary btn-sm" onserverclick="btnSearch_PerformSearch" >
    <i class="fa fa-search" aria-hidden="true"></i> Buscar</button>
    </div>
</div>