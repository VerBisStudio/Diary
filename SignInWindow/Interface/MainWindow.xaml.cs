using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SignInWindow
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void BT_Login_Click(object sender, RoutedEventArgs e)
        {
            
            try
            {
                CheckInWindow check = new CheckInWindow();               
                check.ShowDialog();

            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void BT_SignIn_Click(object sender, RoutedEventArgs e)
        {
            if (TB_UserName.Text.Length > 0)
            {
                MessageBox.Show("ok");
            }
            else
            {
                MessageBox.Show("Enter login");
            }
        }
    }
}
