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
            <label for="categoryInput">Categoría</label>
            <select id="categoryInput" runat="server" class="form-control form-control-sm">
                <option selected>Lanzamientos</option>
                <option>Mapas</option>
                <option>Servicios</option>
                <option>RA</option>
                <option>RV</option>
            </select>
        </div>
        <div class="form-group col-4">
            <label for="sinceInput">Activación</label>
            <input id="sinceInput" runat="server" type="text" class="form-control form-control-sm" placeholder="Desde">
        </div>
        <div class="form-group col-4">
            <label for="untilInput">Vencimiento</label>
            <input id="untilInput" runat="server" type="text" class="form-control form-control-sm" placeholder="Hasta">
        </div>

        <%--        Para la carga de las imágenes (repeater?)
        <div class="form-group col-12">
            <asp:Button ID="btnUngrant" runat="server" Text=">>" OnClick="btnUngrant_Click" CssClass="form-control btn-sm" />
            <asp:Button ID="btnGrant" runat="server" Text="<<" OnClick="btnGrant_Click" CssClass="form-control btn-sm" />
        </div>--%>
    </div>
</div>
