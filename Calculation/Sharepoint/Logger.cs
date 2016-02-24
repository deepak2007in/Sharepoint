using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SCI.CIProject.ProjectSaving
{
    public static class Logger
    {
        const string fileName = "D://abc.txt";
        public static void Log(string message)
        {
            File.AppendAllLines(fileName, new[] {message});
        }

        public static void LogStackTrace()
        {
            var stackTrace = new StackTrace();
            var frames = stackTrace.GetFrames();
            var collection = string.Empty;
            foreach (var frame in frames)
            {
                collection += frame.ToString() + "|";
            }
            File.AppendAllLines(fileName, collection.Split('|'));
        }
    }
}
