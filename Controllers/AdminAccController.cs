using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectNew.Models;

namespace ProjectNew.Controllers
{
    public class AdminAccController : Controller
    {
        QLTTEntities1 db = new QLTTEntities1();

        // GET: AdminAcc
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            var ad = db.Admins.FirstOrDefault(a => a.Username == username && a.AdminPassword == password);

            if (ad == null)
            {
                ViewBag.Error = "Sai tài khoản!";
                return View();
            }

            Session["AdminId"] = ad.AdminId;
            Session["AdminName"] = ad.FullName;
            Session["Type"] = "Admin";

            return RedirectToAction("Index", "Admin");
        }
    }
}