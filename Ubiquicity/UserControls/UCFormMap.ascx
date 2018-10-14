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
    <div class="row justify-content-center">
        <div class="form-group col-12">
            <label for="nameInput">Nombre</label>
            <input id="nameInput" runat="server" type="text" class="form-control form-control-sm" placeholder="Ingresá el nombre">
        </div>
        <div class="form-group col-8">
            <label for="descriptionInput">Descripción</label>
            <textarea id="descriptionInput" runat="server" class="form-control form-control-sm" rows="6"></textarea>
        </div>
        <div class="form-group col-4">
            <label for="imageInput">Imagen</label>
            <img id="mapFileImage" runat="server" width="128" />

        </div>
        <div class="form-group col-12">
            <input id="imageInput" runat="server" type="file" onchange="readURL(this)">
            <input id="imageInputBase64" runat="server" type="hidden">
        </div>
        <div class="form-group col-12">
            <label id="lblResource" runat="server" for="resourceInput">Recurso</label>
            <asp:FileUpload ID="resourceInput" runat="server" class="form-control form-control-sm btn-choose" />
        </div>
    </div>
</div>
