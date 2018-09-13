<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormNewMember.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalNewMember" %>
      <div class="modal-body">
          <div class="form-row">
              <div class="form-group col-md-6">
                <label for="firstNameInput">Nombre</label>
                <input id="firstNameInput" runat="server" type="text" class="form-control form-control-sm"  placeholder="Ingresa tu nombre">
              </div>
              <div class="form-group col-md-6">
                <label for="lastNameInput">Apellido</label>
                <input id="lastNameInput" runat="server" type="text" class="form-control form-control-sm"  placeholder="Ingresa tu apellido">
              </div>
          </div>
          <div class="form-row">
              <div class="form-group col-md-6">
                <label for="userInput">Usuario</label>
                <input id="userInput" runat="server" type="text" class="form-control form-control-sm"  placeholder="Ingresá tu usuario">
              </div>
              <div class="form-group col-md-6">
                <label for="mailInput">Dirección de correo</label>
                <input id="mailInput" runat="server" type="email" class="form-control form-control-sm"  placeholder="Ingresá tu correo electrónico">
              </div>
            </div>
           <div id="passwordControls" runat="server" class="form-row">
              <div class="form-group col-md-6">
                <label for="passwordInput">Password</label>
                <input id="passwordInput" runat="server" type="password" class="form-control form-control-sm"  placeholder="Ingresá tu password">
              </div>
              <div class="form-group col-md-6">
                <label for="passwordConfirmInput">Confirmar password</label>
                <input id="passwordVerificationInput" runat="server" type="password" class="form-control form-control-sm" placeholder="Reingresá tu password">
              </div>
              </div>
      </div>