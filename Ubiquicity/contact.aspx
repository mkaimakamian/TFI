<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Ubiquicity.contact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-5">
                <div class="row">
                    <div class="feature-description">
                        <h2>¿Si tenés alguna inquietud o querés compartir algo con nosotros?... ¡que nada te detenga!</h2>
                        <hr>

                        <div class="feature-left">
                            <div class="feature-icon"><i class="far fa-address-book"></i></div>
                            <div class="feature-content">
                                <p>Estamos las 24 hs detrás del monitor esperándote.</p>
                            </div>
                        </div>

                        <div class="feature-left">
                            <div class="feature-icon"><i class="far fa-compass"></i></div>
                            <div class="feature-content">
                                <p>Si estás en la Argentina, podés comunicarte al +54 1234 9874.</p>
                            </div>
                        </div>

                        <div class="feature-left">
                            <div class="feature-icon"><i class="far fa-question-circle"></i></div>
                            <div class="feature-content">
                                <p>Querés interacción pero no hablar por teléfono, el chat es la mejor opción.</p>
                            </div>
                        </div>

                        <hr>
                        <%--                        <p>Note : you can write whatever you want to describe here.</p>--%>
                    </div>
                </div>
            </div>

            <!-- /.feature-sections -->
            <div class="col-5">
                <div class="row">
                    <%--                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb10 ">
                            <h3>Ubiqui-city</h3>
                        </div>--%>
                    <div class="form-group col-md-12">
                        <label for="firstNameInput">Nombre</label>
                        <input id="firstNameInput" runat="server" type="text" class="form-control form-control-sm" placeholder="Ingresá tu nombre">
                    </div>
                    <div class="form-group col-md-12">
                        <label for="lastNameInput">Apellido</label>
                        <input id="lastNameInput" runat="server" type="text" class="form-control form-control-sm" placeholder="Ingresá tu apellido">
                    </div>
                    <div class="form-group col-md-12">
                        <label for="mailInput">Dirección de correo</label>
                        <input id="mailInput" runat="server" type="email" class="form-control form-control-sm" placeholder="Ingresá tu correo electrónico">
                    </div>
                    <div class="form-group col-md-12">
                        <label for="textArea">Mensaje</label>
                        <textarea id="textArea" runat="server" type="text" class="form-control form-control-sm" rows="8" placeholder="Ingresá tu mensaje"></textarea>
                    </div>
                    <div class="form-group col-md-12">
                        <button type="submit" name="singlebutton" class="btn btn-default">Enviar</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
