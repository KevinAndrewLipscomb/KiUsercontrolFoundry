unit UserControl_drop_down_date;

interface

uses System.Data, System.Drawing, System.Web, System.Web.UI,
     System.Web.UI.WebControls, System.Web.UI.HtmlControls,
     ki_web_ui;

const
  MIN_CONSISTENTLY_REPRESENTABLE_YEAR = 1000; // Driven by MySQL DATETIME type
  MAX_CONSISTENTLY_REPRESENTABLE_YEAR = 9999; // Driven by MySQL DATETIME type and .Net datetime type
  NONE: datetime = datetime.minvalue;

type
  //
  // Support types
  //
  consistently_representable_year_range = MIN_CONSISTENTLY_REPRESENTABLE_YEAR..MAX_CONSISTENTLY_REPRESENTABLE_YEAR;
  //
  // Class type
  //
  [ParseChildren(ChildrenAsProperties = true)]
  TWebUserControl_drop_down_date = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_drop_down_date_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_today_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        be_enabled: boolean;
        be_loaded: boolean;
        min_year: consistently_representable_year_range;
        max_year: consistently_representable_year_range;
        selected_value: datetime;
        END;
  strict private
    p: p_type;
    function BeEnabled: boolean;
    function BeValid: boolean;
    function GetMaxYear: string;
    function GetMinYear: string;
    function GetSelectedValue: datetime; procedure SetSelectedValue(selectedvalue: datetime);
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    procedure SetChildSelectedValues;
    procedure SetEnabled(be_enabled: boolean);
    procedure SetMaxYear(max_year: string);
    procedure SetMinYear(min_year: string);
  strict protected
    DropDownList_year: System.Web.UI.WebControls.DropDownList;
    DropDownList_month: System.Web.UI.WebControls.DropDownList;
    DropDownList_day: System.Web.UI.WebControls.DropDownList;
    Button_today: System.Web.UI.WebControls.Button;
    UpdatePanel_control: System.Web.UI.UpdatePanel;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    property enabled: boolean read BeEnabled write SetEnabled;
    property isvalid: boolean read BeValid;
    property maxyear: string read GetMaxYear write SetMaxYear;
    property minyear: string read GetMinYear write SetMinYear;
    property selectedvalue: datetime read GetSelectedValue write SetSelectedValue;
    function Fresh: TWebUserControl_drop_down_date;
    procedure Clear;
  end;

implementation

uses
  kix;

function TWebUserControl_drop_down_date.BeEnabled: boolean;
begin
  BeEnabled := p.be_enabled;
end;

function TWebUserControl_drop_down_date.BeValid: boolean;
begin
  try
    datetime.Create
      (
      uint32.Parse(Safe(DropDownList_year.selectedvalue,NUM)),
      uint32.Parse(Safe(DropDownList_month.selectedvalue,NUM)),
      uint32.Parse(Safe(DropDownList_day.selectedvalue,NUM))
      );
    BeValid := TRUE;
  except
    BeValid := FALSE;
  end;
end;

procedure TWebUserControl_drop_down_date.Clear;
begin
  p.selected_value := NONE;
  DropDownList_month.selectedindex := 0;
  DropDownList_day.selectedindex := 0;
  DropDownList_year.selectedindex := 0;
end;

procedure TWebUserControl_drop_down_date.Button_today_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.selected_value := datetime.Today;
  SetChildSelectedValues;
end;

procedure TWebUserControl_drop_down_date.Page_Load(sender: System.Object; e: System.EventArgs);
var
  i: cardinal;
begin
  if not p.be_loaded then begin
    //
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
    for i := 1 to 31 do begin
      DropDownList_day.items.Add(ListItem.Create(i.tostring,i.tostring));
    end;
    for i := p.min_year to p.max_year do begin
      DropDownList_year.items.Add(ListItem.Create(i.tostring,i.tostring));
    end;
    if p.selected_value = NONE then begin
      DropDownList_month.items.Insert(0,ListItem.Create('',''));
      DropDownList_day.items.Insert(0,ListItem.Create('',''));
      DropDownList_year.items.Insert(0,ListItem.Create('',''));
    end else begin
      SetChildSelectedValues;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
