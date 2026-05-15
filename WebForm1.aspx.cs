using ki.web_ui;
using System;

namespace WebForm1
{
    public partial class TWebForm1 : page_class
    {

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
        Label_my_great_label.Text = DateTime.Now.ToString();
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

    } // end TWebForm1

}

namespace WebForm1.Units
{
    public class WebForm1
    {
    } // end WebForm1

}

