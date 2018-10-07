<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCHeaderBackOffice.ascx.cs" Inherits="Ubiquicity.UserControls.UCHeaderBackOffice" %>
<p></p><p></p>  
<div class="card m-1 bg-light">
    <%--   <div class="row">
        <div class="col-1 align-middle">
            <img id="UCImage" runat="server" class="pt-1" height="64" width="64" />
        </div>
        <div class="col-11">
            <div class="card-body">
                <h5 id="UCTitle" runat="server" class="card-title" ></h5>
                <h3 id="UCSubtitle" runat="server"></h3>
                <p id="UCContent" runat="server" class="card-text"></p>
            </div>
        </div>
    </div>--%>

    <div class="form-inline">
        <img id="UCImage" runat="server" class="pt-1" height="64" width="64" />
        
            <div class="card-body" style="margin:0px; padding:5px">
                <h5 id="UCSubtitle" runat="server" class="card-title" style="margin:0px; display:none" ></h5>
                <h4 id="UCTitle" runat="server" style="margin:0px"></h4>
                <p id="UCContent" runat="server" class="card-text" style="margin:0px"></p>
            </div>
    </div>

</div>
<p></p><p></p>