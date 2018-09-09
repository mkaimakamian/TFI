<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCHeaderBackOffice.ascx.cs" Inherits="Ubiquicity.UserControls.UCHeaderBackOffice" %>
<div class="card m-1 bg-light">
    <div class="row">
        <div class="col-1 align-middle">
            <img id="UCImage" runat="server" class="pt-1" height="128" width="128" />
        </div>
        <div class="col-11">
            <div class="card-body">
                <h5 id="UCTitle" runat="server" class="card-title" ></h5>
                <h3 id="UCSubtitle" runat="server"></h3>
                <p id="UCContent" runat="server" class="card-text"></p>
            </div>
        </div>
    </div>
</div>