﻿using System.ComponentModel.DataAnnotations;
namespace ulp_lab3_inmobiliaria_servidor.Models
{
	public class Propietario
	{
		[Key]
		public int Id { get; set; }
		public string Nombre { get; set; } = "";
		public string Apellido { get; set; } = "";
		public long Dni { get; set; }
		public string? Telefono { get; set; }
		public string Email { get; set; } = "";
		public string Password { get; set; } = "";
		public int Estado { get; set; } = 1;

		public Propietario() { }

		public Propietario(Propietario propietario)
		{
			Id = propietario.Id;
			Nombre = propietario.Nombre;
			Apellido = propietario.Apellido;
			Dni = propietario.Dni;
			Telefono = propietario.Telefono;
			Email = propietario.Email;
			Password = propietario.Password;
			Estado = propietario.Estado;
		}

	}
}