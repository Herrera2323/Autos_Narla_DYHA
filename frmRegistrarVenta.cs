using System;
using System.Windows.Forms;
using AutosNARLA.Controllers;

namespace AutosNARLA.Views
{
    public class frmRegistrarVenta : Form
    {
        private TextBox txtCodigoVehiculo;
        private ComboBox cboCliente, cboEmpleado;
        private NumericUpDown numDescuento;
        private Button btnRegistrar, btnCancelar;
        private VentaController controller = new VentaController();

        public frmRegistrarVenta()
        {
            InitializeComponent();
            btnCancelar.Click += (s, e) => this.Close();
        }

        private void InitializeComponent()
        {
            this.Text = "Registrar Venta";
            this.Width = 600;
            this.Height = 420;
            this.StartPosition = FormStartPosition.CenterParent;

            Label lblCodigo = new Label() { Text = "Código Vehículo", Left = 20, Top = 20 };
            txtCodigoVehiculo = new TextBox() { Left = 160, Top = 20, Width = 320 };

            Label lblCliente = new Label() { Text = "ClienteId", Left = 20, Top = 70 };
            cboCliente = new ComboBox() { Left = 160, Top = 70, Width = 320 };

            Label lblEmpleado = new Label() { Text = "EmpleadoId", Left = 20, Top = 120 };
            cboEmpleado = new ComboBox() { Left = 160, Top = 120, Width = 320 };

            Label lblDesc = new Label() { Text = "Descuento (%)", Left = 20, Top = 170 };
            numDescuento = new NumericUpDown() { Left = 160, Top = 170, Width = 120, DecimalPlaces = 2, Maximum = 10, Minimum = 0 };

            btnRegistrar = new Button() { Text = "Registrar", Left = 160, Top = 230, Width = 140, Height=40 };
            btnCancelar = new Button() { Text = "Cancelar", Left = 320, Top = 230, Width = 140, Height=40 };

            btnRegistrar.Click += BtnRegistrar_Click;
           

            this.Controls.Add(lblCodigo); this.Controls.Add(txtCodigoVehiculo);
            this.Controls.Add(lblCliente); this.Controls.Add(cboCliente);
            this.Controls.Add(lblEmpleado); this.Controls.Add(cboEmpleado);
            this.Controls.Add(lblDesc); this.Controls.Add(numDescuento);
            this.Controls.Add(btnRegistrar); this.Controls.Add(btnCancelar);
        }

        private void BtnRegistrar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCodigoVehiculo.Text))
            {
                MessageBox.Show("Ingrese el código del vehículo.");
                return;
            }

            decimal descuento = numDescuento.Value / 100m;
            if (descuento > 0.10m)
            {
                MessageBox.Show("El descuento no puede superar el 10%.");
                return;
            }

            try
            {
                controller.RealizarVenta(txtCodigoVehiculo.Text, 1, 2, descuento); // ejemplo ids
                MessageBox.Show("Venta registrada correctamente.");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al registrar venta: " + ex.Message);
            }
        }
    }
}
