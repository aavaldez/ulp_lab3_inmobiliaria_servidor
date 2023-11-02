using ulp_lab3_inmobiliaria_servidor.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace ulp_lab3_inmobiliaria_servidor.Controllers
{
	[Route("[Controller]")]
	[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
	[ApiController]
	public class InmueblesController : ControllerBase
	{
		private readonly DataContext contexto;
		private readonly IConfiguration configuracion;

		public InmueblesController(DataContext context, IConfiguration config)
		{
			contexto = context;
			configuracion = config;
		}

		// GET: Inmuebles/
		[HttpGet("Todos")]
		[Authorize]
		public IActionResult GetTodos()
		{
			try
			{
				int.TryParse(User.FindFirstValue("Id"), out int userId);
				var usuario = User.Identity != null
					? contexto.Propietarios.Find(userId)
					: null;

				if (usuario == null) return NotFound();

				return Ok(contexto.Inmuebles.Include(i => i.Propietario).Where(e => e.Propietario.Id == usuario.Id));
			}
			catch (Exception e)
			{
				return BadRequest(e.Message);
			}
		}

		// PUT: Inmuebles/Cambiar_Estado/{id}
		[HttpPut("Cambiar_Estado/{id}")]
		[Authorize]
		public IActionResult PutEstado(int id, [FromBody] Boolean estado)
		{
			try
			{
				int.TryParse(User.FindFirstValue("Id"), out int userId);
				var usuario = User.Identity != null
					? contexto.Propietarios.Find(userId)
					: null;

				if (usuario == null) return NotFound();

				var inmueble = contexto.Inmuebles.Find(id);

				if (inmueble == null) return NotFound();

				if (inmueble.Id != usuario.Id) return Forbid();

				inmueble.Estado = estado;
				contexto.SaveChanges();

				return Ok(inmueble);
			}
			catch (Exception e)
			{
				return BadRequest(e.Message);
			}
		}

		// GET: Inmuebles/Alquilados
		[HttpGet("Alquilados")]
		[Authorize]
		public IActionResult GetAlquilados()
		{
			try
			{
				int.TryParse(User.FindFirstValue("Id"), out int userId);
				var usuario = User.Identity != null
					? contexto.Propietarios.Find(userId)
					: null;

				if (usuario == null)
					return NotFound();

				var currentDate = DateTime.Today;

				var inmuebles = contexto.Contratos
					.Include(c => c.Inmueble)
					.Where(c => c.Inmueble.PropietarioId == usuario.Id)
					.Where(c => c.Estado == 1 && c.Desde <= currentDate && c.Hasta >= currentDate)
					.Select(c => c.Inmueble)
					.ToList();

				return Ok(inmuebles);
			}
			catch (Exception e)
			{
				return BadRequest(e.Message);
			}
		}

	}
}