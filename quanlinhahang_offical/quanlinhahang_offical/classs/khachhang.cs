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
    class khachhang
    {
        connect cn = new connect();
        public DataTable showkhachhang()
        {
            DataTable kp = null;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cnt;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"showkhachhang";
            SqlDataAdapter adt = new SqlDataAdapter();
            adt.SelectCommand = cmd;
            kp = new DataTable();
            adt.Fill(kp);


            return kp; 
        }

        public int id;
        public string name_kh;
        public bool gioitinh;
        public string quequan;
        public DateTime ngaysinh;
        public int sdt;
        public int sothe;
        public khachhang()
        {
         id =0;
        name_kh=null;
        gioitinh=false;
        quequan=null;
       ngaysinh=DateTime.Now;
        sdt=0;
        sothe=0;
        }
    }
}
