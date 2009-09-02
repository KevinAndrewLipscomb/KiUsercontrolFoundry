<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_session_interrupted.ascx.cs" Inherits="UserControl_session_interrupted.TWebUserControl_session_interrupted"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#f5f5f5"><h1>Your session was interrupted.</h1></td>
        </tr>
        <tr>
          <td>
            <p>This can be caused by inactivity, or by configuration changes on the host server.</p>
            <p>As a security precaution, you have been logged out.</p>
            <p>Please <ASP:HyperLink id="HyperLink_login" runat="server" font-bold="True" navigateurl="~/login.aspx">log in</ASP:HyperLink> again to continue using the application.</p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
