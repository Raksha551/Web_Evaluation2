﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;

namespace Evaluation2_Screens
{
    public class Logger
    {
        private static string appPath;
        private static object _locker;

        static Logger()
        {
            string ProgTime = String.Format("{0:dd_MMM_yyyy}", DateTime.Now);
            appPath = Path.GetDirectoryName(HttpContext.Current.Server.MapPath("~/"));
            _locker = new object();

            string LogsFolderPath = appPath + @"\Logs";
            if (Directory.Exists(LogsFolderPath) == false)
            {
                Directory.CreateDirectory(LogsFolderPath);
            }

            appPath = Path.Combine(appPath, @"Logs\FactoryLog_" + ProgTime + ".txt");

        }

        public static void WriteDebugLog(string str)
        {
            StreamWriter writer = null;
            if (Monitor.TryEnter(_locker, 1000))
            {
                try
                {
                    writer = new StreamWriter(appPath, true, Encoding.UTF8, 8195);
                    writer.WriteLine(string.Format("{0} : DEBUG - {1}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ffff"), str));
                    writer.Flush();
                    writer.Close();
                    writer.Dispose();
                    writer = null;
                }
                catch { }
                finally
                {
                    Monitor.Exit(_locker);
                    if (writer != null)
                    {
                        writer.Close();
                        writer.Dispose();
                    }
                }
            }
        }

        public static void WriteErrorLog(string str)
        {
            StreamWriter writer = null;
            if (Monitor.TryEnter(_locker, 1000))
            {
                try
                {
                    writer = new StreamWriter(appPath, true, Encoding.UTF8, 8195);
                    writer.WriteLine(string.Format("{0} : EXCEPTION - {1}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ffff"), str));
                    writer.Flush();
                    writer.Close();
                    writer.Dispose();
                    writer = null;
                }
                catch { }
                finally
                {
                    Monitor.Exit(_locker);
                    if (writer != null)
                    {
                        writer.Close();
                        writer.Dispose();
                    }
                }
            }
        }

        public static void WriteErrorLog(Exception ex)
        {
            StreamWriter writer = null;
            if (Monitor.TryEnter(_locker, 1000))
            {
                try
                {
                    writer = new StreamWriter(appPath, true, Encoding.UTF8, 8195);
                    writer.WriteLine(string.Format("{0} : Exception - {1}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ffff"), ex));
                    writer.Flush();
                    writer.Close();
                    writer.Dispose();
                    writer = null;
                }
                catch { }
                finally
                {
                    Monitor.Exit(_locker);
                    if (writer != null)
                    {
                        writer.Close();
                        writer.Dispose();
                    }
                }
            }
        }

        public static void WriteErrorLogDetailed(Exception ex)
        {
            StreamWriter writer = null;
            if (Monitor.TryEnter(_locker, 1000))
            {
                try
                {
                    StackTrace stackTrace = new StackTrace(ex, true);
                    string errorMessage = $" {ex.Message} at File : {stackTrace.GetFrame(stackTrace.FrameCount - 1).GetFileName()} in Method : {stackTrace.GetFrame(stackTrace.FrameCount - 1).GetMethod().Name} at Line Number : {stackTrace.GetFrame(stackTrace.FrameCount - 1).GetFileLineNumber()}";
                    writer = new StreamWriter(appPath, true, Encoding.UTF8, 8195);
                    writer.WriteLine(string.Format("{0} : Exception - {1}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ffff"), errorMessage));
                }
                catch (Exception)
                {
                    writer = new StreamWriter(appPath, true, Encoding.UTF8, 8195);
                    writer.WriteLine(string.Format("{0} : Exception - {1}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ffff"), ex.Message));
                }
                finally
                {
                    Monitor.Exit(_locker);
                    if (writer != null)
                    {
                        writer.Flush();
                        writer.Close();
                        writer.Dispose();
                    }
                }
            }
        }
    }
}