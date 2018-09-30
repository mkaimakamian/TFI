<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormMap.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormMap" %>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                document.getElementById("contentHolder_UCFormMap_mapFileImage").src = e.target.result;
                document.getElementById("contentHolder_UCFormMap_imageInputBase64").value = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<div class="modal-body">
    <div class="form-row col-md-6">
        <div class="form-group">
            <label for="nameInput">Nombre</label>
            <input id="nameInput" runat="server" type="text" class="form-control form-control-sm" placeholder="Ingresá el nombre">
        </div>

        <div class="form-group">
            <label for="descriptionInput">Descripción</label>
            <input id="descriptionInput" runat="server" type="text" class="form-control form-control-sm" placeholder="Ingresa la descripción">
        </div>

        <div class="form-group">
            <label id="lblResource" runat="server" for="resourceInput">Recurso</label>
            <asp:FileUpload ID="resourceInput" runat="server" class="form-control form-control-sm btn-choose" />
        </div>
    </div>
    <div class="form-row col-md-6">
        <div class="form-group">
            <label for="imageInput">Imagen</label>
            <input id="imageInput" runat="server" type="file" onchange="readURL(this)">
            <input id="imageInputBase64" runat="server" type="hidden">
            <img id="mapFileImage" runat="server" width="200" />
        </div>
    </div>
</div>
