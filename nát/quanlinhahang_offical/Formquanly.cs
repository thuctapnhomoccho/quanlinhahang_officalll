using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using quanlinhahang_offical.classs;
namespace quanlinhahang_offical
{
    public partial class Formquanly : Form
    {
        public Formquanly()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_idkhachhang.Text = data_khachhang.Rows[e.RowIndex].Cells[0].Value.ToString();
            txt_tenkhachhang.Text = data_khachhang.Rows[e.RowIndex].Cells[1].Value.ToString();
             rb_nam.Checked =bool.Parse(data_khachhang.Rows[e.RowIndex].Cells[2].Value.ToString());
            rb_nu.Checked =! rb_nam.Checked;
            dt_ngaysinh.Text = data_khachhang.Rows[e.RowIndex].Cells[3].Value.ToString();
            txt_diachi.Text= data_khachhang.Rows[e.RowIndex].Cells[4].Value.ToString();
            txt_sđt.Text= data_khachhang.Rows[e.RowIndex].Cells[5].Value.ToString();
            txt_sothe.Text= data_khachhang.Rows[e.RowIndex].Cells[6].Value.ToString();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        public void enableControl(bool bl)
        {
            txt_idkhachhang.Enabled = bl;
            txt_diachi.Enabled = bl;
            txt_tenkhachhang.Enabled = bl;
            txt_sđt.Enabled = bl;
            txt_sothe.Enabled = bl;
            rb_nam.Enabled = bl;
            rb_nu.Enabled = bl;
            dt_ngaysinh.Enabled = bl;
         
        }
        private void tabControl1_Click(object sender, EventArgs e)
        {
            khachhang kh = new khachhang();
            data_khachhang.DataSource = kh.showkhachhang();
            data_khachhang.RowHeadersVisible = false;
            enableControl(false);
            button1.Visible = false;
       
        }

        private void txt_tenkhachhang_TextChanged(object sender, EventArgs e)
        {

        }

        private void txt_ngaysinh_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            tabControl1_Click(sender, e);
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            enableControl(true);
            chucnang = "them";
            button1.Text = "Thêm mới ";
            button1.Visible = true;
        }
        string chucnang = null;
        private void button1_Click(object sender, EventArgs e) // nút button thực hiện chức năng thêm sửa xóa 
        {
            switch (chucnang)
            {
                case "them":
                    {
                        khachhang khnew = new khachhang();
                        khnew.name_kh = txt_tenkhachhang.Text;
                        if (rb_nam.Checked) khnew.gioitinh = true;
                        else khnew.gioitinh = false;
                        khnew.quequan = txt_diachi.Text;
                        khnew.ngaysinh = DateTime.Parse(dt_ngaysinh.Text); khnew.ngaysinh = DateTime.Parse(khnew.ngaysinh.ToShortDateString());
                        khnew.sdt = int.Parse(txt_sđt.Text);
                        khnew.sothe = int.Parse(txt_sothe.Text);

                        if (khnew.insert_Khachhang(khnew))
                        {
                            MessageBox.Show("Bạn đã thêm thành công ! ");
                        }
                        else
                        {
                            MessageBox.Show("Thêm thất bại thử lại !");
                        }
                        tabControl1_Click(sender, e);
                        chucnang = null;
                        return;
                    }
                case "sua":
                    {
                        khachhang khnew = new khachhang();
                        khnew.id = int.Parse(txt_idkhachhang.Text);
                        khnew.name_kh = txt_tenkhachhang.Text;
                        if (rb_nam.Checked) khnew.gioitinh = true;
                        else khnew.gioitinh = false;
                        khnew.quequan = txt_diachi.Text;
                        khnew.ngaysinh = DateTime.Parse(dt_ngaysinh.Text); khnew.ngaysinh = DateTime.Parse(khnew.ngaysinh.ToShortDateString());
                        khnew.sdt = int.Parse(txt_sđt.Text);
                        khnew.sothe = int.Parse(txt_sothe.Text);

                        if (khnew.update_khachhang(khnew))
                        {
                            MessageBox.Show("Bạn đã sửa thành công ! ");
                        }
                        else
                        {
                            MessageBox.Show("Sửa thất bại thử lại !");
                        }
                        tabControl1_Click(sender, e);
                        chucnang = null;
                        return;
                    }
                case "xoa":
                    {
                        khachhang khnew = new khachhang();
                        khnew.id = int.Parse(txt_idkhachhang.Text);
                        khnew.name_kh = txt_tenkhachhang.Text;
                        String captionform = " Xóa khách hàng  ";
                        String mess = " Bạn có muốn xóa khách hàng " + khnew.name_kh + " không ? ";
                        var result = MessageBox.Show(mess, captionform, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (result == DialogResult.Yes)
                        {
                            if (khnew.delete_khachhang(khnew))
                            {
                                MessageBox.Show("Bạn đã xóa thành công " + txt_tenkhachhang.Text + "   ! ");
                            }
                            else
                            {
                                MessageBox.Show("Bạn chưa thể xóa " + txt_tenkhachhang.Text + "  !");
                            }
                        }
                        else
                        {
                            tabControl1_Click(sender, e);
                            chucnang = null;
                        }
                        tabControl1_Click(sender, e);
                        chucnang = null;
                        return;
                    }
              
            }
          
            
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            enableControl(true);
            chucnang = "sua";
            button1.Text = "Sửa thông tin ";
            button1.Visible = true;
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            enableControl(true);
            chucnang = "xoa";
            button1.Visible = true;
            button1.Text = "Xóa khách hàng ";


        }

        private void tool_btn_search_Click(object sender, EventArgs e)
        {
          
            khachhang khnew = new khachhang();
            khnew.name_kh = tool_txtsearch.Text;
            if (khnew.seach_khachhang(khnew).Rows.Count!=0)
            {
                tool_txtsearch = null;
                MessageBox.Show("Tìm được " + khnew.seach_khachhang(khnew).Rows.Count + " khách hàng ! ");
                data_khachhang.DataSource = null;
                data_khachhang.DataSource = khnew.seach_khachhang(khnew);
                
            }
            else
            {
                khnew.quequan = tool_txtsearch.Text;
                khnew.name_kh = null;
                if (khnew.seach_khachhang_diachi(khnew).Rows.Count!=0)
                {


                    tool_txtsearch = null;
                    MessageBox.Show("Tìm được " + khnew.seach_khachhang(khnew).Rows.Count + " khách hàng ! ");
                    data_khachhang.DataSource = khnew.seach_khachhang_diachi(khnew);
                }
                else
                {
                    MessageBox.Show("Không tìm thấy kết quả !  ");
                }
            }
        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void toolStrip2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void toolStripTextBox1_Click(object sender, EventArgs e)
        {

        }

        private void groupBox4_Enter(object sender, EventArgs e)
        {

        }

        private void label13_Click(object sender, EventArgs e)
        {

        }
    }
}
