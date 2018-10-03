using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace SLIITWeb
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpContext.Current.Items["renderStartTime"] = DateTime.Now;
        }

        void  Application_EndRequest(object sender, EventArgs e)
        {
            DateTime start = (DateTime)HttpContext.Current.Items["renderStartTime"];
            TimeSpan renderTime = DateTime.Now - start;
            HttpContext.Current.Response.Write("<!-- Render Time: " + renderTime + " -->");
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            Exception objErr = Server.GetLastError().GetBaseException();
            string err = "Error in: " + Request.Url.ToString() +
                              ". Error Message:" + objErr.Message.ToString();
        }
    }
}