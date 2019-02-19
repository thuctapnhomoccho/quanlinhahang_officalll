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
    class banan
    {
        connect cn = new connect();
        public DataTable showbanan()
        {
            DataTable dt = new DataTable();
            if (cn.isConnect())
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn.cnt;
                cmd.CommandText = @"showbanan";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adt = new SqlDataAdapter(cmd);
                adt.Fill(dt);
            }
            return dt;
        }

    }
}
