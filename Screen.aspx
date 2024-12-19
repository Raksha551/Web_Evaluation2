<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Screen.aspx.cs" Inherits="Evaluation2_Screens.Screen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
            background-color: #0a0c3f !important;
        }


        .container {
            margin-top: 60px;
        }


        .head-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #08392b;
            color: white;
            height: 60px;
            padding: 0;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            margin-bottom: 0px;
        }

        .header-left {
            width: 90px;
            height: 60px;
            flex-shrink: 0;
            margin: 0;
            border-radius: 10px;
        }

        .head-title1 {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            color: white;
            line-height: 60px;
            margin: 0;
        }

        .header-right-section {
            display: flex;
            align-items: center;
            gap: 10px;
            padding-right: 20px;
            padding-left: 50px;
        }



        .header-info {
            text-align: right;
        }


        .header-icon1 {
            width: 40px;
            height: 40px;
            cursor: pointer;
        }

        .header-icon {
            width: 30px;
            height: 30px;
            margin: 8px;
            cursor: pointer;
            display: inline-flex;
        }

        .right {
            margin-right: 0px;
            right: 0px;
            justify-content: center;
            align-content: center;
            align-items: center;
            padding-right: 0px;
            position: fixed;
        }

        #rightlogo {
            width: 90px;
            height: 60px;
            flex-shrink: 0;
            margin: 0;
            border-radius: 10px;
            padding-left: 4px;
            padding-right: 0px;
        }

        .sidebar {
            background-color: darkslategray;
            top: 7.8%;
            left: 0px;
            justify-content: left;
            font-size: 16px;
            height: 100%;
            width: 14%;
            position: fixed;
            text-align: left;
            display: flex;
            flex-direction: column;
            z-index: -1;
        }

        .innersidebar {
        }

        .sidebar-items {
            color: #DADBDD;
            text-align: center;
            justify-content: center;
            padding-left: 15px;
            align-content: center;
            text-decoration: none;
        }

        .innersidebar-items {
            color: #DADBDD;
            text-align: center;
            justify-content: center;
            padding-left: 10px;
            align-content: center;
            text-decoration: none;
            font-size: 15px;
        }

        .sidebar-list {
            display: flex;
            flex-direction: row;
            padding: 14px;
            color: white;
            border: 1px solid white;
        }

        .innersidebar-list {
            display: flex;
            flex-direction: row;
            padding: 5px;
            padding-left: 40px;
            color: white;
            border: 1px solid white;
        }

        .sidebar-icons {
            width: 25px;
            height: 25px;
            padding: 4px;
        }

        .innersidebar-icons {
            width: 22px;
            height: 22px;
            padding: 3px;
        }

        #settings {
            padding: 12px;
        }

        #iconic {
            border-top: 0px !important;
        }

        #hr {
            border-bottom: 0px !important;
            width: 100%;
        }

        .celllength {
            width: 200px;
            height: 40px;
            color: black;
        }

        #viewbtn, #exportbtn {
            width: 80px;
            height: 40px;
            background-color: #0094ff;
            border-radius: 5px;
            font-size: 20px;
            font-weight: bold;
            padding-top: 2px;
        }

        .cellname {
            font-size: 18px;
            width: 110px; /* Adjust this value to set your desired width */
            text-align: left; /* Align text to the left if needed */
            padding: 5px;
            color: white;
        }

        #lbxdowncode, .list {
            color: black;
            backface-visibility: visible;
            border-radius: 5px;
            height: 50px;
        }

        .form-control {
            color: black;
        }

        .filtertable {
            width: 100%; /* Adjust as needed */
            border-collapse: collapse;
            margin-top: 200px;
            margin: 40px 18%;
            position: relative;
            margin-left: 16%;
            width: 50%;
            padding: 20px;
            border: 1px solid #DADBDD;
            table-layout: fixed;
            color: #DADBDD;
            display: inline !important;
        }

        table th, table td {
            padding: 20px;
            text-align: left;
            display: inline !important;
        }


        table td {
            height: 50px;
            width: 180px;
            padding: 20px;
        }

        .filters {
            margin-top: 25px;
        }
        /* Style for the table */
        /* Style for the ListView container */
        /* Style for the ListView container */
     
           

            /* Alternate row color styles */
            .listviewdata tr:nth-child(even) {
                background-color: white; /* Light gray for even rows */
            }
