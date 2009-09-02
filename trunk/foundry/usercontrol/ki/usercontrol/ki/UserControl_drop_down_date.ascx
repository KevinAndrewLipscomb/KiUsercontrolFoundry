<%@ Control language="c#" autoeventwireup="false" codebehind="UserControl_drop_down_date.ascx.cs" inherits="UserControl_drop_down_date.TWebUserControl_drop_down_date"%>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0">
      <tr>
        <td nowrap="true">
          <ASP:DropDownList id="DropDownList_month" runat="server"></ASP:DropDownList>
          <ASP:DropDownList id="DropDownList_day" runat="server"></ASP:DropDownList>
          <ASP:DropDownList id="DropDownList_year" runat="server"></ASP:DropDownList>
          <ASP:Button id="Button_today" runat="server" text="Today" causesvalidation="False"></ASP:Button>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
