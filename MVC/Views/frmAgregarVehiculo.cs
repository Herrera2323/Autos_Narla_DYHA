using System;
using System.Windows.Forms;

namespace AutosNARLA.Views
{
    public class frmAgregarVehiculo : Form
    {
        private TextBox txtCodigo, txtModelo, txtAno, txtPrecio;
        private ComboBox cboMarca, cboTipo;
        private Button btnGuardar, btnCancelar;

        public frmAgregarVehiculo()
        {
            InitializeComponent();
            btnCancelar.Click += (s, e) => this.Close();
        }

        private void InitializeComponent()
        {
            this.Text = "Agregar Vehículo";
            this.Width = 700;
            this.Height = 480;
            this.StartPosition = FormStartPosition.CenterParent;

            Label lblCodigo = new Label() { Text = "Código", Left = 20, Top = 20 };
            txtCodigo = new TextBox() { Left = 160, Top = 20, Width = 420 };

            Label lblMarca = new Label() { Text = "Marca", Left = 20, Top = 70 };
            cboMarca = new ComboBox() { Left = 160, Top = 70, Width = 420, DropDownStyle = ComboBoxStyle.DropDownList };

            Label lblModelo = new Label() { Text = "Modelo", Left = 20, Top = 120 };
            txtModelo = new TextBox() { Left = 160, Top = 120, Width = 420 };

            Label lblAno = new Label() { Text = "Año", Left = 20, Top = 170 };
            txtAno = new TextBox() { Left = 160, Top = 170, Width = 120 };

            Label lblTipo = new Label() { Text = "Tipo", Left = 320, Top = 170 };
            cboTipo = new ComboBox() { Left = 360, Top = 170, Width = 220, DropDownStyle = ComboBoxStyle.DropDownList };

            Label lblPrecio = new Label() { Text = "Precio", Left = 20, Top = 220 };
            txtPrecio = new TextBox() { Left = 160, Top = 220, Width = 200 };

            btnGuardar = new Button() { Text = "Guardar", Left = 160, Top = 280, Width = 140, Height=40 };
            btnCancelar = new Button() { Text = "Cancelar", Left = 320, Top = 280, Width = 140, Height=40 };

            btnGuardar.Click += BtnGuardar_Click;
            

            this.Controls.Add(lblCodigo); this.Controls.Add(txtCodigo);
            this.Controls.Add(lblMarca); this.Controls.Add(cboMarca);
            this.Controls.Add(lblModelo); this.Controls.Add(txtModelo);
            this.Controls.Add(lblAno); this.Controls.Add(txtAno);
            this.Controls.Add(lblTipo); this.Controls.Add(cboTipo);
            this.Controls.Add(lblPrecio); this.Controls.Add(txtPrecio);
            this.Controls.Add(btnGuardar); this.Controls.Add(btnCancelar);
        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCodigo.Text) || string.IsNullOrWhiteSpace(txtModelo.Text))
            {
                MessageBox.Show("Código y Modelo son obligatorios.");
                return;
            }

            if (!int.TryParse(txtAno.Text, out int ano))
            {
                MessageBox.Show("Año inválido.");
                return;
            }

            if (!decimal.TryParse(txtPrecio.Text, out decimal precio))
            {
                MessageBox.Show("Precio inválido.");
                return;
            }

            // TODO: Implementar lógica para validar que no haya >4 unidades del mismo modelo usando SP/consulta
            MessageBox.Show("Validación OK. Implementa llamada al SP sp_InsertVehiculo en el controlador.");
            this.Close();
        }
    }
}
