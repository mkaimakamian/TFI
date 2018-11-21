<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCModalItemShop.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalItemShop" %>
<link href="../Resources/commentMessage.css" rel="stylesheet" />
<div class="modal fade" id="ucModalItemShop" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <asp:UpdatePanel ID="upItemShop" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" runat="server" id="ucModalItemShopLabel">xxx</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <!-- Descripcion del producto -->
                            <div id="ucModalItemShopMessage" runat="server" class="col-6">

                                <div class="row justify-content-center text-center pb-3 pt-3">
                                    <div class="col">
                                        <img id="imgItem" runat="server" class="img-thumbnail" />
                                        <asp:Label ID="lblRanking" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <blockquote class="blockquote">
                                    <p id="descriptionItem" runat="server" class="mb-1 mt-2" style="font-size: 14px;">
                                    </p>
                                    <footer id="priceItem" runat="server" class="blockquote-footer mkcLetraNaranja">
                                    </footer>
                                </blockquote>
                            </div>

                            <!-- Comentarios del producto -->
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-12" style="border-left: 1px solid #000; height: 300px; overflow-x: hidden; overflow-y: scroll;">
                                        <!-- Listado de comentarios -->
                                        <asp:Repeater ID="itemRepeater" runat="server">
                                            <ItemTemplate>
                                                <div class="media comment-box">
                                                    <div class="media-left">
                                                        <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                                    </div>
                                                    <div class="media-body">
                                                        <h4 class="media-heading">
                                                            <%#Eval("SentenceReference") != null ? "<font color=\"#ffc107\">[Ubiquicity]</font> " : "[Usuario] " %>
                                                            <%# Eval("User.Name") %> - <%# Eval("Date") %>
                                                        </h4>
                                                        <p>
                                                            <%# Eval("Sentence") %>
                                                        </p>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>

                                <!-- Textarea -->
                                <div class="row" id="commentInputDiv" runat="server" style="border-left: 1px solid #000; display: none">
                                    <div class="form-group col-12">
                                        <label for="commentInput">Comentario</label>
                                        <textarea id="commentInput" runat="server" class="form-control form-control-sm" rows="3" maxlength="250"></textarea>
                                        <asp:Button ID="btnComentar" runat="server" CssClass="btn btn-primary btn-sm mt-2" Text="Comentar" OnClick="btnComentar_Click" />
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
