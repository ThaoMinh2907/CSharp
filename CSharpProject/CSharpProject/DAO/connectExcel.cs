using System;
using OfficeOpenXml;

namespace CSharpProject.DAO
{
	public class connectExcel
	{
         
		public connectExcel()
		{
			
        }
		public static void exportDataToExcel(string path, String sheet_name, IList<IList<object>> data) {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            // Tạo một tệp Excel mới
            //var newFile = new FileInfo("/CSharpProject/CSharpProject/CSharpProject/DAO/Excel/demo2.xlsx");
            var newFile = new FileInfo(path);
            using (var package = new ExcelPackage(newFile))
            {
                // Tạo một trang tính (worksheet) mới
                // Kiểm tra xem trang tính có tồn tại trong tệp Excel không
                bool sheetExists = package.Workbook.Worksheets.Any(sheet => sheet.Name == sheet_name);
                if (sheetExists)
                {
                    // Delete the worksheet
                    package.Workbook.Worksheets.Delete(package.Workbook.Worksheets[sheet_name]);
                }
                var worksheet = package.Workbook.Worksheets.Add(sheet_name);
                int i = 0;
                foreach (var rows in data)
                {
                    i++;
                    int j = 0;
                    foreach (var col in rows)
                    {
                        j++;
                        worksheet.Cells[i, j].Value = $"{col} "; 
                    }
                }
                //// Ghi dữ liệu vào ô A1
                //worksheet.Cells["A1"].Value = "Tên";
                //// Ghi dữ liệu vào ô B1
                //worksheet.Cells["B1"].Value = "Tuổi";

                //// Ghi dữ liệu vào ô A2
                //worksheet.Cells["A2"].Value = "John";
                //// Ghi dữ liệu vào ô B2
                //worksheet.Cells["B2"].Value = 38;

                //// Ghi dữ liệu vào ô A3
                //worksheet.Cells["A3"].Value = "Alice";
                //// Ghi dữ liệu vào ô B3
                //worksheet.Cells["B3"].Value = 25;

                // Lưu tệp Excel
                package.Save();
            }
        }
	}
}

