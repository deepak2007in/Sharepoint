using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharePoint
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FileUpload"] == null && FileUpload1.HasFile)
            {
                Session["FileUpload"] = FileUpload1;
            }
            else if (Session["FileUpload"] != null && (!FileUpload1.HasFile))
            {
                FileUpload1 = (FileUpload)Session["FileUpload"];
            }
            else
            {
                Session["FileUpload"] = FileUpload1;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            btnSave.Text = "Save Done";
        }
    }
}