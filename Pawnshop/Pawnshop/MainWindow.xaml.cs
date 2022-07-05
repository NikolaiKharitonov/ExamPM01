using Pawnshop.Model;
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

namespace Pawnshop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        PawnshopEntities connect = null;
        Staff currentStaff = null;
        public MainWindow()
        {
            connect = new PawnshopEntities();
            InitializeComponent();
        }

        public static bool Validation(string v1, string v2)
        {
            throw new NotImplementedException();
        }

        private void button1_Click(object sender, RoutedEventArgs e) //Очистка полей (логин и пароль)
        {
            LoginTextBox.Text = "";
            PasswordTextBox.Text = "";
        }

        private void button_Click(object sender, RoutedEventArgs e) //авторизация
        {
            currentStaff = connect.Staff.ToList().Find(x => x.Login == LoginTextBox.Text);

            if (currentStaff != null)
            {
                if (LoginTextBox.Text == currentStaff.Login
                && PasswordTextBox.Text == currentStaff.Password)
                {
                    MessageBox.Show("Авторизация выполнена успешна!");
                }
                else if (LoginTextBox.Text != currentStaff.Login
                    && PasswordTextBox.Text == currentStaff.Password)
                {
                    MessageBox.Show("Вы ввели неверный логин");
                }
                else if (LoginTextBox.Text == currentStaff.Login
                    && PasswordTextBox.Text != currentStaff.Password)
                {
                    MessageBox.Show("Вы ввели неверный пароль");
                }
                else if (LoginTextBox.Text != currentStaff.Login
                   && PasswordTextBox.Text != currentStaff.Password)
                {
                    MessageBox.Show("Вы ввели неверный логин и пароль");
                }
            }
            else
            {
                if (PasswordTextBox.Text == ""
                    && LoginTextBox.Text == "")
                {
                    MessageBox.Show("Введите логин и пароль");

                }
                else if (LoginTextBox.Text != "")
                {
                    MessageBox.Show("Данный пользователь с таким логином не существует");
                }
                else if (PasswordTextBox.Text != "")
                {
                    MessageBox.Show("Введите логин");
                }
                else
                {
                    MessageBox.Show("Данный пользователь с таким логином не существует");
                }
            }
        }
    }
}
