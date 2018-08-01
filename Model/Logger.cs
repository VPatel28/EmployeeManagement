using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Configuration;

namespace EmployeeManagement.Model
{
    public class Logger
    {
        public void Log(string sMethodName, string sException)
        {
            try
            {
                string Path = HttpContext.Current.Server.MapPath(ConfigurationSettings.AppSettings["filepath"]);
                StreamWriter log;

                if (!File.Exists(Path))
                {
                    log = new StreamWriter(Path);
                }
                else
                {
                    log = File.AppendText(Path);
                }

                // Write to the file:
                log.WriteLine(DateTime.Now);
                log.WriteLine(sMethodName);
                log.WriteLine(sException);
                log.WriteLine();

                // Close the stream:
                log.Close();
            }
            catch (Exception)
            {

            }
        }
    }
}