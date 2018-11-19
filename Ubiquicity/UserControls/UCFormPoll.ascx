<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormPoll.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormPoll" %>
<div class="modal-body">

    <div class="row">
        <div class="col-6">
            <div class="row">
                <div class="form-group col-12">
                    <label for="nameInput">Nombre</label>
                    <input id="nameInput" runat="server" type="text" class="form-control form-control-sm" maxlength="50">
                </div>
            </div>

            <div class="row">
                <div class="form-group col">
                    <label for="descriptionInput">Descripción</label>
                    <textarea id="descriptionInput" runat="server" class="form-control form-control-sm"
                        rows="3" maxlength="250"></textarea>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="row">
                <div class="form-group col-12">
                    <label for="dueDateInput">Vencimiento</label>
                    <UCmkc:UCCalendar runat="server" ID="dueDateInput" />
                </div>
            </div>
            <div class="row">
                <div class="form-group col">
                    <label for="pollTypeInput">Tipo</label>
                    <asp:RadioButtonList ID="pollRadioList" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="0">Satisfacción</asp:ListItem>
                        <asp:ListItem Value="1">General</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>

            <div class="row">
                <div class="form-group col">
                    <input id="activeCheck" type="checkbox" runat="server" />
                    <label for="activeCheck">Activar encuesta</label>
                </div>
            </div>
        </div>
    </div>

    <div class="row border-top">
        <div class="col">
            <div class="row">
                <div class="col">
                    <blockquote class="blockquote">
                        <footer class="blockquote-footer">
                            Este es el subpanel para la creación de las preguntas y asignación de las posibles respuestas.
                        </footer>
                    </blockquote>
                </div>
            </div>
            <div class="row">
                <!-- Listado de preguntas -->
                <div class="col">
                    <div class="row">
                        <div class="col form-group">
                            <label for="pollQuestionList">Preguntas a mostrar</label>
                            <asp:ListBox ID="pollQuestionList" runat="server" CssClass="form-control" Height="175" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                            <asp:LinkButton ID="deleteBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Eliminar del listado" OnClick="DeleteQuestion" />
                            <%--<asp:LinkButton ID="newBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Nueva" OnClick="NewQuestion" />--%>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="questionInput">Pregunta a crear</label>
                            <input id="questionInput" runat="server" type="text" placeholder="Escribe la pregunta"
                                class="form-control form-control-sm" maxlength="50">
                        </div>
                        <div class="form-group col-12">
                            <label for="optionListInput">Opciones</label>
                            <asp:ListBox ID="optionListInput" runat="server" CssClass="form-control" Height="100" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                                                <div class="col-12">
                            <asp:LinkButton ID="addBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Agregar al listado" OnClick="AddQuestion" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
