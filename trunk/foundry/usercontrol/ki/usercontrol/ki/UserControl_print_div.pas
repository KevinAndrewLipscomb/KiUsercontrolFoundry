unit UserControl_print_div;

interface

uses System.Data, System.Drawing, System.Web, System.Web.UI,
     System.Web.UI.WebControls, System.Web.UI.HtmlControls;
     
type
    /// <summary>
    /// Summary description for WebUserControl1.
    /// </summary>
  TWebUserControl_print_div = class(System.Web.UI.UserControl)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    function GetText: string;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    procedure SetText(text: string);
  strict protected
    HtmlAnchor_print: System.Web.UI.HtmlControls.HtmlAnchor;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    property text: string read GetText write SetText;
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_print_div.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

function TWebUserControl_print_div.GetText: string;
begin
  GetText := HtmlAnchor_print.innertext;
end;

procedure TWebUserControl_print_div.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  // TODO: Put user code to initialize the page here
end;

procedure TWebUserControl_print_div.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebUserControl_print_div.SetText(text: string);
begin
  HtmlAnchor_print.innertext := text;
end;
                                     
end.
