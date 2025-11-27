using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectNew.Models;

namespace ProjectNew.Controllers
{
    public class AccountController : Controller
    {
        QLTTEntities1 db = new QLTTEntities1();

        // GET: Account
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("TrangChu", "TrangChu");
        }

        [HttpGet]
        public ActionResult LoginUser()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginUser(string email, string password)
        {
            var user = db.Users.FirstOrDefault(u => u.Email == email && u.UserPassword == password);

            if (user == null)
            {
                ViewBag.Error = "Sai email hoặc mật khẩu!";
                return View();
            }

            Session["UserId"] = user.UserId;
            Session["UserName"] = user.FullName;
            Session["Type"] = "User";

            return RedirectToAction("TrangChu", "TrangChu");
        }
    }
}