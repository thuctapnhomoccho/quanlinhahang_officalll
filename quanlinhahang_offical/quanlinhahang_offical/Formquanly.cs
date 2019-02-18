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
        public void enableControl()
        {
            groupBox3.Enabled = false;
        }
        private void tabControl1_Click(object sender, EventArgs e)
        {
            khachhang kh = new khachhang();
            data_khachhang.DataSource = kh.showkhachhang();
            data_khachhang.RowHeadersVisible = false;
            enableControl();
       
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
    }
}
