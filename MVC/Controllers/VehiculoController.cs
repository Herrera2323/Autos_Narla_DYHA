using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AutosNARLA.Controllers
{
    public class VehiculoController
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["AutosNARLA"].ConnectionString;

        public DataTable ListarVehiculos()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("autos.sp_ListarVehiculos", conn))
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable FiltrarPorPrecio(decimal min, decimal max)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("autos.sp_FiltrarVehiculosPorPrecio", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Min", min);
                cmd.Parameters.AddWithValue("@Max", max);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        public void ActualizarPrecio(int id, decimal nuevoPrecio)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("autos.sp_ActualizarPrecioVehiculo", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VehiculoId", id);
                cmd.Parameters.AddWithValue("@NuevoPrecio", nuevoPrecio);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
