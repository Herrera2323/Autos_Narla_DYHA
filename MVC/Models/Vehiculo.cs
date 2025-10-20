namespace AutosNARLA.Models
{
    public class Vehiculo
    {
        public int VehiculoId { get; set; }
        public string Codigo { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public int Ano { get; set; }
        public string Tipo { get; set; }
        public decimal PrecioVenta { get; set; }
        public string Estado { get; set; }
        public string ImagenPath { get; set; }
    }
}
