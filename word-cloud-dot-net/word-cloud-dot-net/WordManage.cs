using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace word_cloud_dot_net
{
    public class WordManage
    {
        //Special Charactor Remove
        public string RemoveSpecialSymbole(string input)
        {
            string W = input.Replace("\r\n", " ");
            Regex regex = new Regex("[^a-zA-Z0-9 ]");
            return regex.Replace(W, " ");
        }
        
        public DataTable checkcount(string WordString)
        {
            //string WW = WordString.ToLower();
            string[] WordCount = WordString.ToLower().Split(' ');
            DataTable ds = new DataTable("WordDataTable");
            ds.Columns.Add(new DataColumn("WText", typeof(string)));
            ds.Columns.Add(new DataColumn("WCount", typeof(string)));
            for (int i = 0; i < WordCount.Length; i++)
            {
                int count = 0;
                for (int j = 0; j < WordCount.Length; j++)
                {
                    if (WordCount[i].Equals(""))
                    {

                    }
                    else if (WordCount[i].Equals(WordCount[j]))
                    {
                        count++;
                    }
                    if (j == WordCount.Length - 1)
                    {
                        DataRow dr = ds.Select("WText='" + WordCount[i] + "'").FirstOrDefault();
                        if (dr == null)
                        {
                            string[] a = new string[2];
                            a[0] = WordCount[i];
                            a[1] = count.ToString();
                            ds.Rows.Add(a[0], a[1]);
                        }
                    }
                }
            }
            return ds;
        }
        public string setValue(DataTable ds)
        {
            string FrontData = null;
            foreach (DataRow dr in ds.Rows)
            {
                if (FrontData == null)
                {
                    FrontData = "{ text: '" + dr["WText"] + "', weight: " + dr["WCount"] + " }";
                }
                else
                {
                    FrontData += ",{ text: '" + dr["WText"] + "', weight: " + dr["WCount"] + " }";
                }
            }
            return FrontData;
        }
    }
}