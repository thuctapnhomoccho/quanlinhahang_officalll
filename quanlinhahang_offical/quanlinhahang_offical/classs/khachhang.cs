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

        public bool insert_Khachhang(khachhang kh)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cnt;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"themkhachhang";
            cmd.Parameters.AddWithValue("@ten", kh.name_kh);
            cmd.Parameters.AddWithValue("@gioitinh", kh.gioitinh);
            cmd.Parameters.AddWithValue("@ngaysinh", kh.ngaysinh);
            cmd.Parameters.AddWithValue("@diachi", kh.quequan);
            cmd.Parameters.AddWithValue("@phone", kh.sdt);
            cmd.Parameters.AddWithValue("@card", kh.sothe);
            cn.cnt.Open();
            int kp = cmd.ExecuteNonQuery();
            if (kp > 0) return true;
            else return false;

        }

        public bool update_khachhang(khachhang kh)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cnt;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"update_khachhang";
            cmd.Parameters.AddWithValue("@id", kh.id);
            cmd.Parameters.AddWithValue("@ten", kh.name_kh);
            cmd.Parameters.AddWithValue("@gioitinh", kh.gioitinh);
            cmd.Parameters.AddWithValue("@ngaysinh", kh.ngaysinh);
            cmd.Parameters.AddWithValue("@diachi", kh.quequan);
            cmd.Parameters.AddWithValue("@phone", kh.sdt);
            cmd.Parameters.AddWithValue("@card", kh.sothe);
            cn.cnt.Open();
            int kp = cmd.ExecuteNonQuery();
            if (kp > 0) return true;
            else return false;
        }

        public bool delete_khachhang(khachhang kh)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cnt;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"delete_khachhang";
            cmd.Parameters.AddWithValue("@id", kh.id);
            cn.cnt.Open();
            int kp = cmd.ExecuteNonQuery();
            if (kp > 0) return true;
            else return false;
        }

        public DataTable seach_khachhang(khachhang kh)
        {
            DataTable dttb = new DataTable();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cnt;
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", kh.name_kh);
                cmd.CommandText = @"seach_khachhang";

                SqlDataAdapter adt = new SqlDataAdapter(cmd);

                adt.Fill(dttb);
            }
            catch (Exception)
            {

                
            }
         
          
            return dttb;
        }
        public DataTable seach_khachhang_diachi(khachhang kh)
        {
            DataTable dttb = new DataTable();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cnt;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"seach_khachhang_diachi";
            cmd.Parameters.AddWithValue("@diachi", kh.quequan);
       
            SqlDataAdapter adt = new SqlDataAdapter(cmd);
          
            adt.Fill(dttb);
        
            return dttb;
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
