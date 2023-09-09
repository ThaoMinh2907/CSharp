using System.Data.SqlClient;
using CSharpProject.DAO;
using Newtonsoft.Json.Linq;

class Program
{
    static void Main()
    {
        //SqlConnection connection = Connect.ConnectToDatabase();
        //// Thực hiện các tác vụ với connection ở đây
        //// Sau khi hoàn thành, đảm bảo đóng kết nối
        //Connect.CloseConnection(connection);

        // Dữ liệu bạn muốn ghi vào Google Sheets
        //var valuesToWrite = new List<IList<object>>
        //        {
        //            new List<object> { "Dữ liệu 1", "Dữ liệu 2", "Dữ liệu 3" },
        //            new List<object> { "Dữ liệu 4", "Dữ liệu 5", "Dữ liệu 6" }
        //        };
        //ConnectGGSheet.WriteDataToGoogleSheets("demodata", valuesToWrite);

        var values = ConnectGGSheet.ReadDataFromGoogleSheets("demodata");
        Console.WriteLine(values.Count);
        foreach (var row in values)
        {
            foreach (var col in row)
            {
                Console.Write($"{col} ");
            }
            Console.WriteLine();
        }

        //        string filePath = "./CSharpProject/DAO/Excel/Demo.xlsx";
        //        ExcelConnector excelConnector = new ExcelConnector(filePath);

        //        string[] headers = { "Column1", "Column2", "Column3" };
        //        string[][] data = {
        //    new string[] { "Data1", "Data2", "Data3" },
        //    new string[] { "Data4", "Data5", "Data6" },
        //    // Thêm dữ liệu khác nếu cần
        //};

        //        excelConnector.WriteDataToExcel(headers, data);
    }
}