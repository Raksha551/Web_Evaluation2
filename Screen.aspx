<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Screen.aspx.cs" Inherits="Evaluation2_Screens.Screen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <%--  <link href="lib/bootstrap-version/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="lib/bootstrap-version/bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="lib/bootstrap-version/bootstrap.min.js"></script>
 

    <link href="lib/bootstrap-multiselect/css/bootstrap-multiselect.min.css" rel="stylesheet" />
    <script src="lib/bootstrap-multiselect/js/bootstrap-multiselect.min.js"></script>
 
 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js" integrity="sha512-1V1LfkdFb5dlSJjEImkfBwiJhuqBLoWjWWYKI3kMvjOFm3y43yzHhyp1Swz31R7k2GOfVFKFA+7UDZkTdTBIqA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker.min.css" integrity="sha512-cSe3D7ePd2MI6J8MDnEAi52LVHpaSadXU+ML3bIOZepIdDLppMDBrkKtsgLe7WFmBji+HgGeY8o8ZFe0YWbfNQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker-standalone.min.css" integrity="sha512-7hJUjGwcXDB2zjYRCbqKpea+eoThf9VLF5x17Yp5AY7tGYgVAuPWyX+n917V5PYFVahk2bHC/ZPcSL2HpyJupQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/js/bootstrap-datetimepicker.min.js" integrity="sha512-JcceycVPblKG5oooLUNXGY7KhAvXxzppH+n7CFZMCb1Uj1hZzysaWaVsOukaZpb/qPL9zFGR66DDfTTxlVB5qw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    

 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js" integrity="sha512-1V1LfkdFb5dlSJjEImkfBwiJhuqBLoWjWWYKI3kMvjOFm3y43yzHhyp1Swz31R7k2GOfVFKFA+7UDZkTdTBIqA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker.min.css" integrity="sha512-cSe3D7ePd2MI6J8MDnEAi52LVHpaSadXU+ML3bIOZepIdDLppMDBrkKtsgLe7WFmBji+HgGeY8o8ZFe0YWbfNQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker-standalone.min.css" integrity="sha512-7hJUjGwcXDB2zjYRCbqKpea+eoThf9VLF5x17Yp5AY7tGYgVAuPWyX+n917V5PYFVahk2bHC/ZPcSL2HpyJupQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/js/bootstrap-datetimepicker.min.js" integrity="sha512-JcceycVPblKG5oooLUNXGY7KhAvXxzppH+n7CFZMCb1Uj1hZzysaWaVsOukaZpb/qPL9zFGR66DDfTTxlVB5qw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

     <script>
         $(document).ready(function () {
             // Enable multi-select dropdowns final-commit done
             $('#<%= lbxdowncode.ClientID %>').multiselect({
                 includeSelectAllOption: true,
                 buttonWidth: '160px',
             });

             $("#txtFromDate").datetimepicker({
                 format: 'DD-MM-YYYY HH:mm:ss',
                 locale: 'en-US',

             });
             $('[id$=txtToDate]').datetimepicker({
                 format: 'DD-MM-YYYY HH:mm:ss',
                 locale: 'en-US',
             });

         });
     </script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #0a0c3f !important;
          
        }


        .container {
            margin-top: 60px;
             border-bottom: 1px solid #ddd;
             width:100%;
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
            padding: 8px;
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
           /* width: 100%; *//* Adjust as needed */
            border-collapse: collapse;
           /* margin-top: 200px;*/
            margin: 40px 18%;
            position: relative;
            margin-left: 16%;
          width:120%;
           padding-bottom: 10px;
    padding-top: 50px;
   
    padding-left: 20px;
            border: 1px solid #DADBDD;
            table-layout: fixed;
           color: black;
            display: inline !important;
        }

        .filtertable > th{
             color: #DADBDD;
            
        }
         .filtertable > tbody > tr > td{
             padding-right: 60px;
         }

       .filtertable > th, .filtertable > td {
            padding: 20px;
            text-align: left;
            display: inline !important;
        }


        .filtertable > td {
            height: 50px;
            width: 180px;
            padding: 20px;
        }

        .filters {
            margin-top: 35px;
        }
         .righttable  tr:nth-child(even) {
            background-color: white;
            color: black;
        }


        .righttable  tr:nth-child(odd) {
            background-color: #D3D3D3 ; 
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

        .empty {
            margin-left: 300px;
            margin-top: 180px;
            border: 1px solid white;
            padding: 5px;
            color:#ddd;
        }

        .tablediv {
           
            margin-top: 70px;
            color: black;
            border-collapse: collapse;
        }

            .tablediv > tbody > tr > td {
                text-align: left;

            }

        .leftlabel {
            color:black;
            font-weight: bold;
            text-align: center;
             font-size: 20px;
 background-color: #D3D3D3;
 border:1px solid black;
 width:12%;
        }

        .righttable  tr {
            background-color: #f2f2f2;
            text-align: left;
            padding: 8px;
            font-weight: bold;
            line-height: 3;
            border: 1px solid black;
        }

        .righttable  td, .righttable  th {
            border:1px solid #ddd;
            text-align:center;
            width:230px;
        }

        .righttable {
            text-align: left;
            padding: 8px;
            line-height: 0px;
            border: 1px solid red;
            height: 20px;
            border-collapse: collapse;
            border: 1px solid black;         
            margin-right: auto;
        }      

        .heading {
    background-color: 	#004958 !important;
            color:white;
        }
        .serialheading{
            width:68px !important;
        }
        .serialdata{
            width:68px !important;
        }
        .opheading{
             
        }
        .startheading{
            
        }
        .endheading{
           
        }
        .downheading, .downdata{
             width:80px !important;
        }
        .idheading{
             
        }
      

    </style>
   
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
                        <asp:TextBox runat="server" ID="txtFromDate" CssClass="celllength" placeholder="From Date"  Style="color: black"  AutoCompleteType="Disabled"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label runat="server" Text="To Date" CssClass="cellname"></asp:Label>
                        <asp:TextBox runat="server" ID="txtToDate" CssClass="celllength" placeholder="To Date"  Style="color: black"  AutoCompleteType="Disabled"></asp:TextBox>
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

        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                  <div class="listviewdiv">
      <asp:ListView runat="server" ID="listview3" ItemPlaceholderID="itemplaceholder">
          <LayoutTemplate>
              <div runat="server" style="margin-left:13%;">
                  <asp:PlaceHolder ID="itemplaceholder" runat="server"></asp:PlaceHolder>
              </div>
          </LayoutTemplate>
          <ItemTemplate>
              <table style="width: 100%; margin:40px;" >
                  <tr>
                      <td class="leftlabel">
                          <strong>DownID: </strong>
                          <asp:Label ID="lbldownid" runat="server" Text='<%# Eval("downID") != DBNull.Value ? Eval("downID") : "Data Not Available" %>' ></asp:Label>
                      </td>
                      <td>
                          <asp:ListView runat="server" ItemPlaceholderID="itemPlaceholder" DataSource='<%# Eval("data") %>' >
                              <LayoutTemplate>
                                  <table class="righttable">
                                    
                                          <tr class="heading">
                                              <th class="serialheading">SerialNo</th>
                                              <th class="startheading">StartTime</th>
                                              <th class="endheading">EndTime</th>
                                              <th class="idheading">MachineID</th>
                                              <th class="opheading">Operator</th>
                                              <th class="downheading">Downtime</th>
                                          </tr>
                                     
                                      <tr id="itemPlaceholder" runat="server"></tr>
                                  </table>
                              </LayoutTemplate>
                              <ItemTemplate>
                                  <tr>
                                      <td runat="server" class="serialdata">
                                          <asp:Label runat="server" Text='<%# Eval("SerialNumber") %>'></asp:Label>
                                      </td>
                                      <td runat="server" class="startdata">

                                          <asp:Label runat="server" Text='<%# Eval("StartTime") %>'></asp:Label>
                                      </td>
                                      <td runat="server" class="enddata">
                                          <asp:Label runat="server" Text='<%# Eval("EndTime") %>'></asp:Label>
                                      </td>
                                      <td runat="server" class="iddata">
                                          <asp:Label runat="server" Text='<%# Eval("MachineID") %>'></asp:Label>
                                      </td>
                                      <td runat="server" class="opdata" >
                                          <asp:Label runat="server" Text='<%# Eval("Operator") %>'></asp:Label>
                                      </td>
                                      <td runat="server" class="downdata">
                                          <asp:Label runat="server" Text='<%# Eval("downtime") %>'></asp:Label>
                                      </td>
                                  </tr>
                              </ItemTemplate>
                          </asp:ListView>
                      </td>
                  </tr>
              </table>
          </ItemTemplate>
          <EmptyDataTemplate>
              <table class="empty">
                  <tr>
                      <td style="font-size: 30px; color: white; border:2px solid #ddd; position:fixed; padding: 20px; ">Sorry!!! there is no data available for given input</td>
                  </tr>
              </table>
          </EmptyDataTemplate>
      </asp:ListView>
  </div>

            </ContentTemplate>
        </asp:UpdatePanel>
      
        <%-- <asp:ListView runat="server" ItemPlaceholderID="itemPlaceholder" ID="listview1">
            <LayoutTemplate>
                <table class="listviewdata">
                    <tr runat="server">
                        <td runat="server"  id="itemPlaceholder"></td>
                    </tr>
                    
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
        </asp:ListView>--%>
    </form>

</body>
</html>
<%--AMIT-LT97\SQLEXPRESS--%>

.