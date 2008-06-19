<%@ Page language="c#" Debug="true" Codebehind="WebForm1.pas" AutoEventWireup="false" Inherits="WebForm1.TWebForm1" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_attachment_explorer" Src="~/usercontrol/ki/UserControl_attachment_explorer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head runat="server">
    <title></title>
    <script type="text/javascript" src="js/gradient.js"></script>
  </head>

  <body bgcolor="white">
     <form runat="server">
      <uc1:UserControl_attachment_explorer id="UserControl_attachment_explorer_control" runat="server"></uc1:UserControl_attachment_explorer>
      <p>
        <asp:Button id="Button1" runat="server" text="Submit"></asp:Button>
      </p>
      <p>
        <asp:Label id="Label1" runat="server"></asp:Label>
      </p>
     </form>
  </body>
</html>
