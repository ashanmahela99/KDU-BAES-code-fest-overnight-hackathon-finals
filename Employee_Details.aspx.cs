using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SLIITWeb
{
    public partial class Employee_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void BindGrid(string Shift, string StepID)
        {
            SqlConnection Con = new SqlConnection();

            Con = Connection();
                Con.Open();
            using (Con)
            {
                using (SqlCommand cmd = new SqlCommand("Emp_Performance"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = Con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        try
                        {
                            cmd.Parameters.Add(new SqlParameter("@StepID", Shift));
                            cmd.Parameters.Add(new SqlParameter("@Shift", StepID));
                            SqlDataReader rd = cmd.ExecuteReader();
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                dt.Load(rd);
                                sda.Fill(dt);
                                gridCount.DataSource = dt;
                                gridCount.DataBind();
                            }
                        }
                        catch (Exception)
                        {

                            throw;
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
            if (Step.SelectedValue.Equals("4"))
            {
                this.BindGrid("4", searchbtn.Text);

            }

            else if (searchtxt.Text.Equals(""))
            {
                
                Response.Write("<script LANGUAGE='JavaScript'>alert('Please Enter Search Query') </script>");
            }

            if (Step.SelectedValue.Equals("1"))
            {
                this.BindGrid("1", searchbtn.Text);
            }

            else if (Step.SelectedValue.Equals("2"))
            {
                this.BindGrid("2", searchbtn.Text);
            }

            if (Step.SelectedValue.Equals("3"))
            {
                this.BindGrid("3", searchbtn.Text);
            }

        }
    }
}