using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Evaluation2_Screens
{
    public partial class Screen : System.Web.UI.Page
    {
        public class ColumnNames_111
        {
            public string downID { get; set; }
            public string SerialNumber { get; set; }
         
            public string Operator { get; set; }
            
            public string StartTime { get; set; }
            public string EndTime { get; set; }
            public string downtime { get; set; }
            public string MachineID { get; set; }

            public int RowSpan { get; set; } = 1;
            public bool tdVisible { get; set; } = true;
        }

        private string ConnectionString => WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDownCode();
               


            }
        }

        public void PopulateDownCode()
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT downID FROM downcodeinformation", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lbxdowncode.Items.Add(reader["downID"].ToString());
                }
            }
           
           lbxdowncode.DataBind();
            foreach (var item in lbxdowncode.Items.Cast<ListItem>().ToList())
            {
                item.Selected = true;
            };


        }
        protected void ViewButton_Click(object sender, EventArgs e)
        {
            string fromDate = txtFromDate.Text;
            string toDate = txtToDate.Text;
            string downId = Request.Form[lbxdowncode.UniqueID]; // Comma-separated values
            string[] downIds = downId?.Split(',') ?? new string[] { };

            // Convert dates to proper format
            string formattedFromDate = ConvertToCustomDateFormat(fromDate);
            string formattedToDate = ConvertToCustomDateFormat(toDate);

            // Fetch report data
            DataTable resultTable = FetchReportData(formattedFromDate, formattedToDate, downIds);

            // If data exists, bind it to the ListView
            if (resultTable.Rows.Count > 0)
            {
                resultTable = AddSerialNumber(resultTable);  // Add Serial Number to the DataTable

                List<ColumnNames_111> list = new List<ColumnNames_111>();
                // List<childClass> dynValues = new List<childClass>();

                ColumnNames_111 data = null;
                //  childClass ColumnNames_111data = null;

                if (dt != null && dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        ColumnNames_111 Row1 = null;
                        if (i == 0)
                        {
                            Row1 = new ColumnNames_111(); // Header
                            ColumnNames_111 Row2 = new ColumnNames_111(); // Sub header

                            Row1.downID = "downID";
                            Row1.SerialNumber = "SerialNumber";
                            Row1.Operator = "Operator";
                            Row1.StartTime = "StartTime";

                            Row1.EndTime = "EndTime";
                            Row1.downtime = "downTime";
                            Row1.MachineID = "machineID";


                            Row2.tdVisible = false;

                            //  List<childClass> dynValues_Row1 = new List<childClass>();
                            //   List<childClass> dynValues_Row2 = new List<childClass>();


                            //for (int j = 10; j < dt.Columns.Count; j++)
                            //{
                            //    string colName = dt.Columns[j].ColumnName;
                            //    var keyParts = colName.Split('$');
                            //    var mainHeader = keyParts.Length > 0 ? keyParts[0] + keyParts[1].Split('@')[0] : colName;
                            //    var subHeader = keyParts.Length > 1 && keyParts[1].Contains('@')
                            //        ? keyParts[1].Split('@').Last()
                            //        : string.Empty;

                            //    dynValues_Row1.Add(new childClass { CharacteristicValue = mainHeader });
                            //    dynValues_Row2.Add(new childClass { CharacteristicValue = subHeader });

                            //}
                            //  Row1.listviewdata = dynValues_Row1;
                            //   Row2.listviewdata = dynValues_Row2;
                            Row1.RowSpan = 9;
                            list.Add(Row1);
                            
                            //  list.Add(Row2);
                        }


                        data = new ColumnNames_111();
                        data.downID = dt.Rows[i]["downID"].ToString();  // Assuming the column names match

                        data.SerialNumber = dt.Rows[i]["SerialNumber"].ToString();
                        data.Operator = dt.Rows[i]["Operator"].ToString();
                        data.StartTime = dt.Rows[i]["StartTime"].ToString();
                        data.EndTime = dt.Rows[i]["EndTime"].ToString();
                        data.downtime = dt.Rows[i]["downTime"].ToString();
                        data.MachineID = dt.Rows[i]["machineID"].ToString();
                        list.Add(data);

                        //dynValues = new List<childClass>();
                        //for (int j = 10; j < dt.Columns.Count; j++)
                        //{
                        //    ColumnNames_111data = new childClass();
                        //    ColumnNames_111data.CharacteristicValue = dt.Rows[i][j].ToString();
                        //    //  ColumnNames_111data.dynamicvalues = dt.Rows[i][j].ToString();
                        //    dynValues.Add(ColumnNames_111data);

                        //    string colName = dt.Columns[j].ColumnName;
                        //    var keyParts = colName.Split('$');
                        //    var mainHeader = keyParts.Length > 0 ? keyParts[0] + keyParts[1].Split('@')[0] : colName;
                        //    var subHeader = keyParts.Length > 1 && keyParts[1].Contains('@')
                        //        ? keyParts[1].Split('@').Last()
                        //        : string.Empty;

                        //    string dvalue = ColumnNames_111data.CharacteristicValue;


                     
                    }
                    listview1.DataSource = list;  // Bind data to the ListView
                    listview1.DataBind();
                }
                else
                {
                    listview1.DataSource = null;  // If no data, clear the ListView
                    listview1.DataBind();
                }
                //DataTable lefttable = FetchDownIDAndDowntime(formattedFromDate, formattedToDate, downIds);
                //if (lefttable.Rows.Count > 0)
                //{

                //    listview2.DataSource = lefttable;  // Bind data to the ListView
                //    listview2.DataBind();
                //}
                //else
                //{
                //    listview2.DataSource = null;  // If no data, clear the ListView
                //    listview2.DataBind();
                //}
            }
        }

        private DataTable AddSerialNumber(DataTable dt)
        {
            if (dt == null || dt.Rows.Count == 0)
                return dt;

            // Add SerialNumber column if it doesn't exist
            if (!dt.Columns.Contains("SerialNumber"))
            {
                dt.Columns.Add("SerialNumber", typeof(int));
            }

            // Add serial number (starting from 1) to each row
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i]["SerialNumber"] = i + 1;  // Serial number starts from 1
            }

            return dt;
        }

        private string ConvertToCustomDateFormat(string dateString)
        {
            if (dateString.Length == 16)
            {
                dateString += ":00";
            }

            DateTime parsedDate;

            if (DateTime.TryParseExact(dateString, "yyyy-MM-ddTHH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.None, out parsedDate))
            {
                return parsedDate.ToString("yyyy-MM-dd HH:mm:ss");
            }
            else
            {
                return string.Empty;
            }
        }
        private DataTable FetchReportData(string fromDate, string toDate, string[] downids)
        {
            // Initialize an empty DataTable to store results
        

            // Ensure the parameters are valid before proceeding
            //if (string.IsNullOrEmpty(fromDate) || string.IsNullOrEmpty(toDate))
            //{
            //    return dt; // Return empty DataTable if dates are invalid
            //}

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                try
                {
                    // Define the command to execute the stored procedure
                    using (SqlCommand cmd = new SqlCommand("GetDataByDowncode", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Add parameters to the SQL command
                        cmd.Parameters.AddWithValue("@FromDate", fromDate);
                        cmd.Parameters.AddWithValue("@ToDate", toDate);
                        cmd.Parameters.AddWithValue("@DownID", string.Join(",", downids));

                        System.Diagnostics.Debug.WriteLine("Executing stored procedure...");

                        // Open the connection to the database
                        con.Open();
                        System.Diagnostics.Debug.WriteLine($"Connection test result: connected");
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                        if (dt.Rows.Count == 0)
                        {
                            System.Diagnostics.Debug.WriteLine("No rows were returned from the stored procedure.");
                        }
                        else
                        {
                            System.Diagnostics.Debug.WriteLine($"Rows returned: {dt.Rows.Count}");
                        }

                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions (you can log this exception as needed)
                    System.Diagnostics.Debug.WriteLine($"Error fetching data: {ex.Message}");
                }
            }

            // Optionally log the data for debugging purposes
            System.Diagnostics.Debug.WriteLine("Rows in DataTable: " + dt.Rows.Count);
           

            return dt; // Return the populated DataTable
        }
        private DataTable FetchDownIDAndDowntime(string fromDate, string toDate, string[] downids)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetDataByDowncode", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Add parameters for downID, fromDate, and toDate
                    cmd.Parameters.AddWithValue("@FromDate", fromDate);
                    cmd.Parameters.AddWithValue("@ToDate", toDate);
                    cmd.Parameters.AddWithValue("@DownID", string.Join(",", downids));

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            System.Diagnostics.Debug.WriteLine("Fetched data for DownID and Total Downtime:");
            foreach (DataRow row in dt.Rows)
            {
                foreach (DataColumn column in dt.Columns)
                {
                    System.Diagnostics.Debug.WriteLine($"{column.ColumnName}: {row[column]}");
                }
            }

            return dt;
        }


        //protected void ViewButton_Click(object sender, EventArgs e)
        //{
        //    string fromDate = txtFromDate.Text;
        //    string toDate = txtToDate.Text;
        //    string downId = Request.Form[lbxdowncode.UniqueID]; // Comma-separated values
        //    string[] downIds = downId?.Split(',') ?? new string[] { };

        //    string formattedFromDate = ConvertToCustomDateFormat(fromDate);
        //    string formattedToDate = ConvertToCustomDateFormat(toDate);


        //    DataTable resultTable = FetchReportData(formattedFromDate, formattedToDate, downIds);

        //    System.Diagnostics.Debug.WriteLine($"Fetched data: {resultTable.Rows.Count} rows");
        //    if (resultTable.Rows.Count > 1)
        //    {
        //        bool hasData = false;


        //        if (resultTable.Columns.Contains("SaveFlag"))
        //        {

        //            if (resultTable.Rows[0]["SaveFlag"].ToString() == "No records found!")
        //            {

        //                listview1.DataBind();
        //            }
        //            else
        //            {
        //                hasData = true;
        //            }
        //        }
        //        else
        //        {
        //            hasData = true;
        //        }
        //        if (hasData)
        //        {


        //           // listview1.DataSource = null;
        //           // listview1.DataBind();
        //            resultTable = AddSerialNumber(resultTable);

        //            listview1.DataSource = resultTable;
        //                listview1.DataBind();
        //            }
        //        }
        //        else
        //        {

        //            listview1.DataSource = null; 
        //            listview1.DataBind();
        //        }

        //    }


        //private string ConvertToCustomDateFormat(string dateString)
        //{
        //    // Add :00 if the seconds part is missing
        //    if (dateString.Length == 16)
        //    {
        //        dateString += ":00";
        //    }

        //    DateTime parsedDate;
        //    if (DateTime.TryParseExact(dateString, "yyyy-MM-ddTHH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.None, out parsedDate))
        //    {

        //        System.Diagnostics.Debug.WriteLine($"Parsed Date: {parsedDate.ToString()}");
        //        return parsedDate.ToString("yyyy-MM-dd HH:mm:ss");
        //    }
        //    else
        //    {
        //        return string.Empty;
        //    }
        //}

        DataTable dt = new DataTable(); 
        //private DataTable FetchReportData(string fromDate, string toDate, string[] downids)
        //{
        //    DateTime startDate;
        //    DateTime endDate;

        //    if (!DateTime.TryParseExact(fromDate, "dd:MM:yyyyTHH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate))
        //    {
        //        // lblMessage.Text = "Invalid From Date format. Please use the format dd:MM:yyyy HH:mm:ss.";
        //        //  lblMessage.Visible = true;
        //        return dt;
        //    }

        //    if (!DateTime.TryParseExact(toDate, "dd:MM:yyyyTHH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.None, out endDate))
        //    {
        //        // lblMessage.Text = "Invalid To Date format. Please use the format dd:MM:yyyy HH:mm:ss.";
        //        //  lblMessage.Visible = true;
        //        return dt;
        //    }

        //    using (SqlConnection con = new SqlConnection(ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("GetDataByDowncode", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;


        //            cmd.Parameters.AddWithValue("@downid", string.Join(",", downids));
        //            cmd.Parameters.AddWithValue("@FromDate", SqlDbType.DateTime).Value = startDate;
        //            cmd.Parameters.AddWithValue("@ToDate", SqlDbType.DateTime).Value = startDate;

        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            da.Fill(dt);
        //        }
        //    }
        //    System.Diagnostics.Debug.WriteLine("Rows in DataTable: " + dt.Rows.Count);
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        foreach (DataColumn column in dt.Columns)
        //        {
        //            System.Diagnostics.Debug.WriteLine($"{column.ColumnName}: {row[column]}");
        //        }
        //    }

        //    return dt;
        //}
    }
    }

