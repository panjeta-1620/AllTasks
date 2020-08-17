<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendEmailTo.aspx.cs" Inherits="TrialTask.AccountPages.SendEmailTo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
       <form id="form1" runat="server">  
           <h3 style="color:blue"> Custom Email Client</h3>
            <table >  
                <tr>  
                    <td></td>  
                    <td>  
                       <asp:Label ID="lblStatus" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
                    </td>  
                </tr>  
                 <tr>  
                    <td></td>  
                    <td>  
                       <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label> 
                    </td>  
                </tr>  
                <tr>  
                    <td>To</td>  
                    <td>  
                        <asp:TextBox ID="txtTo" runat="server" placeholder="Enter Email Address" Width="99%">  
                        </asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rfvTo" runat="server" ErrorMessage="Field is Required" ForeColor="Red" ControlToValidate="txtTo">  
                        </asp:RequiredFieldValidator>  
                         <asp:RegularExpressionValidator ID="revTo" runat="server" ErrorMessage="Email is invalid"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtTo">  
                        </asp:RegularExpressionValidator>  
                       
                    </td>  
                </tr>  
                
                <tr>  
                    <td>Subject</td>  
                    <td>  
                        <asp:TextBox ID="txtSubject" runat="server" Width="99%" placeholder="Enter Email Subject" >  
                        </asp:TextBox>  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorsubject" runat="server"  ErrorMessage="Field is Required" ForeColor="Red" ControlToValidate="txtSubject">  
                        </asp:RequiredFieldValidator>  
                    </td>  
                </tr>  
                <tr>  
                    <td>Body</td>  
                    <td>  
                        <asp:TextBox ID="txtBody" runat="server" Width="99%" Height="150px" placeholder="Enter Email Body" TextMode="MultiLine">  
                        </asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rfvBody" runat="server" ErrorMessage="Field is Required" ForeColor="Red" ControlToValidate="txtBody">  
                        </asp:RequiredFieldValidator>  
                    </td>  
                </tr>  
               
                <tr>  
                    <td></td>  
                    <td>  
                        <asp:Button ID="btnSend" OnClick="btnSend_Click" runat="server" BackColor="Green" Text="Send" Height="36px" Width="64px"/>  
                    </td>  
                </tr>  
               
            </table>  
        </form>  
</body>
</html>
