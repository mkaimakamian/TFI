<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormPoll.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormPoll" %>
<div class="modal-body">
    <div class="row">
        <!-- Poll -->
        <div class="col">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Encuesta</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Gestión de preguntas</a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <!-- Primer solapa -->
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="row mt-2">

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
                                rows="6" maxlength="250"></textarea>
                        </div>

                        <div class="col">
                            <div class="row">
                                <div class="form-group col">
                                    <label for="pollTypeInput">Tipo</label>
                                    <asp:RadioButtonList ID="pollRadioList" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True" Value="0">Satisfacción</asp:ListItem>
                                        <asp:ListItem Value="1">General</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="form-group col">
                                <input id="activeCheck" type="checkbox" runat="server"/>
                                <label for="activeCheck">Activo</label>
                            </div>
                            </div>
                        </div>


                    </div>
                </div>

                <!-- Preguntas -->
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="row">
                        <div class="col-6" id="questionListCol" runat="server">
                            <div class="row mt-2">

                                <div class="form-group col-12">
                                    <label for="pollQuestionList">Preguntas</label>

                                    <asp:ListBox ID="pollQuestionList" runat="server" CssClass="form-control" Height="200" />

                                </div>
                                <%--                                <div class="form-group col-6">
                                    <asp:LinkButton ID="editBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-pencil-square-o' aria-hidden='true'></i> Editar" />
                                </div>--%>
                                <div class="form-group col-6">
                                    <asp:LinkButton ID="deleteBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Eliminar" OnClick="DeleteQuestion" />
                                </div>

                                <div class="form-group col-6">
                                    <asp:LinkButton ID="newBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Nueva" OnClick="NewQuestion" />
                                </div>
                            </div>
                        </div>


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
    </div>
</div>
