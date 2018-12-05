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

namespace Diary
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            StartupInitializing();
        }

        private void StartupInitializing()
        {
            InitializeComponent();
            MainCalendar.DisplayDate = DateTime.Now;
            L_Day.Content = MainCalendar.DisplayDate.Day;
            L_LongDate.Content = MainCalendar.DisplayDate.DayOfWeek + " " + MainCalendar.DisplayDate.Day + ", " + MainCalendar.DisplayDate.Month.ToString() + " " + MainCalendar.DisplayDate.Year;
            L_Week.Content = "Week " + MainCalendar.DisplayDate.DayOfYear / 7;
        }

        private void BT_AddTask_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
