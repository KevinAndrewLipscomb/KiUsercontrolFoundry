using kix;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace UserControl_attachment_explorer
  {
  public static class UserControl_attachment_explorer_Static
    {
    public const int TCI_LINKBUTTON = 0;
    public const int TCI_DELETE_INITIALLY = 1;
    public const int TCI_ITEM_INITIALLY = 2;
    public const int TCI_DELETE_SUBSEQUENTLY = TCI_DELETE_INITIALLY + 1;
    public const int TCI_ITEM_SUBSEQUENTLY = TCI_ITEM_INITIALLY + 1;
    }

  public delegate void on_delete_type(string basename);
  public delegate void on_save_type(string basename);

  public struct p_type
    {
    public bool be_empty;
    public bool be_enabled;
    public bool be_loaded;
    public bool be_ok_to_add;
    public bool be_ok_to_delete;
    public string[] directory_file_string_array;
    public on_delete_type OnDelete;
    public on_save_type OnSave;
    public string path;
    }

  // [ParseChildren(ChildrenAsProperties = true)]
  public partial class TWebUserControl_attachment_explorer: ki_web_ui.usercontrol_class
    {
    public bool be_ok_to_add
      {
      get
        {
        return p.be_ok_to_add;
        }
      set
        {
        p.be_ok_to_add = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }
    public bool be_ok_to_delete
      {
      get
        {
        return p.be_ok_to_delete;
        }
      set
        {
        p.be_ok_to_delete = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }
    public bool be_empty
      {
      get
        {
        return p.be_empty;
        }
      }
    public bool enabled
      {
      get
        {
        return p.be_enabled;
        }
      set
        {
        FileUpload_control.Enabled = value;
        GridView_attachments.Enabled = value;
        p.be_enabled = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }
    public string path
      {
      get
        {
        return p.path;
        }
      set
        {
        p.path = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }
    private p_type p;
    public on_delete_type OnDelete
      {
      set
        {
        p.OnDelete = value;
        }
      }
    public on_save_type OnSave
      {
      set
        {
        p.OnSave = value;
        }
      }
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
      Bind();
      Panel_new.Visible = p.be_ok_to_add;
      InjectPersistentClientSideScript();
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
        p.be_empty = true;
        p.be_enabled = true;
        p.be_loaded = false;
        p.be_ok_to_add = false;
        p.be_ok_to_delete = false;
        p.directory_file_string_array = null;
        p.path = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      GridView_attachments.RowDataBound += new System.Web.UI.WebControls.GridViewRowEventHandler(this.GridView_attachments_RowDataBound);
      GridView_attachments.RowDeleting += new System.Web.UI.WebControls.GridViewDeleteEventHandler(this.GridView_attachments_RowDeleting);
      PreRender += this.TWebUserControl_attachment_explorer_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_attachment_explorer_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_attachment_explorer Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void Bind(string path)
      {
      if (path != k.EMPTY)
        {
        p.path = path;
        }
      if (Directory.Exists(p.path))
        {
        p.directory_file_string_array = Directory.GetFiles(p.path);
        GridView_attachments.DataSource = p.directory_file_string_array;
        GridView_attachments.DataBind();
        }
      p.be_empty = ((p.directory_file_string_array == null) || (p.directory_file_string_array.Length == 0));
      }

    public void Bind()
      {
      Bind(k.EMPTY);
      }

    private void GridView_attachments_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
      {
      TableCell tablecell_spacer;
      if (e.Row.RowType == DataControlRowType.DataRow)
        {
        ((e.Row.Cells[UserControl_attachment_explorer_Static.TCI_LINKBUTTON].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Row.Cells[UserControl_attachment_explorer_Static.TCI_LINKBUTTON].Controls[0]) as LinkButton).Text)
        + System.IO.Path.GetFileName(e.Row.Cells[UserControl_attachment_explorer_Static.TCI_ITEM_INITIALLY].Text);
        ((e.Row.Cells[UserControl_attachment_explorer_Static.TCI_DELETE_INITIALLY].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Row.Cells[UserControl_attachment_explorer_Static.TCI_DELETE_INITIALLY].Controls[0]) as LinkButton).Text);
        e.Row.Cells[UserControl_attachment_explorer_Static.TCI_ITEM_INITIALLY].Visible = false;
        tablecell_spacer = new TableCell();
        tablecell_spacer.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        e.Row.Cells.AddAt(UserControl_attachment_explorer_Static.TCI_DELETE_INITIALLY, tablecell_spacer);
        e.Row.Cells[UserControl_attachment_explorer_Static.TCI_DELETE_SUBSEQUENTLY].Visible = p.be_ok_to_delete;
        }
      }

    private void GridView_attachments_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
      {
      var fullspec = p.directory_file_string_array[e.RowIndex];
      var basespec = System.IO.Path.GetFileName(fullspec);
      System.IO.File.Delete(fullspec);
      if (p.OnDelete != null)
        {
        p.OnDelete(basespec);
        }
      Bind();
      }

    protected void Button_upload_Click(object sender, System.EventArgs e)
      {
      //
      // For this to work, the ASP.NET Machine Account (ASPNET) [on IIS5] or the NETWORK SERVICE account [on IIS7] must have write permission for the folder specified by p.path.  Configure this on the Security tab of the folder's Properties.  If the Security tab is missing, open Windows Explorer / Tools / Folder
      // Options... / View, and in the Advanced Settings, clear the "Use simple file sharing" checkbox.
      //
      if (FileUpload_control.HasFile)
        {
        if (!System.IO.Directory.Exists(p.path))
          {
          System.IO.Directory.CreateDirectory(p.path);
          }
        var basename = System.IO.Path.GetFileName(FileUpload_control.FileName);
        FileUpload_control.SaveAs(p.path + "\\" + basename);
        if (p.OnSave != null)
          {
          p.OnSave(basename);
          }
        Bind();
        }
      }

    protected void GridView_attachments_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
      {
      FileDownload(Page, p.directory_file_string_array[e.NewSelectedIndex]);
      }

    } // end TWebUserControl_attachment_explorer

  }