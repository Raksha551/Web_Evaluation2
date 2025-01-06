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
using Evaluation2_Screens;

namespace Evaluation2_Screens
{
    public partial class Screen : System.Web.UI.Page
    {

        //private string ConnectionString => WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataBaseHelper dbHelper = new DataBaseHelper();
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    PopulateDownCode();
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"Error in Page_Load: {ex.Message}");
            }

        }
        public void PopulateDownCode()
        {
            try
            {
                List<string> list = DataBaseHelper.Populatedowncode();
                lbxdowncode.DataSource = list;
                lbxdowncode.DataBind();
                foreach (var item in lbxdowncode.Items.Cast<ListItem>().ToList())
                {
                    item.Selected = true;
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"Error in PopulateDownCode : {ex.Message}");
            }
        }
        protected void ViewButton_Click(object sender, EventArgs e)
        {
            try
            {
                string fromDate = txtFromDate.Text;
                string toDate = txtToDate.Text;
                string downId = Request.Form[lbxdowncode.UniqueID];
                string[] downIds = downId?.Split(',') ?? new string[] { };
                string formattedFromDate = Helper.ConvertToCustomDateFormat(fromDate);
                string formattedToDate = Helper.ConvertToCustomDateFormat(toDate);
                DataTable resultTable = FetchReportData(formattedFromDate, formattedToDate, downIds);
                if (resultTable.Rows.Count > 0)
                {
                    resultTable = AddSerialNumber(resultTable, "downID");
                    List<DataBaseHelper.ColumnNames_111> list = new List<DataBaseHelper.ColumnNames_111>();

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {

                            DataBaseHelper.ColumnNames_111 data = new DataBaseHelper.ColumnNames_111();
                            data.SerialNumber = dt.Rows[i]["SerialNumber"].ToString();
                            data.Operator = dt.Rows[i]["Operator"].ToString();
                            data.StartTime = dt.Rows[i]["StartTime"].ToString();
                            data.EndTime = dt.Rows[i]["EndTime"].ToString();
                            data.downtime = dt.Rows[i]["downTime"].ToString();
                            data.MachineID = dt.Rows[i]["machineID"].ToString();
                            list.Add(data);
                        }

                        var groupedData = resultTable.AsEnumerable()
                             .GroupBy(row => row.Field<string>("downID"))
                             .Select(g => new
                             {
                                 downID = g.Key,
                                 data = g.CopyToDataTable()
                             }).ToList();

                        listview3.DataSource = groupedData;
                        listview3.DataBind();

                    }

                }
                else
                {
                    listview3.DataSource = null;
                    listview3.DataBind();
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"Error in ViewButton_Click: {ex.Message}");
            }
        }
        private DataTable AddSerialNumber(DataTable dt, string groupColumnName)
        {
            try
            {
                if (dt == null || dt.Rows.Count == 0)
                    return dt;
                if (!dt.Columns.Contains("SerialNumber"))
                {
                    dt.Columns.Add("SerialNumber", typeof(int));
                }
                string currentGroup = string.Empty;
                int serialNumber = 0;
                foreach (DataRow row in dt.Rows)
                {
                    string group = row[groupColumnName].ToString();

                    if (group != currentGroup)
                    {
                        currentGroup = group;
                        serialNumber = 1;
                    }
                    else
                    {
                        serialNumber++;
                    }

                    row["SerialNumber"] = serialNumber;
                }

                return dt;
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"Error adding serial numbers for groups: {ex.Message}");
                return dt;
            }
        }
        private DataTable FetchReportData(string fromDate, string toDate, string[] downids)
        {
            try
            {
                dt = dbHelper.fetchDBdata(fromDate, toDate, downids);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"Error in FetchReportData: {ex.Message}");
            }
            return dt;

        }

    }
}

