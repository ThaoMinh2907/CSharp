
using CSharpProject.DAO;
using CSharpProject.DTO;
using System.Globalization;

class Program
{
    static void Main()
    {

        /*  Student student = new()
          {
              Name = "T"
          };
          Console.WriteLine(student.Name);*/




        //SqlConnection connection = Connect.ConnectToDatabase();
        //// Thực hiện các tác vụ với connection ở đây
        //// Sau khi hoàn thành, đảm bảo đóng kết nối
        //Connect.CloseConnection(connection);

        //Dữ liệu bạn muốn ghi vào Google Sheets
        /* var valuesToWrite = new List<IList<object>>
                 {
                     new List<object> { "Dữ liệu 1", "Dữ liệu 2", "Dữ liệu 3" },
                     new List<object> { "Dữ liệu 4", "Dữ liệu 5", "Dữ liệu 6" }
                 };*/
        //ConnectGGSheet.WriteDataToGoogleSheets("AcademicYear", valuesToWrite);
        string format = "dd/MM/yyyy HH:mm:ss";
        var values = ConnectGGSheet.ReadDataFromGoogleSheets("Student");
        //Console.WriteLine(values.Count);
        List<Student> students = new List<Student>();
        for (int row = 1; row < values.Count(); row++)
        {
            Student student = new()
            {
                ID = (string)values[row][0],
                Name = (string)values[row][1],
                Birthday = DateTime.ParseExact((string)values[row][2], format, CultureInfo.InvariantCulture),
                Phone = (string)values[row][3],
                Email = (string)values[row][4],
               
                
            };
            Console.WriteLine(student.ID + "\t\t" + "\t\t" + student.Name + "\t\t" + student.Birthday+"\t\t"+student.Phone+"\t\t"+student.Email);
            students.Add(student);
        }


        
       /* foreach (var row in values)
        {
            Student student = new()
            {
                Id = (string)row[0],
                Name = (string)row[1],
                Birthday = DateTime.ParseExact((string)row[2], "dd/MM/yyyy", CultureInfo.InvariantCulture)

            };
            Console.WriteLine(student.Id+"\t\t"+"\t\t"+student.Name+"\t\t"+student.Birthday);
            students.Add(student);
            *//*foreach (var col in row)
            {
                *//*Console.Write($"{col} ");*//*
                
            }*/
            /*Console.WriteLine();*//*
        }*/

        //        string filePath = "./CSharpProject/DAO/Excel/Demo.xlsx";
        //        ExcelConnector excelConnector = new ExcelConnector(filePath);

        //        string[] headers = { "Column1", "Column2", "Column3" };
        //        string[][] data = {
        //    new string[] { "Data1", "Data2", "Data3" },
        //    new string[] { "Data4", "Data5", "Data6" },
        //    // Thêm dữ liệu khác nếu cần
        //};

        //        excelConnector.WriteDataToExcel(headers, data);

        //string sheet_name = "Lớp 10A2";
        //connectExcel.exportDataToExcel("../../../DAO/Excel/demodemo.xlsx", sheet_name, ConnectGGSheet.ReadDataFromGoogleSheets(sheet_name));
        //initConnect.writeDataToTableAcademicYear(values);
    }
}







//using OfficeOpenXml;
//using System;
//using System.IO;

//    class Program
//    {
//        static void Main(string[] args)
//        {
//        ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
//        // Tạo một tệp Excel mới
//        var newFile = new FileInfo("/CSharpProject/CSharpProject/CSharpProject/DAO/Excel/demo2.xlsx");
//using (var package = new ExcelPackage(newFile))
//{
//    // Tạo một trang tính (worksheet) mới
//    var worksheet = package.Workbook.Worksheets.Add("DataSheet");

//    // Ghi dữ liệu vào ô A1
//    worksheet.Cells["A1"].Value = "Tên";
//    // Ghi dữ liệu vào ô B1
//    worksheet.Cells["B1"].Value = "Tuổi";

//    // Ghi dữ liệu vào ô A2
//    worksheet.Cells["A2"].Value = "John";
//    // Ghi dữ liệu vào ô B2
//    worksheet.Cells["B2"].Value = 38;

//    // Ghi dữ liệu vào ô A3
//    worksheet.Cells["A3"].Value = "Alice";
//    // Ghi dữ liệu vào ô B3
//    worksheet.Cells["B3"].Value = 25;

//    // Lưu tệp Excel
//    package.Save();
//}

//            Console.WriteLine("Dữ liệu đã được xuất ra tệp Excel.");
//        }
//    }







