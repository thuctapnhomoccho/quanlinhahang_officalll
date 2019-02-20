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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            login lg = new login();
           if( lg.isLogin(txt_user.Text, txt_pass.Text)==true)
            {
                this.Hide();
                Formquanly f2 = new Formquanly();
                f2.Show();
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {
            
        }
    }
}
