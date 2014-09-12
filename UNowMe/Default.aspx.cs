using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNowMe
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOkay_Click(object sender, EventArgs e)
        {
            var desc = Description.Text;
            var longi = longitude.Value;
            var lati = latitude.Value;
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {

        }
    }
}