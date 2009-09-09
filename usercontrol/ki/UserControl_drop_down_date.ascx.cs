using MySql.Data.MySqlClient;








using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace UserControl_drop_down_date
{
    // Class type
    // [ParseChildren(ChildrenAsProperties = true)]
    public class TWebUserControl_drop_down_date: ki_web_ui.usercontrol_class
    {
        public bool enabled
        {
          get {
            bool result;
            result = p.be_enabled;
            return result;
          }
          set {
            DropDownList_month.Enabled = value;
            DropDownList_day.Enabled = value;
            DropDownList_year.Enabled = value;
            Button_today.Enabled = value;
            p.be_enabled = value;
          }
        }
        public bool isvalid
        {
          get {
            bool result;
            try {












                new DateTime(int.Parse(k.Safe(DropDownList_year.SelectedValue, k.safe_hint_type.NUM)), int.Parse(k.Safe(DropDownList_month.SelectedValue, k.safe_hint_type.NUM)), int.Parse(k.Safe(DropDownList_day.SelectedValue, k.safe_hint_type.NUM)));
                result = true;
            }
            catch {
                result = false;
            }
            return result;
          }
        }
        public string maxyear
        {
          get {
            string result;


            result = ((uint)(p.max_year)).ToString();
            return result;
          }
          set {




            p.max_year = Math.Min(uint.Parse(value), (uint)(Units.UserControl_drop_down_date.MAX_CONSISTENTLY_REPRESENTABLE_YEAR));
          }
        }
        public string minyear
        {
          get {
            string result;


            result = ((uint)(p.min_year)).ToString();
            return result;
          }
          set {




            p.min_year = Math.Max(uint.Parse(value), Units.UserControl_drop_down_date.MIN_CONSISTENTLY_REPRESENTABLE_YEAR);
          }
        }
        public DateTime selectedvalue
        {
          get {
            DateTime result;
            if (isvalid)
            {










                p.selected_value = new DateTime
                  (
                  int.Parse(k.Safe(DropDownList_year.SelectedValue, k.safe_hint_type.NUM)),
                  int.Parse(k.Safe(DropDownList_month.SelectedValue, k.safe_hint_type.NUM)),
                  int.Parse(k.Safe(DropDownList_day.SelectedValue, k.safe_hint_type.NUM))
                  );
                result = p.selected_value;
            }
            else
            {
                result = Units.UserControl_drop_down_date.NONE;
            }
            return result;
          }
          set {
            DateTime min_datetime;
            DateTime max_datetime;
            if (value == Units.UserControl_drop_down_date.NONE)
            {
                p.selected_value = Units.UserControl_drop_down_date.NONE;
            }
            else
            {
                min_datetime = new DateTime((int)p.min_year, 1, 1);
                max_datetime = new DateTime((int)p.max_year, 12, 31);
                if (value < min_datetime)
                {
                    p.selected_value = min_datetime;
                }
                else if (value > max_datetime)
                {
                    p.selected_value = max_datetime;
                }
                else
                {
                    p.selected_value = value;
                }
            }
            SetChildSelectedValues();
          }
        }
        private p_type p;
        protected System.Web.UI.WebControls.DropDownList DropDownList_year = null;
        protected System.Web.UI.WebControls.DropDownList DropDownList_month = null;
        protected System.Web.UI.WebControls.DropDownList DropDownList_day = null;
        protected System.Web.UI.WebControls.Button Button_today = null;
        protected System.Web.UI.UpdatePanel UpdatePanel_control = null;
        public void Clear()
        {
            p.selected_value = Units.UserControl_drop_down_date.NONE;
            DropDownList_month.SelectedIndex = 0;
            DropDownList_day.SelectedIndex = 0;
            DropDownList_year.SelectedIndex = 0;
        }

        private void Button_today_Click(object sender, System.EventArgs e)
        {


            p.selected_value = DateTime.Today;
            SetChildSelectedValues();
        }

        private void Page_Load(object sender, System.EventArgs e)
        {
            uint i;
            if ((DropDownList_month.Items.Count == 0))
            {
                // All three dropdownlists should have k.EMPTY item collections, so rebuild them.
                DropDownList_month.Items.Add(new ListItem("Jan", "1"));
                DropDownList_month.Items.Add(new ListItem("Feb", "2"));
                DropDownList_month.Items.Add(new ListItem("Mar", "3"));
                DropDownList_month.Items.Add(new ListItem("Apr", "4"));
                DropDownList_month.Items.Add(new ListItem("May", "5"));
                DropDownList_month.Items.Add(new ListItem("Jun", "6"));
                DropDownList_month.Items.Add(new ListItem("Jul", "7"));
                DropDownList_month.Items.Add(new ListItem("Aug", "8"));
                DropDownList_month.Items.Add(new ListItem("Sep", "9"));
                DropDownList_month.Items.Add(new ListItem("Oct", "10"));
                DropDownList_month.Items.Add(new ListItem("Nov", "11"));
                DropDownList_month.Items.Add(new ListItem("Dec", "12"));
                for (i = 1; i <= 31; i ++ )
                {
                    DropDownList_day.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
                for (i = p.min_year; i <= p.max_year; i ++ )
                {
                    DropDownList_year.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
                if (p.selected_value == Units.UserControl_drop_down_date.NONE)
                {
                    DropDownList_month.Items.Insert(0, new ListItem("", ""));
                    DropDownList_day.Items.Insert(0, new ListItem("", ""));
                    DropDownList_year.Items.Insert(0, new ListItem("", ""));
                }
                else
                {
                    SetChildSelectedValues();
                }
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);


            if ((Session[this.UniqueID + ".p"] != null))
            {


                p = (p_type)(Session[this.UniqueID + ".p"]);
            }
            else
            {
                p.be_enabled = true;



                p.min_year = (uint)(DateTime.Today.Year - 1);



                p.max_year = (uint)(DateTime.Today.Year + 1);
                p.selected_value = Units.UserControl_drop_down_date.NONE;
            }
        }

        private void TWebUserControl_drop_down_date_PreRender(object sender, System.EventArgs e)
        {



            Session.Remove(this.UniqueID + ".p");



            Session.Add(this.UniqueID + ".p", p);
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.Button_today.Click += new System.EventHandler(this.Button_today_Click);

            this.PreRender += this.TWebUserControl_drop_down_date_PreRender;

            this.Load += this.Page_Load;
        }

        private void SetChildSelectedValues()
        {
            if (p.selected_value == Units.UserControl_drop_down_date.NONE)
            {
                DropDownList_month.SelectedIndex =  -1;
                DropDownList_day.SelectedIndex =  -1;
                DropDownList_year.SelectedIndex =  -1;
            }
            else
            {


                DropDownList_month.SelectedValue = p.selected_value.Month.ToString();


                DropDownList_day.SelectedValue = p.selected_value.Day.ToString();


                DropDownList_year.SelectedValue = p.selected_value.Year.ToString();
            }
        }

        public TWebUserControl_drop_down_date Fresh()
        {
            TWebUserControl_drop_down_date result;



            Session.Remove(this.ID + ".p");
            result = this;
            return result;
        }

        private struct p_type
        {
            public bool be_enabled;
            public uint min_year;
            public uint max_year;
            public DateTime selected_value;
        } // end p_type

    } // end TWebUserControl_drop_down_date

}

namespace UserControl_drop_down_date.Units
{
    public class UserControl_drop_down_date
    {
    // Driven by MySQL DATETIME type and .Net DateTime type


        public const int MIN_CONSISTENTLY_REPRESENTABLE_YEAR = 1000;
        // Driven by MySQL DATETIME type
        public const int MAX_CONSISTENTLY_REPRESENTABLE_YEAR = 9999;
        // Driven by MySQL DATETIME type and .Net DateTime type
        public static DateTime NONE = DateTime.MinValue;
    } // end UserControl_drop_down_date

}

