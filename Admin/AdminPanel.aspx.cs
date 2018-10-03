using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SLIITWeb.Admin
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ServiceReference3.Service1Client service1Client = new ServiceReference3.Service1Client();
            DateTime dd = new DateTime();
            //if (service1Client.ResponseTime() > dd.AddSeconds(11))
            //{
            //    step1.Visible = true;
            //    step1.Text = "Step 1 needs Inspecting";
            //    Label2.Visible = true;
            //    Label2.Text = "Step 1 needs Inspecting";
            //    Label3.Visible = true;
            //    Label3.Text = "Step 1 needs Inspecting";
            //    Label4.Visible = true;
            //    Label4.Text = "Step 1 needs Inspecting";
            //}

        }
    }
}