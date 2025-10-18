using System;
using System.Data;
using System.Windows.Forms;
using AutosNARLA.Controllers;

namespace AutosNARLA.Views
{
    public class frmListarVehiculos : Form
    {
        private DataGridView dgv;
        private Button btnOrdenarModelo, btnOrdenarMarca, btnOrdenarAno, btnRefrescar, btnCerrar;
        private VehiculoController controller = new VehiculoController();

        public frmListarVehiculos()
        {
            InitializeComponent();
            btnCerrar.Click += (s, e) => Close();
        }

        private void InitializeComponent()
        {

            this.Text = "Listado de Vehículos";
            this.Width = 1100;
            this.Height = 660;
            this.StartPosition = FormStartPosition.CenterParent;

            dgv = new DataGridView() { Left = 260, Top = 20, Width = 800, Height = 580, ReadOnly = true, AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill, SelectionMode = DataGridViewSelectionMode.FullRowSelect };
            btnOrdenarModelo = new Button() { Text = "Ordenar Modelo", Left = 20, Top = 30, Width = 220, Height=40 };
            btnOrdenarMarca = new Button() { Text = "Ordenar Marca", Left = 20, Top = 90, Width = 220, Height=40 };
            btnOrdenarAno = new Button() { Text = "Ordenar Año", Left = 20, Top = 150, Width = 220, Height=40 };
            btnRefrescar = new Button() { Text = "Refrescar", Left = 20, Top = 210, Width = 220, Height=40 };
            btnCerrar = new Button() { Text = "Cerrar", Left = 20, Top = 270, Width = 220, Height=40 };

            btnOrdenarModelo.Click += BtnOrdenarModelo_Click;
            btnOrdenarMarca.Click += BtnOrdenarMarca_Click;
            btnOrdenarAno.Click += BtnOrdenarAno_Click;
            btnRefrescar.Click += BtnRefrescar_Click;
         

            this.Controls.Add(dgv);
            this.Controls.Add(btnOrdenarModelo);
            this.Controls.Add(btnOrdenarMarca);
            this.Controls.Add(btnOrdenarAno);
            this.Controls.Add(btnRefrescar);
            this.Controls.Add(btnCerrar);

            this.Load += FrmListarVehiculos_Load;
        }

        private void FrmListarVehiculos_Load(object sender, EventArgs e)
        {
            RefreshGrid();
        }

        private void RefreshGrid()
        {
            try
            {
                DataTable dt = controller.ListarVehiculos();
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al cargar vehículos: " + ex.Message);
            }
        }

        private void BtnRefrescar_Click(object sender, EventArgs e)
        {
            RefreshGrid();
        }

        private void BtnOrdenarModelo_Click(object sender, EventArgs e)
        {
            if (dgv.Columns.Contains("Modelo"))
                dgv.Sort(dgv.Columns["Modelo"], System.ComponentModel.ListSortDirection.Ascending);
        }

        private void BtnOrdenarMarca_Click(object sender, EventArgs e)
        {
            if (dgv.Columns.Contains("Marca"))
                dgv.Sort(dgv.Columns["Marca"], System.ComponentModel.ListSortDirection.Ascending);
        }

        private void BtnOrdenarAno_Click(object sender, EventArgs e)
        {
            if (dgv.Columns.Contains("Ano"))
                dgv.Sort(dgv.Columns["Ano"], System.ComponentModel.ListSortDirection.Descending);
        }
    }
}
