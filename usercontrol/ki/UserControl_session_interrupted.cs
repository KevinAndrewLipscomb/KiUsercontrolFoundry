using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace UserControl_session_interrupted
{
    public class TWebUserControl_session_interrupted: ki_web_ui.usercontrol_class
    {
        protected System.Web.UI.WebControls.HyperLink HyperLink_login = null;
        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
        }

    } // end TWebUserControl_session_interrupted

}

namespace UserControl_session_interrupted.Units
{
    public class UserControl_session_interrupted
    {
    } // end UserControl_session_interrupted

}

