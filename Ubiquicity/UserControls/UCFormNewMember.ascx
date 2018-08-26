<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormNewMember.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalNewMember" %>
      <div class="modal-body">
          <div class="form-group">
            <label for="firstNameInput">Nombre</label>
            <input id="firstNameInput" runat="server" type="text" class="form-control"  placeholder="Ingresa tu nombre">
          </div>
          <div class="form-group">
            <label for="lastNameInput">Apellido</label>
            <input id="lastNameInput" runat="server" type="text" class="form-control"  placeholder="Ingresa tu apellido">
          </div>
          <div class="form-group">
            <label for="mailInput">Dirección de correo</label>
            <input id="mailInput" runat="server" type="email" class="form-control"  placeholder="Ingresá tu correo electrónico">
          </div>
          <div class="form-group">
            <label for="userInput">Usuario</label>
            <input id="userInput" runat="server" type="text" class="form-control"  placeholder="Ingresá tu usuario">
          </div>
          <div class="form-group">
            <label for="passwordInput">Password</label>
            <input id="passwordInput" runat="server" type="text" class="form-control"  placeholder="Ingresá tu password" aria-describedby="passwordHelp">
            <small id="passwordHelp" class="form-text text-muted">¡Hey! asegurate que nadie te vea</small>
          </div>
          <div class="form-group">
            <label for="passwordConfirmInput">Confirmar password</label>
            <input id="passwordConfirmInput" runat="server" type="text" class="form-control" placeholder="Reingresá tu password">
          </div>
          <div class="form-check">
            <input id="checkPrivacyAgreement" runat="server" type="checkbox" class="form-check-input" >
            <label class="form-check-label" for="checkPrivacyAgreement">Leí los términos y condiciones</label>
          </div>
      </div>