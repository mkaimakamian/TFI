<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Ubiquicity.contact" %>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="row">
        <div class="col-4">
        </div>
        <div class="col-4">
            <div class="form-group col-md-12">
                <label for="firstNameInput">Nombre</label>
                <input id="firstNameInput" runat="server" type="text" class="form-control form-control-sm"  placeholder="Ingresa tu nombre">
              </div>
              <div class="form-group col-md-12">
                <label for="lastNameInput">Apellido</label>
                <input id="lastNameInput" runat="server" type="text" class="form-control form-control-sm"  placeholder="Ingresa tu apellido">
              </div>
              <div class="form-group col-md-12">
                <label for="mailInput">Dirección de correo</label>
                <input id="mailInput" runat="server" type="email" class="form-control form-control-sm"  placeholder="Ingresá tu correo electrónico">
              </div>
              <div class="form-group col-md-12">
                <label for="textArea">Mensaje</label>
                <textarea  id="textArea" runat="server" type="text" class="form-control form-control-sm"  placeholder="Ingresá tu mensaje"></textarea>
              </div>
              <div class="form-group col-md-12 ali">
                <button type="button" class="btn btn-primary btn-sm">Enviar</button>
              </div>
          </div>
        <div class="col-4">
        </div>
    </div>

</asp:Content>
