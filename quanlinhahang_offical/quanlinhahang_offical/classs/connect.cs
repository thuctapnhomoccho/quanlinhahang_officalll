using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace quanlinhahang_offical.classs
{
    class connect
    {
      private  string cnn = @"Data Source=DESKTOP-AMTNAOM\SQLEXPRESS;Initial Catalog=quanlinhahang;Integrated Security=True";
      public SqlConnection cnt;
        public connect()
        {
             cnt = new SqlConnection(cnn);
          

        }
        public bool isConnect()
        {
            bool kp = false;
            try
            {
                cnt.Open();
                if (cnt.State == System.Data.ConnectionState.Open)
                {
                    kp = true;
                }
                else
                {
                    kp = false;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            return kp;
          
        }
      
    }
}
