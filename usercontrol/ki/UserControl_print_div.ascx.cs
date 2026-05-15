using ki.web_ui;
using kix;

namespace UserControl_print_div
{
    public partial class TWebUserControl_print_div: usercontrol_class
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
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            LinkButton_print.Attributes.Add("onclick", "javascript:CallPrint(\'Div_print_area\');");

            LinkButton_print.Text = k.ExpandTildePath(LinkButton_print.Text);
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

    } // end TWebUserControl_print_div

}
