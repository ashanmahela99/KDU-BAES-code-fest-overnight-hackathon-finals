using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Timers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SLIITWeb
{
    public partial class Contact : Page
    {
        ServiceReference3.Service1Client service1Client = new ServiceReference3.Service1Client();
        ServiceReference3.IoTData ioTData = new ServiceReference3.IoTData();
        public System.Timers.Timer timer = new System.Timers.Timer();


       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               // this.BIndData();
                this.BindGrid();
                timer.Enabled = true;
                timer.Elapsed += new ElapsedEventHandler(Timer_Tick);
                timer.Enabled = true;
                timer.Interval = 200;
            }
        }

        private void Timer_Tick(object sender, ElapsedEventArgs e)
        {
           

        }

        //private void BIndData()
        //{
           
        //    var list = new List<ServiceReference1.IoTData>();

        //    this.Chart2.DataSource = list.ToList(); 

        //    int[] xvalues = new int[ioTData.Count];
        //    long[] yvalues = new long[ioTData.ID];
        //    for (int i = 0; i < ioTData.Count; i++)
        //    {
        //        xvalues[i] = ioTData.Count;
        //        yvalues[i] =  ioTData.ID;
        //    }
        //    Chart2.Series["Series1"].Points.DataBindXY(xvalues, yvalues);
        //    Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

        //    this.Chart2.DataBind();
        //}

        private void BindGrid()
        {
            SqlConnection Con = new SqlConnection();

            Con = Connection();
            using (Con)
            {
                using (SqlCommand cmd = new SqlCommand("select * from ProductionCount"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = Con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gridCount.DataSource = dt;
                            gridCount.DataBind();
                        }
                    }
                }
            }
        }

        private static SqlConnection Connection()
        {

            string sqlconn = @"Data Source=KANIABEY\SQLEXPRESS;Initial Catalog=SLIIT;Integrated Security=True;Pooling=False";
            SqlConnection con = new SqlConnection(sqlconn);

            return con;
        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {

        }
    }
}