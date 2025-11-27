using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectNew.Models;

namespace ProjectNew.Controllers
{
    public class AdminController : Controller
    {
        QLTTEntities1 db = new QLTTEntities1();

        // GET: Admin
        private bool IsAdmin()
        {
            return Session["Type"]?.ToString() == "Admin";
        }

        public ActionResult Index(string search)
        {
            if (!IsAdmin()) return RedirectToAction("Login", "AdminAccount");

            var list = db.News.AsQueryable();
            if (!string.IsNullOrEmpty(search))
                list = list.Where(t => t.Header.Contains(search));

            return View(list.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            if (!IsAdmin()) 
                return RedirectToAction("Login", "AdminAccount");
            return View();
        }

        [HttpPost]
        public ActionResult Create(News tin)
        {
            tin.AdminId = (int)Session["AdminId"];
            tin.Posted = DateTime.Now;
            db.News.Add(tin);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            return View(db.News.Find(id));
        }

        [HttpPost]
        public ActionResult Edit(News tin)
        {
            if(ModelState.IsValid)
            {
                db.Entry(tin).State = EntityState.Modified;
                tin.Posted = DateTime.Now;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tin);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            return View(db.News.Find(id));
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            var tin = db.News.Find(id);
            db.News.Remove(tin);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}