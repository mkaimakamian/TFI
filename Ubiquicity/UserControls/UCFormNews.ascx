<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormNews.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormNews" %>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                document.getElementById("contentHolder_UCFormNews_fileImage").src = e.target.result;
                document.getElementById("contentHolder_UCFormNews_imageInputBase64").value = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<div class="modal-body">
    <div class="row justify-content-center">
        <div class="form-group col-12">
            <label for="titleInput">Título</label>
            <input id="titleInput" runat="server" type="text" class="form-control form-control-sm" placeholder="Ingresa el nombre">
        </div>
        <div class="form-group col-8">
            <label for="bodyInput">Cuerpo</label>
            <textarea id="bodyInput" runat="server" class="form-control form-control-sm" rows="10"></textarea>
        </div>
        <div class="form-group col-4">
            <label for="imageInput">Imagen</label>
            <img id="fileImage" runat="server" width="200" />
        </div>
        <div class="form-group col-12">
            <input id="imageInput" runat="server" type="file" onchange="readURL(this)">
            <input id="imageInputBase64" runat="server" type="hidden">
        </div>
        <div class="form-group col-4">
            <label for="dropCategoryInput">Categoría</label>
            <asp:DropDownList ID="dropCategoryInput" runat="server" cclass="btn btn-secondary dropdown-toggle form-control form-control-sm"/>
        </div>
        <div class="form-group col-4">
            <label for="sinceInput">Activación</label>
            <UCmkc:UCCalendar runat="server" ID="sinceInput" />
        </div>
        <div class="form-group col-4">
            <label for="untilInput">Vencimiento</label>
            <UCmkc:UCCalendar runat="server" ID="untilInput" />
        </div>
    </div>
</div>
