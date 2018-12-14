<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCModalInvoiceItemSupport.ascx.cs" Inherits="Ubiquicity.UserControls.UCModalInvoiceItemSupport" %>
<link href="../Resources/commentMessage.css" rel="stylesheet" />
<div class="modal-body">
    <div class="row">
        <div class="col">
                    <div class="row">
                        <div class="col-12" style="height: 300px; overflow-x: hidden; overflow-y: scroll;">
                            <!-- Listado de comentarios -->
                            <asp:Repeater ID="itemRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="media comment-box">
                                        <div class="media-left">
                                            <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading">
                                                <%# Convert.ToBoolean(Eval("IsOperator")) ? "<font color=\"#ffc107\">[Ubiquicity]</font> " : "[Usuario] " %>
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
                    <div class="row" runat="server">
                        <div class="form-group col-12">
                            <label for="commentInput">Comentario</label>
                            <textarea id="commentInput" runat="server" class="form-control form-control-sm" rows="3" maxlength="250"></textarea>
                            <asp:Button ID="btnComentar" runat="server" CssClass="btn btn-primary btn-sm mt-2" Text="Comentar" OnClick="PerformComment" />
                            <asp:Button ID="btnCerrar" runat="server" CssClass="btn btn-success btn-sm mt-2" Text="Marcar como cerrado" OnClick="PerformClose" />
                       </div>
                    </div>
                </div>
    </div>
</div>