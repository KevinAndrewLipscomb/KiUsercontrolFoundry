unit UserControl_bread_crumb_trail;

interface

uses
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  p_type =
    RECORD
    be_loaded: boolean;
    END;
  TWebUserControl_bread_crumb_trail = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_bread_crumb_trail_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DataList_trail_ItemCommand(source: System.Object; e: System.Web.UI.WebControls.DataListCommandEventArgs);
    procedure DataList_trail_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataListItemEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    DataList_trail: System.Web.UI.WebControls.DataList;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_bread_crumb_trail;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration,
  system.io;

procedure TWebUserControl_bread_crumb_trail.Page_Load(sender: System.Object; e: System.EventArgs);
var
  i: cardinal;
  num_waypoints: cardinal;
  q: queue;
  waypoint_stack: stack;
begin
  //
  if not p.be_loaded then begin
    //
    if session['waypoint_stack'] <> nil then begin
      waypoint_stack := stack.Create(stack(session['waypoint_stack']));
      num_waypoints := waypoint_stack.count;
      if num_waypoints > 0 then begin
        q := queue.Create;
        for i := 1 to waypoint_stack.count do begin
          q.Enqueue(path.GetFileNameWithoutExtension(waypoint_stack.Pop.tostring));
        end;
        DataList_trail.datasource := q;
        DataList_trail.databind;
        DataList_trail.visible := TRUE;
      end;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_bread_crumb_trail.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_bread_crumb_trail.p'] <> nil)
    and (session['UserControl_bread_crumb_trail.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_bread_crumb_trail.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    //
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_bread_crumb_trail.InitializeComponent;
begin
  Include(Self.DataList_trail.ItemCommand, Self.DataList_trail_ItemCommand);
  Include(Self.DataList_trail.ItemDataBound, Self.DataList_trail_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_bread_crumb_trail_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_bread_crumb_trail.TWebUserControl_bread_crumb_trail_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_bread_crumb_trail.p',p);
end;

function TWebUserControl_bread_crumb_trail.Fresh: TWebUserControl_bread_crumb_trail;
begin
  session.Remove('UserControl_bread_crumb_trail.p');
  Fresh := self;
end;

procedure TWebUserControl_bread_crumb_trail.DataList_trail_ItemDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.DataListItemEventArgs);
begin
  if e.item.itemType = listitemtype.FOOTER then begin
    &label(e.item.controls[0]).text := ' / ' + path.GetFileNameWithoutExtension(request.CurrentExecutionFilePath);
  end;
end;

procedure TWebUserControl_bread_crumb_trail.DataList_trail_ItemCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataListCommandEventArgs);
var
  max_stack_index: cardinal;
  valid: boolean;
  i: cardinal;
begin
  max_stack_index := 0;
  valid := TRUE;
  try
    max_stack_index := stack(session['waypoint_stack']).count - 1;
  except
    on ERANGEERROR do valid := FALSE;
  end;
  if valid then begin
    for i := max_stack_index downto e.item.itemindex do begin
      stack(session['waypoint_stack']).Pop;
    end;
    server.Transfer(linkbutton(e.commandsource).text + '.aspx');
  end;
end;

end.
