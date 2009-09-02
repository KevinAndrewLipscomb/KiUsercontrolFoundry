using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace UserControl_print_div
{
    public partial class TWebUserControl_print_div: ki_web_ui.usercontrol_class
    {
        public string text
        {
          get {
            string result;
            result = LinkButton_print.Text;
            return result;
          }
          set {
            LinkButton_print.Text = value;
          }
        }
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {

            this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            LinkButton_print.Attributes.Add("onclick", "javascript:CallPrint(\'Div_print_area\');");

            LinkButton_print.Text = kix.Units.kix.ExpandTildePath(LinkButton_print.Text);
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

    } // end TWebUserControl_print_div

}

namespace UserControl_print_div.Units
{
    public class UserControl_print_div
    {
    } // end UserControl_print_div

}

