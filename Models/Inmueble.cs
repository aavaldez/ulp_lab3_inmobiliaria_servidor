using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ulp_lab3_inmobiliaria_servidor.Models
{
	public enum enUsos
	{
		Residencial = 1,
		Comercial = 2
	}

	public enum enTipos
	{
		Casa = 1,
		Departamento = 2,
		Oficina = 3,
		Local = 4,
		Deposito = 5
	}

	public enum enEstados
	{
		Habilitado = 1,
		Inhabilitado = 2
	}

	public class Inmueble
	{
		[Key]
		public int Id { get; set; }
		public int Uso { get; set; } = 1;
		public int Tipo { get; set; } = 1;
		public string Direccion { get; set; } = "";
		public int Ambientes { get; set; } = 1;
		public int Superficie { get; set; } = 0;
		public decimal Latitud { get; set; } = 0;
		public decimal Longitud { get; set; } = 0;
		public decimal Valor { get; set; } = 0;
		public int Estado { get; set; } = 1;
		public String ? Imagen { get; set; }

		[ForeignKey(nameof(Propietario))]
		public int PropietarioId { get; set; }
		public Propietario Propietario { get; set; } = null;

		[NotMapped]
		public string UsoNombre => Uso > 0 ? ((enUsos)Uso).ToString() : "";
		[NotMapped]
		public string TipoNombre => Tipo > 0 ? ((enTipos)Tipo).ToString() : "";

		public static IDictionary<int, string> ObtenerUsos()
		{
			SortedDictionary<int, string> usos = new SortedDictionary<int, string>();
			Type tipoEnumUso = typeof(enUsos);
			foreach (var valor in Enum.GetValues(tipoEnumUso))
			{
				usos.Add((int)valor, Enum.GetName(tipoEnumUso, valor));
			}
			return usos;
		}

		public static IDictionary<int, string> ObtenerTipos()
		{
			SortedDictionary<int, string> tipos = new SortedDictionary<int, string>();
			Type tipoEnumTipo = typeof(enTipos);
			foreach (var valor in Enum.GetValues(tipoEnumTipo))
			{
				tipos.Add((int)valor, Enum.GetName(tipoEnumTipo, valor));
			}
			return tipos;
		}

		public static IDictionary<int, string> ObtenerEstados()
		{
			SortedDictionary<int, string> estados = new SortedDictionary<int, string>();
			Type tipoEnumEstado = typeof(enEstados);
			foreach (var valor in Enum.GetValues(tipoEnumEstado))
			{
				estados.Add((int)valor, Enum.GetName(tipoEnumEstado, valor));
			}
			return estados;
		}
	}
}