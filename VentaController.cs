using System;
using System.Data.SqlClient;
using System.Configuration;

namespace AutosNARLA.Controllers
{
    public class VentaController
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["AutosNARLA"].ConnectionString;

        public void RealizarVenta(string codigoVehiculo, int clienteId, int empleadoId, decimal descuentoPct)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("autos.sp_RealizarVenta", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CodigoVehiculo", codigoVehiculo);
                cmd.Parameters.AddWithValue("@ClienteId", clienteId);
                cmd.Parameters.AddWithValue("@EmpleadoId", empleadoId);
                cmd.Parameters.AddWithValue("@DescuentoPct", descuentoPct);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
