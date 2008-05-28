<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_attachment_explorer.pas" Inherits="UserControl_attachment_explorer.TWebUserControl_attachment_explorer"%>
<table cellspacing="0" cellpadding="2" border="0">
    <tr>
      <td><img id="Image_paperclip" runat="server" height="16" alt="New attachment" hspace="0"
             src="~/usercontrol/ki/image/paperclip_16x16.gif" width="16" border="0">
        <asp:FileUpload id="FileUpload_control" runat="server"></asp:FileUpload></td>
    </tr>
    <tr>
      <td>
        <asp:GridView id="GridView_attachments" runat="server" gridlines="None" cellpadding="2" showheader="False">
          <Columns>
            <asp:ButtonField commandname="Select" text="Button"></asp:ButtonField>
            <asp:CommandField deletetext="&lt;IMG src=&quot;~/usercontrol/ki/image/delete_x16_h.png&quot; alt=&quot;Delete&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" showdeletebutton="True"></asp:CommandField>
          </Columns>
        </asp:GridView></td>
    </tr>
</table>
