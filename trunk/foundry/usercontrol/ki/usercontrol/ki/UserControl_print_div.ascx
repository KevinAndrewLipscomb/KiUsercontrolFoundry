<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_print_div.pas" Inherits="UserControl_print_div.TWebUserControl_print_div"%>
<small><ASP:LinkButton id="LinkButton_print" runat="server" causesvalidation="False">[&nbsp;Print&nbsp;form&nbsp;body&nbsp;]</ASP:LinkButton></small>
<!-- Must wrap print area in <div id="Div_print_area">...</div> tags. -->
<script language="javascript">
 function CallPrint(strid)
   {
   var prtContent = document.getElementById(strid);
   var WinPrint = window.open('','','left=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status=0');
   WinPrint.document.write(prtContent.innerHTML);
   WinPrint.document.close();
   WinPrint.focus();
   WinPrint.print();
   WinPrint.close();
   }
</script>
