using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using System.Timers;
using System.Web;

namespace IoT_Consumer
{
   public class Service1 : IService1
    {
        public Queue<IoTData> queue = new Queue<IoTData>();
        public List<IoTData> list = new List<IoTData>();
        private  Timer timer = new Timer();


        //Timer tick event will trigger every 2 seconds in order to update recieved data into database through queue
        public Service1()
        {
            timer.Elapsed += new ElapsedEventHandler(Timer_Tick);
            timer.Enabled = true;
            timer.Interval = 2000;

           
        }

        public void IoTConsume(long ID, int Count, bool Okay)
        {
            try
            {
               
                queue.Enqueue(new IoTData(ID, Count, Okay));
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        public List<IoTData> DataIngressed(Queue<IoTData> queue,long ID)
        {
            try
            {
                  IEnumerable<IoTData> q =  queue.Where(x => x.ID == ID);

                return q.ToList();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Queue<IoTData> GetData(Queue<IoTData> queue)
        {
            try
            {
                return queue;
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        public void Timer_Tick(Object sender , System.Timers.ElapsedEventArgs e)
        {
            bool IsEmpty = !queue.Any();
            if (IsEmpty)
            {

                timer.Interval++;
                //timer waits until enqueuing object 

            }
            else
            {
                try
                {

               
                var Data = GetData(queue);

                using (SqlConnection con = new SqlConnection(@"Data Source=KANIABEY\SQLEXPRESS;Initial Catalog=SLIIT;Integrated Security=True;Pooling=False"))
                    if (con.State == ConnectionState.Closed)


                    {
                        con.Open();
                      
                        string query1 = "INSERT INTO Productions (Id,Count,Okay,Date)";
                        query1 += "VALUES (@Id,@Count,@Okay,@Date)";
                        SqlCommand myCommand = new SqlCommand(query1, con);
                        myCommand.Parameters.AddWithValue("@Id", DbType.Int64);
                        myCommand.Parameters.AddWithValue("@Count", DbType.Int32);
                        myCommand.Parameters.AddWithValue("@Okay", DbType.Boolean);
                        myCommand.Parameters.AddWithValue("@Date", DateTime.Now);


                        foreach (var item in Data)
                        {
                            myCommand.Parameters[0].Value = item.ID;
                            myCommand.Parameters[1].Value = item.Count;
                            myCommand.Parameters[2].Value = item.Okay;
                            myCommand.ExecuteNonQuery();
                            break;
                        }

                       
                        con.Close();

                        timer.Interval = 9000;
                        list.Clear();
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        public List<IoTData> GetCompleted_Ratio(Queue<IoTData> queue, long StepId, int Count, bool Okay)
        {
            IEnumerable<IoTData> query = this.queue.Where(x=> x.Okay == true && x.ID == StepId);

            return query.ToList();
        }
        public List<IoTData> GetDefective_Ratio(Queue<IoTData> queue, long StepId, int Count, bool Okay)
        {
            IEnumerable<IoTData> query = this.queue.Where(x => x.Okay == false && x.ID == StepId);

            return query.ToList();
        }

        public DateTime ResponseTime()
        {
            DateTime start = (DateTime)HttpContext.Current.Items["renderStartTime"];
            TimeSpan renderTime = DateTime.Now - start;
            return start;
        }
    }
}
