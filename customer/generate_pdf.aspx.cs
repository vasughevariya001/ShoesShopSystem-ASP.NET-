using iText.Kernel.Colors;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using iText.Layout.Properties;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iText.Kernel.Pdf.Canvas.Draw;
using iText.Layout.Borders;
using iText.IO.Image;
using iText.Kernel.Pdf.Canvas;
using iText.Kernel.Geom;


namespace ShoesShopSystem.customer
{
    public partial class generate_pdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GeneratePdf();
        }
        protected void GeneratePdf()
        {
            string orderId = Session["order_id"].ToString();
            string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT odr_id, description, quantity, price, brand, category ,size FROM tbl_order_details WHERE odr_id = @orderId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@orderId", orderId);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                using (MemoryStream ms = new MemoryStream())
                {
                    PdfWriter writer = new PdfWriter(ms, new WriterProperties());
                    PdfDocument pdfDoc = new PdfDocument(writer);
                    Document doc = new Document(pdfDoc);

                    // Set page margins
                    pdfDoc.AddNewPage();
                    doc.SetMargins(86, 72, 36, 36);

                    // Set the background image
                    string backgroundImagePath = Server.MapPath("~/images/backgroung_invoice.jpg");
                    ImageData backgroundImageData = ImageDataFactory.Create(backgroundImagePath);
                    PdfCanvas canvas = new PdfCanvas(pdfDoc.GetFirstPage());
                    canvas.AddImageFittedIntoRectangle(backgroundImageData, new Rectangle(0, 0, pdfDoc.GetDefaultPageSize().GetWidth(), pdfDoc.GetDefaultPageSize().GetHeight()), false);

                    // Header
                    Paragraph header = new Paragraph("Shoes.Shop")
                        .SetTextAlignment(TextAlignment.CENTER)
                        .SetBold()
                        .SetFontSize(24)
                        .SetFontColor(new DeviceRgb(51, 102, 204));
                    doc.Add(header);

                    Paragraph invoiceHeader = new Paragraph("Invoice Details")
                        .SetTextAlignment(TextAlignment.CENTER)
                        .SetBold()
                        .SetFontSize(18)
                        .SetFontColor(new DeviceRgb(102, 102, 102));
                    doc.Add(invoiceHeader);

                    Paragraph orderIdParagraph = new Paragraph($"Order ID: {orderId}")
                        .SetTextAlignment(TextAlignment.RIGHT)
                        .SetBold()
                        .SetFontSize(12)
                        .SetFontColor(new DeviceRgb(102, 102, 102));
                    doc.Add(orderIdParagraph);

                    // Horizontal line
                    LineSeparator lineSeparator = new LineSeparator(new SolidLine());
                    doc.Add(lineSeparator);

                    // Table
                    iText.Layout.Element.Table table = new iText.Layout.Element.Table(new float[] { 1, 1, 1, 1, 1, 1 , 1 });
                    table.SetWidth(UnitValue.CreatePercentValue(100));
                    table.SetFixedLayout();
                    table.SetBackgroundColor(new DeviceRgb(255, 255, 255));

                    foreach (string headerText in new string[] { "Product Name", "Quantity", "Brand", "Category", "Size", "Price" , "Total Price" })
                    {
                        Cell headerCell = new Cell().Add(new Paragraph(headerText).SetBold()).SetBackgroundColor(new DeviceRgb(230, 230, 230));
                        table.AddHeaderCell(headerCell);
                    }

                    decimal grandTotal = 0;
                    // Add data row
                    foreach (DataRow row in dt.Rows)
                    {
                        decimal price = Convert.ToDecimal(row["price"]);
                        int quantity = Convert.ToInt32(row["quantity"]);
                        decimal grandTotalPrice = price * quantity;
                        grandTotal += grandTotalPrice;

                        table.AddCell(new Cell().Add(new Paragraph(row["description"].ToString())));
                        table.AddCell(new Cell().Add(new Paragraph(row["quantity"].ToString())));
                        table.AddCell(new Cell().Add(new Paragraph(row["brand"].ToString())));
                        table.AddCell(new Cell().Add(new Paragraph(row["category"].ToString())));
                        table.AddCell(new Cell().Add(new Paragraph(row["size"].ToString())));
                        table.AddCell(new Cell().Add(new Paragraph(row["price"].ToString())));
                        table.AddCell(new Cell().Add(new Paragraph(grandTotalPrice.ToString("0.00"))));
                    }

                    doc.Add(table);

                    // Horizontal line
                    doc.Add(lineSeparator);

                    // Total Product Price
                    //decimal totalProductTotal = dt.AsEnumerable().Sum(row => (Convert.ToDecimal(row["price"]) * Convert.ToInt32(row["quantity"])));
                    //Paragraph totalProductPrice = new Paragraph($"Total Product Price: {totalProductTotal}")
                    //    .SetTextAlignment(TextAlignment.RIGHT)
                    //    .SetBold()
                    //    .SetFontSize(16)
                    //    .SetFontColor(new DeviceRgb(51, 102, 204));
                    //doc.Add(totalProductPrice);

                    Paragraph grandTotalParagraph = new Paragraph($"Grand Total: {grandTotal.ToString("0.00")}")
                        .SetTextAlignment(TextAlignment.RIGHT)
                        .SetBold()
                        .SetFontSize(16)
                        .SetFontColor(new DeviceRgb(51, 102, 204));
                        doc.Add(grandTotalParagraph);

                    // Thanks for shopping
                    Paragraph thanks = new Paragraph("Thanks For Shopping")
                        .SetTextAlignment(TextAlignment.CENTER)
                        .SetBold()
                        .SetFontSize(16)
                        .SetFontColor(new DeviceRgb(102, 102, 102));
                    doc.Add(thanks);

                    doc.Close();

                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + orderId + ".pdf");
                    Response.BinaryWrite(ms.ToArray());
                    Response.End();
                }
            }
        }

    }
}