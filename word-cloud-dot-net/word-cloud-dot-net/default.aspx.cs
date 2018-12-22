using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace word_cloud_dot_net
{
    public partial class WordCloudWebPage : System.Web.UI.Page
    {
        public string WordList = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            chk_type();
        }

        private void chk_type()
        {
            if(DropDownList1.SelectedItem.Value.Equals("0")) {
                Panel2.Visible = true;
            } else {
                Panel1.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string TextPart = "";
            bool flag = false;
            if(DropDownList1.SelectedItem.Value.Equals("0"))
            {
                if(FileUpload1.HasFile)
                {
                    if(Path.GetExtension(FileUpload1.FileName)==".txt")
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/TxtFile/New.txt"));
                        flag = true;
                    }
                    else
                    {
                        CustomValidator1.IsValid = false;
                        flag = false;
                    }
                }
                if(File.Exists(Server.MapPath("~/TxtFile/New.txt")))
                {
                    TextPart = File.ReadAllText(Server.MapPath("~/TxtFile/New.txt"));
                    string path = Server.MapPath("~/TxtFile/New.txt");
                }
            }
            else
            {
                TextPart = TextBox1.Text;
                flag = true;
            }
            if(flag)
            {
                WordManage wm = new WordManage();
                string WordString = wm.RemoveSpecialSymbole(TextPart);
                DataTable dt = new DataTable();
                dt = wm.checkcount(WordString);
                //GridView1.DataSource = dt;
                //GridView1.DataBind();
                WordList = wm.setValue(dt);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            DropDownList1.SelectedValue = "1";
            TextBox1.Text = "";
            WordList = "";
            chk_type();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            chk_type();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}