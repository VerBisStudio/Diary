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
using System.Windows.Shapes;

namespace SignInWindow
{
    /// <summary>
    /// Логика взаимодействия для CheckInWindow.xaml
    /// </summary>
    public partial class CheckInWindow : Window
    {
        public CheckInWindow()
        {
            InitializeComponent();
        }

        private void BT_Create_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Greate!! Your check in.");
        }
    }
}
