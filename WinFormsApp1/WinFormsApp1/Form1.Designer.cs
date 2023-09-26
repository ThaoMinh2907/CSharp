namespace WinFormsApp1
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            SuspendLayout();
            // 
            // Form1
            // 
            float screenWidth = Screen.PrimaryScreen.Bounds.Width;
            float screenHeight = Screen.PrimaryScreen.Bounds.Height;
            float scaleWidth = screenWidth / 1920; // 1920 là chiều rộng màn hình mặc định
            float scaleHeight = screenHeight / 1080; // 1080 là chiều cao màn hình mặc định

            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size((int)(800 * scaleWidth), (int)(600 * scaleHeight));
            Name = "Form1";
            StartPosition = FormStartPosition.WindowsDefaultBounds;
            Text = "Form1";
            WindowState = FormWindowState.Maximized;
            Load += Form1_Load;
            ResumeLayout(false);
        }

        #endregion
    }
}