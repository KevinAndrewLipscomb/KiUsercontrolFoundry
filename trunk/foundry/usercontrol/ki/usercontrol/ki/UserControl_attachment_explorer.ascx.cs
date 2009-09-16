using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;


using System.IO;
using System.Collections.Specialized;
namespace UserControl_attachment_explorer
{
    public struct p_type
    {
        public bool be_enabled;
        public bool be_loaded;
        public string path;
    } // end p_type

    // [ParseChildren(ChildrenAsProperties = true)]
    public partial class TWebUserControl_attachment_explorer: ki_web_ui.usercontrol_class
    {

        public bool enabled
        {
          get {
            bool result;
            result = p.be_enabled;
            return result;
          }
          set {
            FileUpload_control.Enabled = value;
            GridView_attachments.Enabled = value;
            p.be_enabled = value;
          }
        }
        public string path
        {
          get {
            string result;
            result = p.path;
            return result;
          }
          set {
            p.path = value;
          }
        }
        private p_type p;
        public delegate void on_delete_type(string basename);
        public on_delete_type OnDelete;
        private void InjectPersistentClientSideScript()
        {
            // EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
            // EstablishClientSideFunction(k.client_side_function_enumeral_type.KGS_TO_LBS);
            // EstablishClientSideFunction(k.client_side_function_enumeral_type.LBS_TO_KGS);
            // EstablishClientSideFunction
            // (
            // 'RecalculateDependentValues()',
            // k.EMPTY
            // + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
            // +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
            // );
            // //
            // TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
            // TextBox_gross_landed_weight_in_pounds.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_gross_landed_weight_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_landed_or_ciq_tare.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_net_landed_in_pounds.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_net_landed_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );

        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {

                Image_paperclip.Src = k.ExpandTildePath(Image_paperclip.Src);
                p.be_loaded = true;
            }
            InjectPersistentClientSideScript();

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);









            if (IsPostBack && (Session[this.ID + ".p"] != null) && (Session[this.ID + ".p"].GetType().Namespace == p.GetType().Namespace))
            {


                p = (p_type)(Session[this.ID + ".p"]);
            }
            else
            {
                p.be_enabled = true;
                p.be_loaded = false;

                p.path = k.EMPTY;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.GridView_attachments.RowDataBound += new System.Web.UI.WebControls.GridViewRowEventHandler(this.GridView_attachments_RowDataBound);
            this.GridView_attachments.RowDeleting += new System.Web.UI.WebControls.GridViewDeleteEventHandler(this.GridView_attachments_RowDeleting);

            this.PreRender += this.TWebUserControl_attachment_explorer_PreRender;

            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_attachment_explorer_PreRender(object sender, System.EventArgs e)
        {

            SessionSet("UserControl_attachment_explorer.p", p);
        }

        public TWebUserControl_attachment_explorer Fresh()
        {
            TWebUserControl_attachment_explorer result;


            Session.Remove("UserControl_attachment_explorer.p");
            result = this;
            return result;
        }

        public void Bind(string path)
        {


            if (path != k.EMPTY)
            {
                p.path = path;
            }
            if (Directory.Exists(p.path))
            {
                GridView_attachments.DataSource = Directory.GetFiles(p.path);
                GridView_attachments.DataBind();
            }

        }

        public void Bind()
        {
            Bind(k.EMPTY);
        }

        public string Save()
        {
            string result;
            string s;

            s = k.EMPTY;
            if (FileUpload_control.HasFile)
            {
                s = System.IO.Path.GetFileName(FileUpload_control.FileName);
                FileUpload_control.SaveAs(p.path + "\\" + s);
                Bind();
            }
            result = s;
            return result;
        }

        protected void GridView_attachments_SelectedIndexChanged(object sender, System.EventArgs e)
        {

            FileDownload(Page, GridView_attachments.SelectedRow.Cells[Units.UserControl_attachment_explorer.TCI_ITEM_SUBSEQUENTLY].Text);
        }

        private void GridView_attachments_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            TableCell tablecell_spacer;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {


                ((e.Row.Cells[Units.UserControl_attachment_explorer.TCI_LINKBUTTON].Controls[0]) as LinkButton).Text = k.EMPTY + k.ExpandTildePath("<IMG src=\"~/usercontrol/ki/image/paperclip_16x16.gif\" alt=\"Attachment\" border=\"0\" height=\"16\" width=\"16\" />") + System.IO.Path.GetFileName(e.Row.Cells[Units.UserControl_attachment_explorer.TCI_ITEM_INITIALLY].Text);

                ((e.Row.Cells[Units.UserControl_attachment_explorer.TCI_DELETE_INITIALLY].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Row.Cells[Units.UserControl_attachment_explorer.TCI_DELETE_INITIALLY].Controls[0]) as LinkButton).Text);
                e.Row.Cells[Units.UserControl_attachment_explorer.TCI_ITEM_INITIALLY].Visible = false;
                tablecell_spacer = new TableCell();
                tablecell_spacer.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                e.Row.Cells.AddAt(Units.UserControl_attachment_explorer.TCI_DELETE_INITIALLY, tablecell_spacer);
            }
        }

        private void GridView_attachments_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            string basespec;
            string fullspec;

            fullspec = ((string[])(GridView_attachments.DataSource))[e.RowIndex];
            basespec = System.IO.Path.GetFileName(fullspec);
            System.IO.File.Delete(fullspec);
            if ((OnDelete != null))
            {
                OnDelete(basespec);
            }
            Bind();
        }

    } // end TWebUserControl_attachment_explorer

}

namespace UserControl_attachment_explorer.Units
{
    public class UserControl_attachment_explorer
    {
        public const int TCI_LINKBUTTON = 0;
        public const int TCI_DELETE_INITIALLY = 1;
        public const int TCI_ITEM_INITIALLY = 2;
        public const int TCI_ITEM_SUBSEQUENTLY = TCI_ITEM_INITIALLY + 1;
    } // end UserControl_attachment_explorer

}