.listviewdata tr:nth-child(odd) {
                background-color: darkslategray; /* White for odd rows */
            }

            /* Hover effect for rows */
            .listview .listviewtable tr:hover {
                background-color: #ddd; /* Light gray when hovering over any row */
            }

        /* Optional: Remove border around ListView container */
        .listview {
            margin-top: 80px;
        }

        .body {
            display: inline !important;
            gap: 10px;
        }

        .leftbox {
            padding: 10px;
            border: 5px solid red;
            margin-left: 320px;
            margin-top: 100px;
            width: 200px;
            height: 200px;
            overflow: visible;
            z-index: 1000;
            color: black;
            word-wrap: break-word;
            background-color: white;
        }
        .empty{
            margin-left: 300px;
            margin-top:80px;
            border:1px solid white;
            padding:5px;
        }
        .listviewdata{
              width: 72%; /* Adjust as needed */
  border-collapse: collapse;
  margin-top: 200px;
  margin: 40px 18%;
  position: relative;
  margin-left: 16%;


   border: 1px solid white;
  table-layout: fixed;
  color: #DADBDD;
  
        }
        .listviewdata td{
       margin-left:0px;
          height:2px;
           text-align:center;
     

        }
      .listviewdata tbody tr{
          width:400%;
       
        }
    </style>
    <script src="lib/jquery/jquery.min.js"></script>
    <link href="lib/bootstrap.min.css" rel="stylesheet" />
    <script src="lib/bootstrap.min.js"></script>



    <link href="lib/bootstrap-multiselect/css/bootstrap-multiselect.min.css" rel="stylesheet" />
    <script src="lib/bootstrap-multiselect/js/bootstrap-multiselect.min.js"></script>



    <script>
        $(document).ready(function () {
            // Enable multi-select dropdowns
            $('#<%= lbxdowncode.ClientID %>').multiselect({
                includeSelectAllOption: true,
                buttonWidth: '160px',
            });


        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="head-container">
                <div>
                    <img src="./Images/AmiTLogo.jpg" class="header-left" alt="Left Icon" />
                </div>
                <div class="head-title1">TPM-Trak Analysis</div>
                <div class="header-right-section">
                    <div class="header-info">
                        <span id="currentDate"></span>
                    </div>
                    <div class="right">
                        <img src="./Images/maximize.png" class="header-icon" id="r" alt="Maximize Icon" />
                        <img src="./Images/profile-user.png" class="header-icon" id="h" alt="Home Icon" />
                        <img src="./Images/AmiTLogo.jpg" class="header-icon" id="rightlogo" alt="AmiT Loga" />
                    </div>
                </div>                 
            </div>
              <hr style="width: 300%; font-weight: bolder; margin-top: 0px; top: 0px; padding-top: 0px;" />
         
        </div>
        <div class="sidebar">
            <div class="sidebar-list">
                <img src="./Images/list.png" class="sidebar-icons" runat="server" alt="Menu Icon" />
            </div>
            <div class="sidebar-list">
                <img src="./Images/play-button.png" class="sidebar-icons" runat="server" alt="Play Icon" />
                <a href="#" class="sidebar-items">Historical Analytics</a>
            </div>
            <div class="sidebar-list" id="hr">
                <img src="./Images/push-pin.png" class="sidebar-icons" runat="server" alt="Push Pin Icon" />
                <a href="#" class="sidebar-items">Live Analytics</a>
            </div>
            <div class="innersidebar">
                <div class="innersidebar-list" id="iconic">
                    <img src="./Images/menu.png" class="innersidebar-icons" runat="server" alt="Back in Time Icon" />
                    <a href="#" class="innersidebar-items">Iconic view</a>
                </div>
                <div class="innersidebar-list">
                    <img src="./Images/categories.png" class="innersidebar-icons" runat="server" alt="Contact Icon" />
                    <a href="#" class="innersidebar-items">Cyclic Analytics</a>
                </div>
                <div class="innersidebar-list">
                    <img src="./Images/left-alignment.png" class="innersidebar-icons" runat="server" alt="Back in Time Icon" />
                    <a href="#" class="innersidebar-items">Hourly Tracking</a>
                </div>
                <div class="innersidebar-list">
                    <img src="./Images/right-align.png" class="innersidebar-icons" runat="server" alt="Contact Icon" />
                    <a href="#" class="innersidebar-items">DownTime dashboard</a>
                </div>
                <div class="innersidebar-list">
                    <img src="./Images/id-card.png" class="innersidebar-icons" runat="server" alt="Back in Time Icon" />
                    <a href="#" class="innersidebar-items">Rejection Entry</a>
                </div>
                <div class="innersidebar-list">
                    <img src="./Images/file.png" class="innersidebar-icons" runat="server" alt="Contact Icon" />
                    <a href="#" class="innersidebar-items">Reports</a>
                </div>
                <div class="innersidebar-list">
                    <img src="./Images/file.png" class="innersidebar-icons" runat="server" alt="Back in Time Icon" />
                    <a href="#" class="innersidebar-items">SAP Prod. Rej, Details </a>
                </div>
            </div>
            <div class="sidebar-list">
                <img src="./Images/atom.png" class="sidebar-icons" runat="server" alt="Atom Icon" />
                <a href="#" class="sidebar-items">Smart Shop</a>
            </div>

        </div>

        <div class="filters">
            <table class="filtertable">
                <tr>
                    <td>
                        <asp:Label runat="server" Text="From Date" CssClass="cellname"></asp:Label>
                        <asp:TextBox runat="server" ID="txtFromDate" CssClass="celllength" TextMode="DateTimeLocal" Style="color: black"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label runat="server" Text="To Date" CssClass="cellname"></asp:Label>
                        <asp:TextBox runat="server" ID="txtToDate" CssClass="celllength" TextMode="DateTimeLocal" Style="color: black"></asp:TextBox>
                    </td>
                    <td class="list">
                        <asp:Label runat="server" Text="Down Code" CssClass="cellname"></asp:Label>
                        <asp:ListBox ID="lbxdowncode" runat="server" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
                    </td>
                    <td>
                        <asp:Button runat="server" ID="viewbtn" Text="View" OnClick="ViewButton_Click" />
                    </td>
                </tr>



            </table>

        </div>
       <%-- <div class="body">
            <div class="leftbox">
                <asp:ListView runat="server" class="lefttable" ID="listview2" ItemPlaceholderID="itemPlaceholder">
                    <LayoutTemplate>
                        <div>
                            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div>
                            <asp:Label runat="server" CssClass="leftdownid" Text='<%# Eval("downID") %>'></asp:Label><br />
                            <asp:Label runat="server" CssClass="leftdownid" Text='<%# Eval("totalDowntime") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <div class="listview">
                <asp:ListView ID="listview1" runat="server" ItemPlaceholderID="itemPlaceholder">
                    <LayoutTemplate>
                        <table class="listviewtable">
                            <thead>
                                <tr>
                                    <th>Sl. No.</th>
                                    <th>Down Start Time</th>
                                    <th>Down End Time</th>
                                    <th>Machine ID</th>
                                    <th>Operator</th>
                                    <th>Downtime</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </tbody>

                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("SerialNumber") %></td>
                            <td><%# Eval("StartTime") %></td>
                            <td><%# Eval("EndTime") %></td>
                            <td><%# Eval("MachineID") %></td>
                            <td><%# Eval("Operator") %></td>
                            <td><%# Eval("downtime") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>

        </div>--%>
         <asp:ListView runat="server" ItemPlaceholderID="itemPlaceholder" ID="listview1">
     <LayoutTemplate>
          <table class="listviewdata">
        <tr runat="server" ID="itemPlaceholder"></tr>
               </table>
     </LayoutTemplate>
     <ItemTemplate>
        
             <tr>
                 <td runat="server" rowspan='<%# Eval("RowSpan") %>' visible='<%# Eval("tdVisible") %>' class="downid">
                     <asp:Label runat="server" Text='<%# Eval("downID") %>'></asp:Label>
                 </td>
                  <td runat="server">
     <asp:Label runat="server" Text='<%# Eval("SerialNumber") %>'></asp:Label>
 </td>
                 <td runat="server">
                    
                     <asp:Label runat="server" Text='<%# Eval("StartTime") %>'></asp:Label>
                 </td>
                 <td runat="server">
                     <asp:Label runat="server" Text='<%# Eval("EndTime") %>'></asp:Label>
                 </td>
                 <td runat="server">
                     <asp:Label runat="server" Text='<%# Eval("MachineID") %>'></asp:Label>
                 </td>
                 <td runat="server">
                     <asp:Label runat="server" Text='<%# Eval("Operator") %>'></asp:Label>
                 </td>
                 <td runat="server">
                     <asp:Label runat="server" Text='<%# Eval("downTime") %>'></asp:Label>
                 </td>

             </tr>
        
     </ItemTemplate>
          
     <EmptyDataTemplate>
         <table class="empty">
             <tr>
                 <td style="font-size: 30px; color: white; padding: 10px;">Sorry!!! there is no data available for given user input</td>
             </tr>
         </table>
     </EmptyDataTemplate>
 </asp:ListView>


    </form>
   
</body>
</html>
<%--AMIT-LT97\SQLEXPRESS--%>

