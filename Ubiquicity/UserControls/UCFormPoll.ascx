<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormPoll.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormPoll" %>
<div class="modal-body">
    <div class="row">
        <!-- Poll -->

        <%--<div class="col">
            <label for="pollOptionList">Preguntas</label>
            <div class="row">
                <div class="form-group col-4">
                    <asp:LinkButton ID="newBtn" runat="server" 
                        CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-plus' aria-hidden='true'></i> Nueva"/>
                </div>
                
                <div class="form-group col-12">
                    <asp:ListBox ID="pollOptionList" runat="server" CssClass="form-control" Height="200" />
                </div>
                <div class="form-group col-6">
                    <asp:LinkButton ID="editBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-pencil-square-o' aria-hidden='true'></i> Editar" />
                </div>
                <div class="form-group col-6">
                    <asp:LinkButton ID="deleteBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-window-close-o' aria-hidden='true'></i> Eliminar" />
                </div>
            </div>
        </div>--%>
        <div class="col">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Encuesta</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Gestión de preguntas</a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="nameInput">Nombre</label>
                            <input id="nameInput" runat="server" type="text" class="form-control form-control-sm" maxlength="50">
                        </div>
                        <div class="form-group col-12">
                            <label for="descriptionInput">Descripción</label>
                            <textarea id="descriptionInput" runat="server" class="form-control form-control-sm"
                                rows="6" maxlength="250"></textarea>
                        </div>
                        <div class="form-group col-12">
                            <label for="dueDateInput">Vencimiento</label>
                            <UCmkc:UCCalendar runat="server" ID="dueDateInput" />
                        </div>
                        <div class="form-group col-12">
                            <label for="pollTypeInput">Tipo</label>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="row">
                        <div class="col-6" id="questionListCol" runat="server">
                            <div class="row">
                                <div class="form-group col-4">
                                    <asp:LinkButton ID="newBtn" runat="server" CssClass="btn btn-primary btn-sm" 
                                        Text="<i class='fa fa-plus' aria-hidden='true'></i> Nueva" OnClick="NewQuestion"/>
                                </div>

                                <div class="form-group col-12">
                                    <asp:ListBox ID="pollOptionList" runat="server" CssClass="form-control" Height="200" />
                                </div>
                                <div class="form-group col-6">
                                    <asp:LinkButton ID="editBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-pencil-square-o' aria-hidden='true'></i> Editar" />
                                </div>
                                <div class="form-group col-6">
                                    <asp:LinkButton ID="deleteBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-window-close-o' aria-hidden='true'></i> Eliminar" />
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
                                    <asp:CheckBoxList ID="optionListInput" runat="server" CssClass="form-control"></asp:CheckBoxList>
                                </div>
                                <div class="form-group col-6">
                                    <asp:LinkButton ID="addBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="<i class='fa fa-window-close-o' aria-hidden='true'></i> Agregar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
