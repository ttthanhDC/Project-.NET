using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using XanhLaMVC.Controllers;

namespace ReportMvc.Controllers
{
    public class SendEmailController : Controller
    {
        //
        // GET: /SendEmail/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String send(String type, String data,String email)
        {
            if (!IsValidEmailAddress(email))
            {
                return "Địa chỉ Email không đúng định dạng!";
            }
            else
            {
                String Ranpassword = RandomPassword.Generate();
                Servies.SysUserServies.UpdatePasswordByEmail(email, Ranpassword);
                //Send Email
                string smtpAddress = "smtp.gmail.com";
                int portNumber = 587;
                bool enableSSL = true;
                string emailFrom = "xanhlacompany@gmail.com";
                string password = "Z1x2c3v4";
                string emailTo = email;
                string subject = "Mật khẩu mới cho email của bạn";
                string body = "Hello, Mr/Mrs <br>";
                body += "Mật khẩu của bạn : " + Ranpassword;
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(email);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new System.Net.NetworkCredential(emailFrom, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }

                return "Password mới đã được gửi tới hòm thư của bạn!";
            }

        }
        public bool IsValidEmailAddress(string s)
        {
            if (string.IsNullOrEmpty(s))
                return false;
            else
            {
                var regex = new System.Text.RegularExpressions.Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
                return regex.IsMatch(s) && !s.EndsWith(".");
            }
        }

    }
}
