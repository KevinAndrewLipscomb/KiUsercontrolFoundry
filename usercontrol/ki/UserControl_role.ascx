<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_role.pas" Inherits="UserControl_role.TWebUserControl_role"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<div id="Div_print_area">
  <table cellspacing="0" cellpadding="5" width="100%" border="0">
    <tr>
      <td valign="top">
        <table cellspacing="0" cellpadding="5" border="0">
          <tr>
            <td valign="top"><font class="">Name:</font></td>
            <td valign="top">
              <font class="">
                <ASP:TextBox id="TextBox_name" runat="server" columns="63" maxlength="63" cssclass=""></ASP:TextBox>&nbsp;&nbsp;&nbsp;&nbsp; <ASP:LinkButton id="LinkButton_search" runat="server" causesvalidation="False">Lookup</ASP:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp; <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False">Reset</ASP:LinkButton><br>
                <ASP:DropDownList id="DropDownList_name" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br></font>
            </td>
            <td valign="top">
              <ASP:RequiredFieldValidator id="RequiredFieldValidator_name" runat="server" errormessage="Please enter Name." font-bold="True" controltovalidate="TextBox_name" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td><font class="">Tier id:</font></td>
            <td><font class=""><ASP:TextBox id="TextBox_tier_id" runat="server"  cssclass="" columns="1"></ASP:TextBox></font></td>
            <td>
              <ASP:RegularExpressionValidator id="RegularExpressionValidator_tier_id" runat="server" errormessage="Please enter a valid Tier id." font-bold="True" controltovalidate="TextBox_tier_id" validationexpression="\d*" display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
            </td>
          </tr>
          <tr>
            <td><font class="">Soft hyphenation text:</font></td>
            <td><font class=""><ASP:TextBox id="TextBox_soft_hyphenation_text" runat="server" columns="72" maxlength="127" cssclass=""></ASP:TextBox></font></td>
            <td>
              <ASP:RequiredFieldValidator id="RequiredFieldValidator_soft_hyphenation_text" runat="server" errormessage="Please enter Soft hyphenation text." font-bold="True" controltovalidate="TextBox_soft_hyphenation_text" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <ASP:Button id="Button_submit" text="Submit" runat="server"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp; <uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div>
  <p>&nbsp;</p>
  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" border="0">
          <tr>
            <td bgcolor="#f5f5f5"><strong>
                <table cellspacing="0" cellpadding="5" width="100%" border="0">
                    <tr>
                      <td><strong>Holders</strong></td>
                      <td>
                        <p align="right">QuickMessage</p></td>
                    </tr>
                </table>
              </strong></td>
          </tr>
          <tr>
            <td>
              <asp:GridView id="GridView_holders" runat="server" autogeneratecolumns="False" bordercolor="Gainsboro" gridlines="None" allowsorting="True" cellpadding="5" emptydatatext="No role selected or no holders">
                    <Columns>
                      <asp:BoundField datafield="member_name" headertext="Name" sortexpression="member_name%"></asp:BoundField>
                      <asp:BoundField datafield="agency_designator" headertext="Agency" sortexpression="agency_designator%"></asp:BoundField>
                    </Columns>
              </asp:GridView></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
