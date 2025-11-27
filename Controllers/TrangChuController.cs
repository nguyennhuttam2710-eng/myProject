using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectNew.Models;

namespace ProjectNew.Controllers
{

    public class TrangChuController : Controller
    {
        QLTTEntities1 db = new QLTTEntities1();

        public ActionResult Detail(int id)
        {
            var tin = db.News.Find(id);
            return View(tin);
        }

        // GET: TrangChu
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult DangNhap()
        {
            return View();
        }

        public ActionResult TrangChu(string search)
        {
            var result = db.News
                .Where(n => n.Header.Contains(search) || n.Content.Contains(search))
                .ToList();

            return View(result);
        }

        public ActionResult ThoiSu()
        {
            return View();
        }

        public ActionResult CongNghe()
        {
            return View();
        }

        public ActionResult GiaiTri()
        {
            return View();
        }

        public ActionResult TheThao()
        {
            return View();
        }

        public ActionResult KinhTe()
        {
            return View();
        }

        public ActionResult DoiSong()
        {
            return View();
        }

        public ActionResult GiaoDuc()
        {
            return View();
        }

        public ActionResult SucKhoe()
        {
            return View();
        }
    }
}