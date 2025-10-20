using System;
using System.Windows.Forms;

namespace AutosNARLA
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Views.frmMenuPrincipal());
        }
    }
}
