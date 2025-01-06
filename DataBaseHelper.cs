using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace Evaluation2_Screens
{
    public class DataBaseHelper
    {
        public class ColumnNames_111
        {
            public string downID { get; set; }
            public string SerialNumber { get; set; }
            public string MachineID { get; set; }
            public string Operator { get; set; }

            public string StartTime { get; set; }
            public string EndTime { get; set; }
            public string downtime { get; set; }

        }
        private static string connectionString;

        DataTable dt = new DataTable();
        public DataBaseHelper()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        }

        #region fetch DB Data
        public DataTable fetchDBdata(string fromDate, string toDate, string[] downids)
        {
            SqlConnection con = new SqlConnection(connectionString);
            {
                try
                {
                    using (SqlCommand cmd = new SqlCommand("GetDataByDowncode", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FromDate", fromDate);
                        cmd.Parameters.AddWithValue("@ToDate", toDate);
                        cmd.Parameters.AddWithValue("@DownID", string.Join(",", downids));
                        con.Open();
                        System.Diagnostics.Debug.WriteLine($"Connection test result: connected");
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);


                    }
                }
                catch (Exception ex)
                {
                    Logger.WriteErrorLog($"Error fetching data: {ex.Message}");
                }
                finally
                {
                    if (con != null) { con.Close(); con.Dispose(); }
                }
            }
          
            return dt;
        }
        #endregion

        #region Populate downcode
        public static List<string> Populatedowncode()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlDataReader reader = null;
            List<string> list = new List<string>();

            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT downID FROM downcodeinformation", con))
                {
                    con.Open();
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        list.Add(reader["downID"].ToString());
                    }
                }
                   
            }
            catch (Exception ex)
            {
                Logger.WriteDebugLog($"Error populating DownCode: {ex.Message}");
            }
            finally
            {
                if (con != null) { con.Close(); con.Dispose(); }
                if (reader != null) { reader.Close(); reader.Dispose(); }

            }
            return list;

        }
        #endregion
    }
}