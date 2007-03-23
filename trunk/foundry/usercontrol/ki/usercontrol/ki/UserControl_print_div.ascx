<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_print_div.pas" Inherits="UserControl_print_div.TWebUserControl_print_div"%>
<input id="InputButton_print" type="button" value="HtmlInputButton(UserControl_print_div.controls[0]).value" onClick="javascript:CallPrint('Div_print_area');" runat="server" />
<!-- Must wrap print area in <div id="Div_print_area">...</div> tags. -->
<script language="javascript">
 function CallPrint(strid)
   {
   var prtContent = document.getElementById(strid);
   var WinPrint = window.open('','','left=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status=0');
   WinPrint.document.write('<table cellpadding="50"><tr><td>' + prtContent.innerHTML + '</td></tr></table>');
   WinPrint.document.close();
   WinPrint.focus();
   WinPrint.print();
   WinPrint.close();
   prtContent.innerHTML=strOldOne;
   }
</script>
