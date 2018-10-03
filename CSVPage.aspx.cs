using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Timers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SLIITWeb
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FileSystemWatcher fileSystemWatcher = new FileSystemWatcher
            {
                Path = @"C:\Users\Kanishka Abeykoon\source\repos\SLIIT\SLIITWeb\CSV\"
            };

            fileSystemWatcher.Created += FileSystemWatcher_Created;

            fileSystemWatcher.Renamed += FileSystemWatcher_Renamed;

            fileSystemWatcher.Deleted += FileSystemWatcher_Deleted;
            fileSystemWatcher.Changed += FileSystemWatcher_Changed;

            fileSystemWatcher.EnableRaisingEvents = true;
            System.Timers.Timer timer = new System.Timers.Timer();
            timer.Elapsed += new ElapsedEventHandler(Timer_Tick);
            timer.Enabled = true;
            timer.Interval = 2000;
            if (!this.IsPostBack)
            {
               
                this.BindGrid();
            }
        }

        private void FileSystemWatcher_Changed(object sender, FileSystemEventArgs e)
        {
            try
            {
                this.AddCSV(e.FullPath);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        private void FileSystemWatcher_Deleted(object sender, FileSystemEventArgs e)
        {
            try
            {
                this.AddCSV(e.FullPath);
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void FileSystemWatcher_Renamed(object sender, RenamedEventArgs e)
        {
            try
            {
                this.AddCSV(e.FullPath);
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void FileSystemWatcher_Created(object sender, FileSystemEventArgs e)
        {
            try
            {
                this.AddCSV(e.FullPath);
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void Timer_Tick(object sender, ElapsedEventArgs e)
        {
            this.BindGrid();
        }

        private static SqlConnection Connection()
        {

            string sqlconn = @"Data Source=KANIABEY\SQLEXPRESS;Initial Catalog=SLIIT;Integrated Security=True;Pooling=False";
           SqlConnection con = new SqlConnection(sqlconn);

            return con;

        }

        private void InsertCSVRecords(DataTable csvdt)
        {
            SqlConnection con = new SqlConnection();
            con = Connection();
              
            SqlBulkCopy objbulk = new SqlBulkCopy(con);
            
            objbulk.DestinationTableName = "Shift_Info";
            objbulk.ColumnMappings.Add("Name", "Employee_ID");
            objbulk.ColumnMappings.Add("Manager", "Line_Manager");
            objbulk.ColumnMappings.Add("Shift", "Shift");
            objbulk.ColumnMappings.Add("StepID", "StepID");
            con.Open();
            objbulk.WriteToServer(csvdt);
            con.Close();


        }
        protected void Button1_Click(object sender, EventArgs e)
        {

           
        }

        private void BindGrid()
        {
            SqlConnection Con = new SqlConnection();

            Con = Connection();
            using (Con)
            {
                using (SqlCommand cmd = new SqlCommand("select * from Shift_Info"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = Con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            CSVDatah.DataSource = dt;
                            CSVDatah.DataBind();
                        }
                    }
                }
            }
        }

        protected void PrintRpt_Click(object sender, EventArgs e)
        {
            SqlConnection con = Connection();
            DataSet ds = new DataSet();
          SqlDataAdapter  adp = new SqlDataAdapter("select * from Shift_Info", con);
            adp.Fill(ds);
            ReportDocument rd = new ReportDocument();
            rd.Load(@"C:\Users\Kanishka Abeykoon\source\repos\SLIIT\SLIITWeb\CrystalReport1.rpt");
            rd.SetDataSource(ds.Tables[0]);
            CrystalReportViewer1.ReportSource = rd;
            
            rd.Refresh();
            rd.PrintToPrinter(2,true,1,2);
        }
        public void AddCSV(string file)
        {
            DataTable tblcsv = new DataTable();
            tblcsv.Columns.Add("Employee_ID");
            tblcsv.Columns.Add("Line_Manager");
            tblcsv.Columns.Add("Shift");
            tblcsv.Columns.Add("Date");
            tblcsv.Columns.Add("StepID");
            string CSVFilePath = Path.GetFullPath(file);

            string ReadCSV = File.ReadAllText(CSVFilePath);
            foreach (string csvRow in ReadCSV.Split('\n'))
            {
                if (!string.IsNullOrEmpty(csvRow))
                {

                    tblcsv.Rows.Add();
                    int count = 0;
                    foreach (string FileRec in csvRow.Split(','))
                    {
                        tblcsv.Rows[tblcsv.Rows.Count - 1][count] = FileRec;
                        count++;
                    }
                }

            }

            InsertCSVRecords(tblcsv);
            Response.Write("<script LANGUAGE='JavaScript'>alert('Your CSV Has Been Updated') </script>");
        }
    }
}