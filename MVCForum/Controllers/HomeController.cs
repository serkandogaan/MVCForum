using MVCForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace MVCForum.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        MVCForumEntities db = new MVCForumEntities();
        public ActionResult Index()
        {
            ViewBag.UyeSayisi = db.Uyelers.Count();
            ViewBag.MesajSayisi = db.Yorums.Count();
            ViewBag.KonuSayisi = db.Konus.Count();
            var forum = db.Kategoris.ToList();
            return View(forum);
        }

        public ActionResult Navbar()
        {
            return View();
        }

        public ActionResult KategoriKonulari(int id, int sayfa = 1)
        {
            var forumkategori = db.Konus.Where(x => x.KategoriID == id).OrderBy(x => x.KategoriID).ToPagedList(sayfa,10);
            ViewBag.kategoriid = db.Kategoris.Where(x => x.KategoriID == id).Select(x => x.KategoriID).FirstOrDefault();
            ViewBag.kategoriadi = db.Kategoris.Where(x => x.KategoriID == id).Select(x => x.KategoriAdi).FirstOrDefault();
            return View(forumkategori);
        }

        [HttpGet]
        public ActionResult KonuIcerik(int id, int sayfa = 1)
        {
            ViewBag.konuicerik = db.Konus.Where(x => x.KonuID == id).Select(x => x.KonuIcerik).FirstOrDefault();
            ViewBag.konubaslik = db.Konus.Where(x => x.KonuID == id).Select(x => x.KonuBaslik).FirstOrDefault();
            ViewBag.konuuyeadi = db.Konus.Where(x => x.KonuID == id).Select(x => x.Uyeler.UyeAdi).FirstOrDefault();
            ViewBag.konuuyesoyad = db.Konus.Where(x => x.KonuID == id).Select(x => x.Uyeler.UyeSoyadi).FirstOrDefault();
            ViewBag.konuuyerol = db.Konus.Where(x => x.KonuID == id).Select(x => x.Uyeler.UyeRol).FirstOrDefault();
            ViewBag.konukategoriadi = db.Konus.Where(x => x.KonuID == id).Select(x => x.Kategori.KategoriAdi).FirstOrDefault();
            ViewBag.konukategoriid = db.Konus.Where(x => x.KonuID == id).Select(x => x.Kategori.KategoriID).FirstOrDefault();

            ViewBag.KullaniciUyeAdi = db.Uyelers.Where(x => x.UyeMail == HttpContext.User.Identity.Name).Select(x => x.UyeAdi).FirstOrDefault();
            ViewBag.KullaniciUyeSoyadi = db.Uyelers.Where(x => x.UyeMail == HttpContext.User.Identity.Name).Select(x => x.UyeSoyadi).FirstOrDefault();

            var forumicerik = db.Yorums.Where(x => x.KonuID == id).OrderBy(x => x.KonuID).ToPagedList(sayfa, 8);
            return View(forumicerik);
        }

        [HttpPost]
        public ActionResult KonuIcerik(int id, Yorum yeniyorum)
        {
            
            int KullaniciUyeID = db.Uyelers.Where(x => x.UyeMail == HttpContext.User.Identity.Name).Select(x => x.UyeID).FirstOrDefault();
            yeniyorum.UyeID = KullaniciUyeID;
            yeniyorum.KonuID = id;
            db.Yorums.Add(yeniyorum);
            db.SaveChanges();
            return RedirectToAction("KonuIcerik");
        }

        [HttpGet]
        public ActionResult KonuOlustur()
        {           
            return View();
        }

        [HttpPost]
        public ActionResult KonuOlustur(int id, Konu yenikonu)
        {
            yenikonu.UyeID = db.Uyelers.Where(x => x.UyeMail == HttpContext.User.Identity.Name).Select(x => x.UyeID).FirstOrDefault();
            yenikonu.KategoriID = id;
            db.Konus.Add(yenikonu);
            db.SaveChanges();
            return RedirectToAction("KonuIcerik", new { id = yenikonu.KonuID });
        }

        public ActionResult MesajiSil(int id)
        {
            var silinecekyorum = db.Yorums.Find(id);
            db.Yorums.Remove(silinecekyorum);
            int konuid = silinecekyorum.KonuID;
            db.SaveChanges();
            return RedirectToAction("KonuIcerik", new { id = konuid });
        }

    }
}