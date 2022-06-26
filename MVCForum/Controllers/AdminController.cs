using MVCForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCForum.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin

        MVCForumEntities db = new MVCForumEntities();
        public ActionResult AdminPage()
        {
            return View();
        }

        public ActionResult Kategoriler()
        {
            var kategoriler = db.Kategoris.ToList();
            return View(kategoriler);
        }

        [HttpPost]
        public ActionResult YeniKategoriEkle(Kategori yenikategori)
        {
            db.Kategoris.Add(yenikategori);
            db.SaveChanges();
            return RedirectToAction("Kategoriler");
        }

        public ActionResult Konular()
        {
            var konular = db.Konus.ToList();
            return View(konular);
        }

        public ActionResult Moderatorler()
        {
            var moderatorler = db.Uyelers.Where(x => x.UyeRol == "Mod").ToList();
            return View(moderatorler);
        }

        public ActionResult Uyeler()
        {
            var uyeler = db.Uyelers.ToList();
            return View(uyeler);
        }

        public ActionResult UyeYap(int id)
        {
            var secilenuye = db.Uyelers.Find(id);
            secilenuye.UyeRol = "Üye";
            db.SaveChanges();
            return RedirectToAction("Moderatorler");
        }

        public ActionResult ModYap(int id)
        {
            var secilenuye = db.Uyelers.Find(id);
            secilenuye.UyeRol = "Mod";
            db.SaveChanges();
            return RedirectToAction("Uyeler");
        }

    }
}