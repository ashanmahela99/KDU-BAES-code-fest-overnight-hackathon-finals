using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;


namespace IoT_Consumer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    
    public interface IService1
    {
       
        //This service consume HTTP request sent from IoT devices
        [OperationContract]
        [SelfValidation]
        void IoTConsume(long ID, int Count, bool Okay);

        //This service return ingressed data according to step by step
        [OperationContract]
        [SelfValidation]
        List<IoTData> DataIngressed(Queue<IoTData> queue, long ID);


        //This service return invoked data via queue 
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        [SelfValidation]
        Queue<IoTData> GetData(Queue<IoTData> queue);


        //This service return complete product ratio according to step by step
        [OperationContract]
        [SelfValidation]
        List<IoTData> GetCompleted_Ratio(Queue<IoTData> queue, long StepId, int Count, bool Okay);

        //This service return deffected product ratio according to step by step
        [OperationContract]
        [SelfValidation]
        List<IoTData> GetDefective_Ratio(Queue<IoTData> queue, long StepId, int Count, bool Okay);


        //This service return response time of each and every service
        [OperationContract]
        [SelfValidation]
        DateTime ResponseTime();
        
    }

    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    // You can add XSD files into the project. After building the project, you can directly use the data types defined there, with the namespace "IoT_Consumer.ContractType".
 
    [DataContract]
    public class IoTData
    {
        long Id;
        int count;
        bool okay;
       

        public IoTData() { }

        public IoTData(long Id, int count, bool okay) {


            this.Id = Id;
            this.count = count;
            this.okay = okay;
          

        }

        [DataMember]
        public long ID
        {
            get { return Id; }
            set { Id = ID; }
        }

        [DataMember]
        public int Count
        {
            get { return count; }
            set { count = Count; }
        }
        
        [DataMember]
        public bool Okay
        {
            get { return okay; }
            set { okay = Okay; }
        }
      
    }
}
