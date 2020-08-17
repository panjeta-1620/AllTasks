using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrialTaskEntities;

namespace TrialTask.AccountPages
{
    public partial class SendEmailTo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                lblErrorMessage.Text = "";
                lblStatus.Text = "";

            }


        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    EmailEntities email = new EmailEntities();
                    email.EmailTo = txtTo.Text;
                    email.EmailSubject = txtSubject.Text;
                    email.EmailBody = txtBody.Text;
                    SendEmail(email);
                    txtTo.Text = "";
                    txtBody.Text = "";
                    txtSubject.Text = "";


                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = ex.Message;

                }

            }

        }

        public void SendEmail(EmailEntities emailEntities)
        {

            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(emailEntities.EmailTo);
                mailMessage.From = new MailAddress("swati@jktech.com");
                mailMessage.Subject = emailEntities.EmailSubject;
                mailMessage.Body = emailEntities.EmailBody;
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Host = "smtp.office365.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = ConfigurationManager.AppSettings["UserName"];
                ntwd.Password = ConfigurationManager.AppSettings["Password"];
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = ntwd;
                smtpClient.Port = 25;
                smtpClient.EnableSsl = true;
                smtpClient.Send(mailMessage);
                lblStatus.Text = "Mail has been sent successfully !!";

            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;

            }
        }
    }
}