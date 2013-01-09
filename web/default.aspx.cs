﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class _default : System.Web.UI.Page
    {
        
        protected override void InitializeCulture()
        {
            // dropdown change languages
            if (Request.Form["language"] != null)
            {
                String selectedLanguage = Request.Form["language"];
                UICulture = selectedLanguage;
                Culture = selectedLanguage;
                System.Threading.Thread.CurrentThread.CurrentCulture =  System.Globalization.CultureInfo.CreateSpecificCulture(selectedLanguage);
                System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(selectedLanguage);
            }
            base.InitializeCulture();
        }
         

        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            if (UICulture == null)
                language.Visible = false;
             */
           // System.Threading.Thread.Sleep(1000);

        }

        protected void language_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



    }
}