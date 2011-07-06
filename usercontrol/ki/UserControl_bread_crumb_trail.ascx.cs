using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using System.IO;
namespace UserControl_bread_crumb_trail
{
    public struct p_type
    {
        public bool be_loaded;
    } // end p_type

    public partial class TWebUserControl_bread_crumb_trail: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            uint i;
            uint num_waypoints;
            Queue q;
            Stack waypoint_stack;
            if (!p.be_loaded)
            {

                if (Session["waypoint_stack"] != null)
                {

                    waypoint_stack = new Stack(((Session["waypoint_stack"]) as Stack));
                    num_waypoints = (uint)(waypoint_stack.Count);
                    if (num_waypoints > 0)
                    {
                        q = new Queue();
                        for (i = 1; i <= num_waypoints; i ++ )
                        {
                            q.Enqueue(Path.GetFileNameWithoutExtension(waypoint_stack.Pop().ToString()));
                        }
                        DataList_trail.DataSource = q;
                        DataList_trail.DataBind();
                        DataList_trail.Visible = true;
                    }
                }
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);







            if (IsPostBack && (Session[InstanceId() + ".p"] != null))
            {

                p = (p_type)(Session[InstanceId() + ".p"]);
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
            this.DataList_trail.ItemCommand += new System.Web.UI.WebControls.DataListCommandEventHandler(this.DataList_trail_ItemCommand);
            this.DataList_trail.ItemDataBound += new System.Web.UI.WebControls.DataListItemEventHandler(this.DataList_trail_ItemDataBound);

            //this.Load += this.Page_Load;

            this.PreRender += this.TWebUserControl_bread_crumb_trail_PreRender;
        }

        private void TWebUserControl_bread_crumb_trail_PreRender(object sender, System.EventArgs e)
        {

            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_bread_crumb_trail Fresh()
        {
            TWebUserControl_bread_crumb_trail result;


            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        private void DataList_trail_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Footer)
            {


                ((e.Item.Controls[0]) as Label).Text = " / " + Path.GetFileNameWithoutExtension(Request.CurrentExecutionFilePath);
            }
        }

        private void DataList_trail_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
          {
          if (((Session["waypoint_stack"]) as Stack).Count > 0)
            {
            int i;
            for (i = ((Session["waypoint_stack"]) as Stack).Count - 1; i >= Math.Max(e.Item.ItemIndex, 0); i-- )
              {
              ((Session["waypoint_stack"]) as Stack).Pop();
              }
            Server.Transfer(((e.CommandSource) as LinkButton).Text + ".aspx");
            }
          }

    } // end TWebUserControl_bread_crumb_trail

}
