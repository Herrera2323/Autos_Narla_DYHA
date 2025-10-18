using System;

namespace AutosNARLA.Models
{
    public class Venta
    {
        public int VentaId { get; set; }
        public int VehiculoId { get; set; }
        public int ClienteId { get; set; }
        public int EmpleadoId { get; set; }
        public decimal PrecioVentaFinal { get; set; }
        public decimal DescuentoPct { get; set; }
        public DateTime FechaVenta { get; set; }
    }
}
