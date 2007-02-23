unit UserControl_drop_down_date;

interface

uses System.Data, System.Drawing, System.Web, System.Web.UI,
     System.Web.UI.WebControls, System.Web.UI.HtmlControls;
     
type
    /// <summary>
    /// Summary description for WebUserControl1.
    /// </summary>
  [ParseChildren(ChildrenAsProperties = true)]
  TWebUserControl_drop_down_date = class(System.Web.UI.UserControl)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_drop_down_date_PreRender(sender: System.Object; 
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    var the_min_year: integer; function GetMinYear: string; procedure SetMinYear(min_year: string);
    var the_max_year: integer; function GetMaxYear: string; procedure SetMaxYear(max_year: string);
    var the_selected_value: datetime; function GetSelectedValue: datetime; procedure SetSelectedValue(selectedvalue: datetime);
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    DropDownList_year: System.Web.UI.WebControls.DropDownList;
    DropDownList_month: System.Web.UI.WebControls.DropDownList;
    DropDownList_day: System.Web.UI.WebControls.DropDownList;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    property maxyear: string read GetMaxYear write SetMaxYear;
    property minyear: string read GetMinYear write SetMinYear;
    property selectedvalue: datetime read GetSelectedValue write SetSelectedValue;
  end;

implementation

uses
  ki;

procedure TWebUserControl_drop_down_date.Page_Load(sender: System.Object; e: System.EventArgs);
var
  i: cardinal;
begin
  DropDownList_month.items.Add(ListItem.Create('Jan','1'));
  DropDownList_month.items.Add(ListItem.Create('Feb','2'));
  DropDownList_month.items.Add(ListItem.Create('Mar','3'));
  DropDownList_month.items.Add(ListItem.Create('Apr','4'));
  DropDownList_month.items.Add(ListItem.Create('May','5'));
  DropDownList_month.items.Add(ListItem.Create('Jun','6'));
  DropDownList_month.items.Add(ListItem.Create('Jul','7'));
  DropDownList_month.items.Add(ListItem.Create('Aug','8'));
  DropDownList_month.items.Add(ListItem.Create('Sep','9'));
  DropDownList_month.items.Add(ListItem.Create('Oct','10'));
  DropDownList_month.items.Add(ListItem.Create('Nov','11'));
  DropDownList_month.items.Add(ListItem.Create('Dec','12'));
  DropDownList_month.selectedvalue := the_selected_value.Month.tostring;
  for i := 1 to 31 do begin
    DropDownList_day.items.Add(ListItem.Create(i.tostring,i.tostring));
  end;
  DropDownList_day.selectedvalue := the_selected_value.Day.tostring;
  for i := the_min_year to the_max_year do begin
    DropDownList_year.items.Add(ListItem.Create(i.tostring,i.tostring));
  end;
  DropDownList_year.selectedvalue := the_selected_value.Year.tostring;
end;

procedure TWebUserControl_drop_down_date.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebUserControl_drop_down_date.TWebUserControl_drop_down_date_PreRender(sender: System.Object;
  e: System.EventArgs);
begin

end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_drop_down_date.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_drop_down_date_PreRender);
end;
{$ENDREGION}

function TWebUserControl_drop_down_date.GetMaxYear: string;
begin
  GetMaxYear := the_max_year.tostring;
end;

function TWebUserControl_drop_down_date.GetMinYear: string;
begin
  GetMinYear := the_min_year.tostring;
end;

function TWebUserControl_drop_down_date.GetSelectedValue: datetime;
begin
  the_selected_value := datetime.Create
    (
    int32.Parse(Safe(DropDownList_year.selectedvalue,NUM)),
    uint32.Parse(Safe(DropDownList_month.selectedvalue,NUM)),
    uint32.Parse(Safe(DropDownList_day.selectedvalue,NUM))
    );
  GetSelectedValue := the_selected_value;
end;

procedure TWebUserControl_drop_down_date.SetMaxYear(max_year: string);
begin
  the_max_year := int32.Parse(max_year);
end;

procedure TWebUserControl_drop_down_date.SetMinYear(min_year: string);
begin
  the_min_year := int32.Parse(min_year);
end;

procedure TWebUserControl_drop_down_date.SetSelectedValue(selectedvalue: datetime);
var
  min_datetime: datetime;
  max_datetime: datetime;
begin
  min_datetime := datetime.Create(the_min_year,1,1);
  max_datetime := datetime.Create(the_max_year,12,31);
  if selectedvalue < min_datetime then begin
    the_selected_value := min_datetime;
  end else if selectedvalue > max_datetime then begin
    the_selected_value := max_datetime;
  end else begin
    the_selected_value := selectedvalue;
  end;
end;

end.
