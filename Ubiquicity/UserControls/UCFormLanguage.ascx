<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormLanguage.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormLanguage" %>
<div class="modal-body">
    <div class="form-group">
    <label for="languageNameInput">Nombre</label>
    <input id="languageNameInput" runat="server" type="text" class="form-control"  placeholder="Ingresa el idioma">
    </div>
    <div class="form-group">
    <label for="gvTranslation">Traducciones</label>
    <asp:GridView ID="gvTranslation" runat="server" OnRowCreated="RowCreated"
        OnRowCommand="gvTranslation_OnRowCommand" class="table table-bordered bs-table table-striped table-sm"  >
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <%--<asp:Button ID="btnEdit" runat="server"  CssClass="btn btn-secondary" CausesValidation="false" CommandName="EditItem" Text="Editar" CommandArgument='<%# Eval("id") %>'/>--%>
                    <input id="Text1" type="text" />
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
    </asp:GridView>           
    </div>
</div>