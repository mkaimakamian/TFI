<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormMap.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormMap" %>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#mapFileImage').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<div class="modal-body">
    <div class="form-row">
        <div class="form-group col-md-6">
        <label for="nameInput">Nombre</label>
        <input id="nameInput" runat="server" type="text" class="form-control form-control-sm"  placeholder="Ingresá el nombre">
        </div>
        <div class="form-group col-md-6">
            <label for="descriptionInput">Descripción</label>
            <input id="descriptionInput" runat="server" type="text" class="form-control form-control-sm"  placeholder="Ingresa la descripción">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="resourceInput">Mapa (recurso)</label>
            <input id="resourceInput" runat="server" type="file" class="form-control form-control-sm btn-choose">
        </div>
        <div class="form-group col-md-6">
            <label for="imageInput">Imagen</label>
            <input id="imageInput" runat="server" type="file" onchange="readURL(this)">
            <img id="mapFileImage" width="200px" />
       </div>
    </div>
 
</div>