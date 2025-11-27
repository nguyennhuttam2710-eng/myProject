using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectNew.Models;

namespace ProjectNew.Controllers
{
    public class SaveController : Controller
    {
        QLTTEntities1 db = new QLTTEntities1();

        // GET: Save
        public ActionResult Save(int id)
        {
            if (Session["UserId"] == null)
                return RedirectToAction("LoginUser", "Account");

            int uid = (int)Session["UserId"];

            var check = db.UserSaves.FirstOrDefault(s => s.UserId == uid && s.NewsId == id);
            if (check == null)
            {
                db.UserSaves.Add(new UserSave { UserId = uid, NewsId = id });
                db.SaveChanges();
            }

            return RedirectToAction("SavedList");
        }

        public ActionResult SavedList()
        {
            if (Session["UserId"] == null)
                return RedirectToAction("LoginUser", "Account");

            int uid = (int)Session["UserId"];

            var list = db.UserSaves.Where(s => s.UserId == uid).Select(s => s.News).ToList();
            return View(list);
        }

        public ActionResult Remove(int id)
        {
            if (Session["UserId"] == null)
                return RedirectToAction("LoginUser", "Account");

            int uid = (int)Session["UserId"];

            var item = db.UserSaves.FirstOrDefault(s => s.NewsId == id && s.UserId == uid);

            if (item != null)
            {
                db.UserSaves.Remove(item);
                db.SaveChanges();
            }

            return RedirectToAction("SavedList");
        }

    }
}