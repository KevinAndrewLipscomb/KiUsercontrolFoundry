// Derived from UserControl~template~std.ascx.cs~template

using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;
using UserControl_drop_down_time_of_day;

namespace UserControl_drop_down_datetime
  {
  public static class UserControl_drop_down_datetime_Static
    {
    public static int MIN_CONSISTENTLY_REPRESENTABLE_YEAR = UserControl_drop_down_date_Static.MIN_CONSISTENTLY_REPRESENTABLE_YEAR;
    public static int MAX_CONSISTENTLY_REPRESENTABLE_YEAR = UserControl_drop_down_date_Static.MAX_CONSISTENTLY_REPRESENTABLE_YEAR;
    public static DateTime NONE = DateTime.MinValue;
    }

  public struct p_type
    {
    public bool be_enabled;
    public bool be_loaded;
    public DateTime selected_value;
    }

  public partial class TWebUserControl_drop_down_datetime: ki_web_ui.usercontrol_class
    {
    public bool enabled
      {
      get
        {
        return p.be_enabled;
        }
      set
        {
        UserControl_drop_down_date_control.enabled = value;
        UserControl_drop_down_time_of_day_control.enabled = value;
        p.be_enabled = value;
        }
      }
    public bool isvalid
      {
      get
        {
        return UserControl_drop_down_date_control.isvalid;
        }
      }
    public string maxyear
      {
      get
        {
        return UserControl_drop_down_date_control.maxyear;
        }
      set
        {
        UserControl_drop_down_date_control.maxyear = value;
        }
      }
    public int minute_intervals
      {
      get
        {
        return UserControl_drop_down_time_of_day_control.minute_intervals;
        }
      set
        {
        UserControl_drop_down_time_of_day_control.minute_intervals = value;
        }
      }
    public string minyear
      {
      get
        {
        return UserControl_drop_down_date_control.minyear;
        }
      set
        {
        UserControl_drop_down_date_control.minyear = value;
        }
      }
    public DateTime selectedvalue
      {
      get
        {
        p.selected_value = DateTime.Parse(UserControl_drop_down_date_control.selectedvalue.ToString("yyyy-MM-dd ") + UserControl_drop_down_time_of_day_control.selectedvalue);
        return p.selected_value;
        }
      set
        {
        UserControl_drop_down_date_control.selectedvalue = value;
        if (value == UserControl_drop_down_datetime_Static.NONE)
          {
          UserControl_drop_down_time_of_day_control.selectedvalue = k.EMPTY;
          }
        else
          {
          UserControl_drop_down_time_of_day_control.selectedvalue = value.ToString("HH:mm");
          }
        p.selected_value = value;
        }
      }

    private p_type p;

    public void Clear()
      {
      p.selected_value = UserControl_drop_down_datetime_Static.NONE;
      UserControl_drop_down_date_control.Clear();
      UserControl_drop_down_time_of_day_control.Clear();
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_drop_down_datetime.p"] != null)
        {
        p = (p_type)(Session["UserControl_drop_down_datetime.p"]);
        p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_drop_down_datetime");
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
      this.PreRender += this.TWebUserControl_drop_down_datetime_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_drop_down_datetime_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_drop_down_datetime.p", p);
      }

    public TWebUserControl_drop_down_datetime Fresh()
      {
      UserControl_drop_down_date_control.Fresh();
      UserControl_drop_down_time_of_day_control.Fresh();
      Session.Remove("UserControl_drop_down_datetime.p");
      return this;
      }

    } // end TWebUserControl_drop_down_datetime

  }