end;

procedure TWebUserControl_drop_down_date.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if assigned(session[self.uniqueid + '.p']) then begin
    p := p_type(session[self.uniqueid + '.p']);
    p.be_loaded := FALSE;
  end else begin
    //
    p.be_enabled := TRUE;
    p.be_loaded := FALSE;
    p.min_year := MIN_CONSISTENTLY_REPRESENTABLE_YEAR;
    p.max_year := MAX_CONSISTENTLY_REPRESENTABLE_YEAR;
    p.selected_value := NONE;
    //
  end;
end;

procedure TWebUserControl_drop_down_date.TWebUserControl_drop_down_date_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove(self.uniqueid + '.p');
  session.Add(self.uniqueid + '.p',p);
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_drop_down_date.InitializeComponent;
begin
  Include(Self.Button_today.Click, Self.Button_today_Click);
  Include(Self.PreRender, Self.TWebUserControl_drop_down_date_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

function TWebUserControl_drop_down_date.GetMaxYear: string;
begin
  GetMaxYear := uint32(p.max_year).tostring;
end;

function TWebUserControl_drop_down_date.GetMinYear: string;
begin
  GetMinYear := uint32(p.min_year).tostring;
end;

function TWebUserControl_drop_down_date.GetSelectedValue: datetime;
begin
  if BeValid then begin
    p.selected_value := datetime.Create
      (
      int32.Parse(Safe(DropDownList_year.selectedvalue,NUM)),
      uint32.Parse(Safe(DropDownList_month.selectedvalue,NUM)),
      uint32.Parse(Safe(DropDownList_day.selectedvalue,NUM))
      );
    GetSelectedValue := p.selected_value;
  end else begin
    GetSelectedValue := NONE;
  end;
end;

procedure TWebUserControl_drop_down_date.SetChildSelectedValues;
begin
  if p.selected_value = NONE then begin
    DropDownList_month.selectedindex := -1;
    DropDownList_day.selectedindex := -1;
    DropDownList_year.selectedindex := -1;
  end else begin
    DropDownList_month.selectedvalue := p.selected_value.Month.tostring;
    DropDownList_day.selectedvalue := p.selected_value.Day.tostring;
    DropDownList_year.selectedvalue := p.selected_value.Year.tostring;
  end;
end;

procedure TWebUserControl_drop_down_date.SetEnabled(be_enabled: boolean);
begin
  DropDownList_month.enabled := be_enabled;
  DropDownList_day.enabled := be_enabled;
  DropDownList_year.enabled := be_enabled;
  Button_today.enabled := be_enabled;
  p.be_enabled := be_enabled;
end;

procedure TWebUserControl_drop_down_date.SetMaxYear(max_year: string);
begin
  p.max_year := math.Min(uint32.Parse(max_year),MAX_CONSISTENTLY_REPRESENTABLE_YEAR);
end;

procedure TWebUserControl_drop_down_date.SetMinYear(min_year: string);
begin
  p.min_year := math.Max(uint32.Parse(min_year),MIN_CONSISTENTLY_REPRESENTABLE_YEAR);
end;

procedure TWebUserControl_drop_down_date.SetSelectedValue(selectedvalue: datetime);
var
  min_datetime: datetime;
  max_datetime: datetime;
begin
  if selectedvalue = NONE then begin
    p.selected_value := NONE;
  end else begin
    min_datetime := datetime.Create(p.min_year,1,1);
    max_datetime := datetime.Create(p.max_year,12,31);
    if selectedvalue < min_datetime then begin
      p.selected_value := min_datetime;
    end else if selectedvalue > max_datetime then begin
      p.selected_value := max_datetime;
    end else begin
      p.selected_value := selectedvalue;
    end;
  end;
  SetChildSelectedValues;
end;

function TWebUserControl_drop_down_date.Fresh: TWebUserControl_drop_down_date;
begin
  session.Remove(self.id + '.p');
  Fresh := self;
end;

end.
