<%@ Page Title="" Language="C#" MasterPageFile="~/front.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Ubiquicity.index" %>

<asp:Content ID="Content3" ContentPlaceHolderID="contentHolder" runat="server">
    <!-- Carrusel -->
    <div class="row">
        <div id="carouselHome" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselHome" data-slide-to="0" class="active"></li>
                <li data-target="#carouselHome" data-slide-to="1"></li>
                <li data-target="#carouselHome" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="Resources/carousel01.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block text-left">
                        <h1 class="mkcLetraGris">¡Ubicarse nunca fue tan fácil!</h1>
                        <p class="mkcLetraGris">Desarrollado con tecnlogía Sniper&reg; ubicarse nunca fue tan fácil: ¡apuntá tu móvil hacia el horizonte!</p>
                        <p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalRegisterWebUser">Registrate :D</button></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="Resources/carousel01.jpg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block text-left">
                        <h1 class="mkcLetraGris">¡Ubicarse nunca fue tan fácil!</h1>
                        <p class="mkcLetraGris">Desarrollado con tecnlogía Sniper&reg; ubicarse nunca fue tan fácil: ¡apuntá tu móvil hacia el horizonte!</p>
                        <p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalRegisterWebUser">Registrate :D</button></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="Resources/carousel01.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block text-left">
                        <h1 class="mkcLetraGris">¡Ubicarse nunca fue tan fácil!</h1>
                        <p class="mkcLetraGris">Desarrollado con tecnlogía Sniper&reg; ubicarse nunca fue tan fácil: ¡apuntá tu móvil hacia el horizonte!</p>
                        <p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalRegisterWebUser">Registrate :D</button></p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselHome" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselHome" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row text-center mt-4">
            <div class="col-lg-4">
                <img src="Resources/home02.svg" width="96" height="96">
                <h2>Realidad Aumentada</h2>
                <p>La tecnología Sniper&reg; desarrollada por Ubiqui-city ter permitirá obtener información sobre el lugar en el que estás con solo apuntar el dispositivo hacia el horizonte.</p>
                <p><a class="btn btn-warning" href="#" role="button">¡Quiero saber más!</a></p>
            </div>

            <div class="col-lg-4">
                <img src="Resources/home03.svg" width="96" height="96">
                <h2>Experiencias 3D</h2>
                <p>Vivenciá los POI turísticos mediante la realidad aumentada y la realidad mixta, accediendo a descargables que te permitirán visitar -desde donde estés- tu lugar en el mundo favorito.</p>
                <p><a class="btn btn-warning" href="#" role="button">¡Quiero saber más!</a></p>
            </div>

            <div class="col-lg-4">
                <img src="Resources/home01.svg" width="96" height="96">
                <h2>Servicios GPS</h2>
                <p>Mejorá tu experiencia de viaje adquiriendo los servicios de geolocalización útiles como información sobre el clima, medios de transportes, noticias locales y más.</p>
                <p><a class="btn btn-warning" href="#" role="button">¡Quiero saber más!</a></p>
            </div>

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
</asp:Content>
