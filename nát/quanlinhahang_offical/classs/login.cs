using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using quanlinhahang_offical.classs;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace quanlinhahang_offical.classs
{
    class login
    {
        connect cn = new connect();
        
        public bool isLogin(string username , string password )
        {
            bool kp = false;
            if (cn.isConnect())
            {
                SqlCommand cmd = new SqlCommand();
                
                cmd.CommandText = @"checkaccount";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn.cnt;
                cmd.Parameters.AddWithValue("@user", username);
                cmd.Parameters.AddWithValue("@pass", password);

                //int i = cmd. ExecuteNonQuery();
                int i = Convert.ToInt32(cmd.ExecuteScalar());
                if (i > 0)
                    {
                        kp = true;
                    }
                    else
                    {
                        kp = false;
                    }
              
               
            }
            return kp;
            
        }
    }
}
