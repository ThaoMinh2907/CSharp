using System.Data.SqlClient;
using CSharpProject.DAO;

class Program
{
    static void Main()
    {
        //SqlConnection connection = Connect.ConnectToDatabase();
        //// Thực hiện các tác vụ với connection ở đây
        //// Sau khi hoàn thành, đảm bảo đóng kết nối
        //Connect.CloseConnection(connection);
        ConnectGGSheet.ReadDataFromGoogleSheets();

        Console.WriteLine("Hoàn thành.");
    }
}