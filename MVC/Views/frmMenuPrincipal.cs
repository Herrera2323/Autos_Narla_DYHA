using System;
using System.Windows.Forms;

namespace AutosNARLA.Views
{
    public class frmMenuPrincipal : Form
    {
        private Button btnListar, btnAgregar, btnVentas, btnFiltros, btnSalir;

        public frmMenuPrincipal()
        {
            InitializeComponent();
            btnSalir.Click += (s, e) => this.Close();
        }

        private void InitializeComponent()
        {
            this.Text = "AutosNARLA - Menú Principal";
            this.Width = 1000;
            this.Height = 680;
            this.StartPosition = FormStartPosition.CenterScreen;

            btnListar = new Button() { Text = "Listar Vehículos", Left = 20, Top = 30, Width = 200, Height =40, FlatStyle = FlatStyle.Flat };
            btnAgregar = new Button() { Text = "Agregar Vehículo", Left = 20, Top = 90, Width = 200, Height =40, FlatStyle = FlatStyle.Flat };
            btnVentas = new Button() { Text = "Registrar Venta", Left = 20, Top = 150, Width = 200, Height =40, FlatStyle = FlatStyle.Flat };
            btnFiltros = new Button() { Text = "Filtros / Consultas", Left = 20, Top = 210, Width = 200, Height =40, FlatStyle = FlatStyle.Flat };
            btnSalir = new Button() { Text = "Salir", Left = 20, Top = 270, Width = 200, Height =40, FlatStyle = FlatStyle.Flat };

            btnListar.Click += BtnListar_Click;
            btnAgregar.Click += BtnAgregar_Click;
            btnVentas.Click += BtnVentas_Click;
            btnFiltros.Click += BtnFiltros_Click;
           

            Panel left = new Panel() { Left = 0, Top = 0, Width = 240, Height = this.Height, BackColor = System.Drawing.Color.WhiteSmoke, Anchor = AnchorStyles.Left | AnchorStyles.Top | AnchorStyles.Bottom };
            left.Controls.Add(btnListar);
            left.Controls.Add(btnAgregar);
            left.Controls.Add(btnVentas);
            left.Controls.Add(btnFiltros);
            left.Controls.Add(btnSalir);

            Label header = new Label() { Text = "AutosNARLA", Left = 260, Top = 20, Font = new System.Drawing.Font("Segoe UI", 18), AutoSize = true };

            this.Controls.Add(left);
            this.Controls.Add(header);
        }

        private void BtnListar_Click(object sender, EventArgs e)
        {
            var f = new frmListarVehiculos();
            f.ShowDialog();
        }

        private void BtnAgregar_Click(object sender, EventArgs e)
        {
            var f = new frmAgregarVehiculo();
            f.ShowDialog();
        }

        private void BtnVentas_Click(object sender, EventArgs e)
        {
            var f = new frmRegistrarVenta();
            f.ShowDialog();
        }

        private void BtnFiltros_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Filtros y consultas disponibles en la interfaz de Listado.");
        }
    }
}
