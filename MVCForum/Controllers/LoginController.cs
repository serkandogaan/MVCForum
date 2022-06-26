using MVCForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace MVCForum.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login

        MVCForumEntities db = new MVCForumEntities();

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Uyeler uye)
        {
            var UyeLogin = db.Uyelers.FirstOrDefault(x => x.UyeMail == uye.UyeMail && x.UyeSifre == uye.UyeSifre);
            if (UyeLogin != null)
            {
                FormsAuthentication.SetAuthCookie(UyeLogin.UyeMail, false);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.mesaj = "Hatalı giriş";
                return View();
            }
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(Uyeler yeniuye)
        {
            yeniuye.UyeRol = "Üye";
            db.Uyelers.Add(yeniuye);
            db.SaveChanges();
            var registereduye = db.Uyelers.FirstOrDefault(x => x.UyeMail == yeniuye.UyeMail && x.UyeSifre == yeniuye.UyeSifre);
            FormsAuthentication.SetAuthCookie(registereduye.UyeMail, false);
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}