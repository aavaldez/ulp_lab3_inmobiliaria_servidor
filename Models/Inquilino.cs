using System.ComponentModel.DataAnnotations;
namespace ulp_lab3_inmobiliaria_servidor.Models
{
	public class Inquilino
	{
		[Key]
		public int Id { get; set; }
		[Required(ErrorMessage = "El Nombre es obligatorio.")]
		public string Nombre { get; set; } = "";
		[Required(ErrorMessage = "El Apellido es obligatorio.")]
		public string Apellido { get; set; } = "";
		[Required(ErrorMessage = "El DNI es obligatorio.")]
		public string Dni { get; set; } = "";
		[Display(Name = "Teléfono")]
		[DisplayFormat(NullDisplayText = "Sin teléfono")]
		public string? Telefono { get; set; }
		[DisplayFormat(NullDisplayText = "Sin email")]
		public string? Email { get; set; }
		public int Estado { get; set; } = 1;
	}
}
