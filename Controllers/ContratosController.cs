using ulp_lab3_inmobiliaria_servidor.Models;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ulp_lab3_inmobiliaria_servidor.Controllers
{
	public class ContratosController : ControllerBase
	{
		private readonly DataContext contexto;
		private readonly IConfiguration configuracion;
		public ContratosController(DataContext context, IConfiguration config)
		{
			contexto = context;
			configuracion = config;
		}

		// GET: Contratos/Obtener/{inmueble_id}
		[HttpGet("Obtener/{inmueble_id}")]
		[Authorize]
		public IActionResult ObtenerPorInmueble(int inmueble_id)
		{
			try
			{
				int.TryParse(User.FindFirstValue("Id"), out int userId);

				var usuario = User.Identity != null
					? contexto.Propietarios.Find(userId)
					: null;

				if (usuario == null) return NotFound();

				var inmueble = contexto.Inmuebles.Find(inmueble_id);

				if (inmueble == null) return NotFound();
				if (usuario.Id != inmueble.PropietarioId) return Unauthorized();

				var contrato = contexto.Contratos
					.Include(i => i.Inquilino)
					.FirstOrDefault(i => i.Id == inmueble_id);

				if (contrato == null) return NotFound();

				return Ok(contrato);
			}
			catch (Exception e)
			{
				return BadRequest(e.Message);
			}
		}
	}
}