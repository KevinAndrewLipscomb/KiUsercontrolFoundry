using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

namespace UserControl_config_welcome
{
    public struct p_type
    {
        public bool be_loaded;
    } // end p_type

    public partial class TWebUserControl_config_welcome: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name = null;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);







            if (IsPostBack && (Session["UserControl_config_welcome.p"] != null) && (Session["UserControl_config_welcome.p"].GetType().Namespace == p.GetType().Namespace))
            {

                p = (p_type)(Session["UserControl_config_welcome.p"]);
            }
            else
            {
                p.be_loaded = false;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {

            this.PreRender += this.TWebUserControl_config_welcome_PreRender;

            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_config_welcome_PreRender(object sender, System.EventArgs e)
        {

            SessionSet("UserControl_config_welcome.p", p);
        }

        public TWebUserControl_config_welcome Fresh()
        {
            TWebUserControl_config_welcome result;


            Session.Remove("UserControl_config_welcome.p");
            result = this;
            return result;
        }

    } // end TWebUserControl_config_welcome

}
