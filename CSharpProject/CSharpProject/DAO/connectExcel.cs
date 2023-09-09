using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using Microsoft.Office.Interop.Excel;
//using Microsoft.Office.Interop.Excel.

public class ExcelConnector
{
    private string filePath;

    public ExcelConnector(string filePath)
    {
        this.filePath = filePath;
    }

    public void WriteDataToExcel(string[] headers, string[][] data)
    {
        using (SpreadsheetDocument spreadsheetDocument = SpreadsheetDocument.Create(filePath, SpreadsheetDocumentType.Workbook))
        {
            WorkbookPart workbookPart = spreadsheetDocument.AddWorkbookPart();
            workbookPart.Workbook = new DocumentFormat.OpenXml.Spreadsheet.Workbook();

            WorksheetPart worksheetPart = workbookPart.AddNewPart<WorksheetPart>();
            worksheetPart.Worksheet = new DocumentFormat.OpenXml.Spreadsheet.Worksheet(new SheetData());

            SheetData sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();

            // Thêm dòng tiêu đề
            Row headerRow = new Row();
            foreach (string header in headers)
            {
                headerRow.Append(CreateCell(header));
            }
            sheetData.AppendChild(headerRow);

            // Thêm dữ liệu từ mảng hai chiều
            foreach (string[] row in data)
            {
                Row dataRow = new Row();
                foreach (string value in row)
                {
                    dataRow.Append(CreateCell(value));
                }
                sheetData.AppendChild(dataRow);
            }

            workbookPart.Workbook.Save();
        }
    }

    private Cell CreateCell(string value)
    {
        Cell cell = new Cell(new InlineString(new Text(value)));
        cell.DataType = CellValues.InlineString;
        return cell;
    }
}