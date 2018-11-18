<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormPoll.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormPoll" %>
<div class="modal-body">
    <div class="row">
        <div class="col">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="form-group col">
                            <label for="nameInput">Nombre</label>
                            <input id="nameInput" runat="server" type="text" class="form-control form-control-sm" maxlength="50">
                        </div>
                        <div class="form-group col">
                            <label for="dueDateInput">Vencimiento</label>
                            <UCmkc:UCCalendar runat="server" ID="dueDateInput" />
                        </div>
                    </div>
                </div>
                <div class="form-group col-12">
                    <label for="descriptionInput">Descripción</label>
                    <textarea id="descriptionInput" runat="server" class="form-control form-control-sm" 
                        rows="3" maxlength="250"></textarea>
                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="pollQuestionList">Preguntas</label>
                            <asp:ListBox ID="pollQuestionList" runat="server" CssClass="form-control" Height="100" />
                        </div>
                        <div class="col">
                            <asp:LinkButton ID="deleteBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Eliminar pregunta" OnClick="DeleteQuestion" />
                            <%--<asp:LinkButton ID="newBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Nueva" OnClick="NewQuestion" />--%>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="form-group col-8">
                            <label for="pollTypeInput">Tipo</label>
                            <asp:RadioButtonList ID="pollRadioList" runat="server" RepeatDirection="Vertical">
                                <asp:ListItem Selected="True" Value="0">Satisfacción</asp:ListItem>
                                <asp:ListItem Value="1">General</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="form-group col">
                            <input id="activeCheck" type="checkbox" runat="server" />
                            <label for="activeCheck">Activo</label>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div class="col">
            <div class="row">
                <div class="col-6" id="newQuestionListCol" runat="server">
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="questionInput">Pregunta</label>
                            <input id="questionInput" runat="server" type="text" class="form-control form-control-sm" maxlength="50">
                        </div>
                        <div class="form-group col-12">
                            <label for="optionListInput">Opciones</label>
                            <asp:ListBox ID="optionListInput" runat="server" CssClass="form-control" Height="125" SelectionMode="Multiple"></asp:ListBox>

                        </div>
                        <div class="form-group col-6">
                            <asp:LinkButton ID="addBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Agregar" OnClick="AddQuestion" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
