unit UserControl_attachment_explorer;

interface

uses
  ki_web_ui,
  kix,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  p_type =
    RECORD
    be_enabled: boolean;
    be_loaded: boolean;
    path: string;
    END;
  [ParseChildren(ChildrenAsProperties = true)]
  TWebUserControl_attachment_explorer = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_attachment_explorer_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure GridView_attachments_RowDeleting(sender: System.Object; e: System.Web.UI.WebControls.GridViewDeleteEventArgs);
    procedure GridView_attachments_RowDataBound(sender: System.Object; e: System.Web.UI.WebControls.GridViewRowEventArgs);
    procedure GridView_attachments_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    function BeEnabled: boolean;
    function GetPath: string;
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    procedure SetEnabled(be_enabled: boolean);
    procedure SetPath(path: string);
  strict protected
    FileUpload_control: System.Web.UI.WebControls.FileUpload;
    GridView_attachments: System.Web.UI.WebControls.GridView;
    Image_paperclip: System.Web.UI.HtmlControls.HtmlImage;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    OnDelete: procedure(basename: string) of object;
  published
    property enabled: boolean read BeEnabled write SetEnabled;
    property path: string read GetPath write SetPath;
    procedure Bind(path: string = EMPTY);
    function Fresh: TWebUserControl_attachment_explorer;
    function Save: string;
  end;

implementation

uses
  System.Collections,
  system.configuration,
  system.io;

const
  TCI_LINKBUTTON = 0;
  TCI_DELETE_INITIALLY = 1;
  TCI_ITEM_INITIALLY = 2;
  TCI_ITEM_SUBSEQUENTLY = TCI_ITEM_INITIALLY + 1;

procedure TWebUserControl_attachment_explorer.InjectPersistentClientSideScript;
begin
//  EstablishClientSideFunction(EL);
//  EstablishClientSideFunction(KGS_TO_LBS);
//  EstablishClientSideFunction(LBS_TO_KGS);
//  EstablishClientSideFunction
//    (
//    'RecalculateDependentValues()',
//    EMPTY
//    + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
//    +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
//    + NEW_LINE
//    + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
//    );
//  //
//  TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
//  TextBox_gross_landed_weight_in_pounds.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_gross_landed_weight_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_landed_or_ciq_tare.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_net_landed_in_pounds.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_net_landed_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
end;

procedure TWebUserControl_attachment_explorer.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    Image_paperclip.src := ExpandTildePath(Image_paperclip.src);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

procedure TWebUserControl_attachment_explorer.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session[self.id + '.p'] <> nil)
    and (session[self.id + '.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session[self.id + '.p']);
  end else begin
    //
    p.be_enabled := TRUE;
    p.be_loaded := FALSE;
    p.path := EMPTY;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_attachment_explorer.InitializeComponent;
begin
  Include(Self.GridView_attachments.RowDataBound, Self.GridView_attachments_RowDataBound);
  Include(Self.GridView_attachments.SelectedIndexChanged, Self.GridView_attachments_SelectedIndexChanged);
  Include(Self.GridView_attachments.RowDeleting, Self.GridView_attachments_RowDeleting);
  Include(Self.PreRender, Self.TWebUserControl_attachment_explorer_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_attachment_explorer.TWebUserControl_attachment_explorer_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_attachment_explorer.p');
  session.Add('UserControl_attachment_explorer.p',p);
end;

function TWebUserControl_attachment_explorer.Fresh: TWebUserControl_attachment_explorer;
begin
  session.Remove('UserControl_attachment_explorer.p');
  Fresh := self;
end;

function TWebUserControl_attachment_explorer.BeEnabled: boolean;
begin
  BeEnabled := p.be_enabled;
end;

function TWebUserControl_attachment_explorer.GetPath: string;
begin
  GetPath := p.path;
end;

procedure TWebUserControl_attachment_explorer.SetEnabled(be_enabled: boolean);
begin
  FileUpload_control.enabled := be_enabled;
  GridView_attachments.enabled := be_enabled;
  p.be_enabled := be_enabled;
end;

procedure TWebUserControl_attachment_explorer.SetPath(path: string);
begin
  p.path := path;
end;

procedure TWebUserControl_attachment_explorer.Bind(path: string = EMPTY);
begin
  //
  if path <> EMPTY then begin
    p.path := path;
  end;
  //
  if directory.Exists(p.path) then begin
    GridView_attachments.datasource := directory.GetFiles(p.path);
    GridView_attachments.DataBind;
  end;
  //
end;

function TWebUserControl_attachment_explorer.Save: string;
var
  s: string;
begin
  s := EMPTY;
  if FileUpload_control.HasFile then begin
    s := system.io.path.GetFileName(FileUpload_control.filename);
    FileUpload_control.SaveAs(p.path + '\' + s);
    Bind;
  end;
  Save := s;
end;

procedure TWebUserControl_attachment_explorer.GridView_attachments_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  FileDownload(page,GridView_attachments.selectedrow.cells.item[TCI_ITEM_SUBSEQUENTLY].text);
end;

procedure TWebUserControl_attachment_explorer.GridView_attachments_RowDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewRowEventArgs);
var
  tablecell_spacer: tablecell;
begin
  if e.row.rowtype = datacontrolrowtype.datarow then begin
    linkbutton(e.row.cells.item[TCI_LINKBUTTON].controls.item[0]).text := EMPTY
    + ExpandTildePath('<IMG src="~/usercontrol/ki/image/paperclip_16x16.gif" alt="Attachment" border="0" height="16" width="16" />')
    + system.io.path.GetFileName(e.row.cells.item[TCI_ITEM_INITIALLY].text);
    linkbutton(e.row.cells.item[TCI_DELETE_INITIALLY].controls.item[0]).text :=
      ExpandTildePath(linkbutton(e.row.cells.item[TCI_DELETE_INITIALLY].controls.item[0]).text);
    e.row.cells.item[TCI_ITEM_INITIALLY].visible := FALSE;
    tablecell_spacer := tablecell.Create;
    tablecell_spacer.text := '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
    e.row.cells.AddAt(TCI_DELETE_INITIALLY,tablecell_spacer);
  end;
end;

procedure TWebUserControl_attachment_explorer.GridView_attachments_RowDeleting(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewDeleteEventArgs);
var
  basespec: string;
  fullspec: string;
begin
  fullspec := string_array(GridView_attachments.datasource)[e.rowindex];
  basespec := system.io.path.GetFileName(fullspec);
  &file.Delete(fullspec);
  if assigned(OnDelete) then begin
    OnDelete(basespec);
  end;
  Bind;
end;

end.
