unit WebForm1;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  System.Web.Security, System.Web.UI.WebControls.WebParts, System.Configuration,
  UserControl_attachment_explorer;

type
  TWebForm1 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure Button1_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    procedure PostDelete(basename: string);
  strict protected
    UserControl_attachment_explorer_control: TWebUserControl_attachment_explorer;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  kix,
  system.io;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm1.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm1.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  UserControl_attachment_explorer_control.OnDelete := PostDelete;
  UserControl_attachment_explorer_control.Bind(path.GetDirectoryName(request.physicalpath) + '\scratch');
end;

procedure TWebForm1.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm1.Button1_Click(sender: System.Object; e: System.EventArgs);
var
  basename: string;
begin
  basename := UserControl_attachment_explorer_control.Save;
  if basename <> EMPTY then begin
    Label1.text := 'Just attached ' + basename;
  end;
end;

procedure TWebForm1.PostDelete(basename: string);
begin
  Label1.text := 'Just deleted ' + basename;
end;

end.

