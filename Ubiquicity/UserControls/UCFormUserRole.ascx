<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFormUserRole.ascx.cs" Inherits="Ubiquicity.UserControls.UCFormUserRole" %>
<div class="modal-body">
    <div class="row">
		<div class="col-md-12">
			<asp:Label ID="lblUserName" runat="server"/>
			<div class="row">
				<div class="col-5">
                    <div class="form-group al col">
					    <label for="lstPermissionGranted">Obtenidos</label>
                        <asp:ListBox ID="lstPermissionGranted" runat="server"/>
                    </div>
				</div>
				<div class="col-2">
                    <div class="form-group al col">
                        <asp:Button ID="btnUngrant" runat="server" Text=">>" OnClick="btnUngrant_Click" />
                        <asp:Button ID="btnGrant" runat="server" Text="<<" OnClick="btnGrant_Click" />
                    </div>
				</div>
				<div class="col-5">
                    <div class="form-group al col">
                        <label for="lstPermissionToGrant">A otorgar</label>
                        <asp:ListBox ID="lstPermissionToGrant" runat="server"/>
                    </div>
				</div>
			</div>
		</div>
	</div>

<%--    
    <div class="form-group">
        <label for="lstPermissionGranted">Obtenidos</label>
        <asp:ListBox ID="lstPermissionGranted" runat="server"/>
    </div>
    <asp:Button ID="btnUngrant" runat="server" Text=">>" OnClick="btnUngrant_Click" />
    <asp:Button ID="btnGrant" runat="server" Text="<<" OnClick="btnGrant_Click" />
    <div class="form-group">
        <label for="lstPermissionToGrant">A otorgar</label>
        <asp:ListBox ID="lstPermissionToGrant" runat="server"/>
    </div>--%>
</div>