using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;


namespace AutosNARLA
{
    public class Conexionbd
    {
        private static string connectionString = ConfigurationManager
           .ConnectionStrings["AutosNARLA"]
           .ConnectionString;

        public static SqlConnection ObtenerConexion()
        {
            SqlConnection conexion = new SqlConnection(connectionString);
            conexion.Open();
            return conexion;
        }   
    }
}
