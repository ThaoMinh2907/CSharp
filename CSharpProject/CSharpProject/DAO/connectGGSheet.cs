using System;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.Sheets.v4;
using Google.Apis.Sheets.v4.Data;


namespace CSharpProject.DAO
{
    public class ConnectGGSheet
    {
        public static SheetsService GetSheetsService()
        {
            // Đường dẫn đến tệp JSON chứa thông tin xác thực OAuth 2.0
            string credentialFilePath = "/Users/minhthao/CSharp/CSharpProject/CSharpProject/CSharpProject/DAO/credentials.json";

            // Xác thực với tệp JSON
            GoogleCredential credential;
            using (var stream = new System.IO.FileStream(credentialFilePath, System.IO.FileMode.Open, System.IO.FileAccess.Read))
            {
                credential = GoogleCredential.FromStream(stream)
                    .CreateScoped(SheetsService.Scope.Spreadsheets);
            }

            // Tạo dịch vụ Google Sheets
            var service = new SheetsService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "Demo",
            });

            return service;
        }

        public static void ReadDataFromGoogleSheets()
        {
            try
            {
                var sheetsService = GetSheetsService();

                // Bây giờ bạn có thể sử dụng sheetsService để thực hiện các thao tác trên Google Sheets.
                // Ví dụ: Đọc dữ liệu từ một bảng tính

                string spreadsheetId = "1bGW9P2L3RjTP9N_0V035-bE2jyv8ahaGSSpECleQdQ4";
                string range = "demodata!A1:B2"; // Thay đổi vùng dữ liệu cần đọc
                SpreadsheetsResource.ValuesResource.GetRequest request =
                    sheetsService.Spreadsheets.Values.Get(spreadsheetId, range);

                ValueRange response = request.Execute();
                IList<IList<object>> values = response.Values;

                if (values != null && values.Count > 0)
                {
                    foreach (var row in values)
                    {
                        foreach (var col in row)
                        {
                            Console.Write($"{col} ");
                        }
                        Console.WriteLine();
                    }
                }
                else
                {
                    Console.WriteLine("Không tìm thấy dữ liệu.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi đọc dữ liệu từ Google Sheets: " + ex.Message);
            }
        }
    }
}
