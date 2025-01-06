using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace Evaluation2_Screens
{
    public class Helper
    {
        public static string ConvertToCustomDateFormat(string dateString)
        {
            try
            {
                if (dateString.Length == 16)
                {
                    dateString += ":00";
                }

                if (DateTime.TryParseExact(dateString, "dd-MM-yyyy HH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime parsedDate))
                {
                    return parsedDate.ToString("yyyy-MM-dd HH:mm:ss");
                }
                else
                {
                    return string.Empty;
                }
            }
            catch (Exception ex)
            {
                Logger.WriteDebugLog($"Error converting date format: {ex.Message}");
                return string.Empty;
            }
        }
    }
}