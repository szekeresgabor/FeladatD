using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FeladatD
{
    public partial class frmProdct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void grdProcut_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grdProcut.SelectedRow;
            Response.Redirect("frmSalesOrderDetail.aspx?ProductID=" + row.Cells[0].Text);
        }
    }
}