// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var property universidad
	

	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(importe){asociacionProfesionalesDelLitoral.recibirDinero(importe)}
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var property universidad
	
	method honorariosPorHora() { return universidad.honorariosRecomendados() }
	method provinciasDondePuedeTrabajar() { return [universidad.provincia()] }
	method cobrar(importe){universidad.recibir(importe/2)}
	
}

object asociacionProfesionalesDelLitoral{
	var property totalRecaudado
	method recibirDinero(importe){totalRecaudado+=importe}
}

// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var totalRecaudado
	var property universidad
	var property honorariosPorHora
	var property provinciasDondePuedeTrabajar
	
	method cobrar(importe){totalRecaudado+=importe}
	method pasarDinero(persona,importe){
		totalRecaudado-=importe
		persona.cobrar(importe)
	}
	
	
}


class Universidad{
	var property provincia
	var property honorariosRecomendados
	var property totalRecaudado
	method recibir(importe){totalRecaudado+=importe}
}

class EmpresaDeServicios{
	
	var property honorariosDeReferencia
	var property profesionalesContratados=[]
	var property clientes=#{}
	
	method profesionalesDeUnaUniversidad(universidad){return profesionalesContratados.count{profesional=>profesional.universidad()==universidad}}
	method profesionalesCaros(){return profesionalesContratados.filter
		{profesional=>profesional.honorariosPorHora()>honorariosDeReferencia}
	}
	method universidadesFormadoras(){return profesionalesContratados.map
		{profesional=>profesional.universidad()}.asSet()
	}
	method profesionalMasBarato(){return profesionalesContratados.min{profesional=>profesional.honorariosPorHora()}}
	method esDeGenteAcotada(){return not profesionalesContratados.any
		{profesional=>profesional.provinciasDondePuedeTrabajar()}.size()>3
	}
	
	method puedeSatisfacer(solicitante){
		return profesionalesContratados.any{p=>solicitante.puedeSerAtendida(p)}
	}
	method darServicio(solicitante){
		if(not self.puedeSatisfacer(solicitante)){
			self.error("No tengo a nadie para vos,que pena")
		}
		const profElegido=profesionalesContratados.find{prof=>solicitante.puedeSerAtendida(prof)}
		profElegido.cobrar(profElegido.honorariosPorHora())
		clientes.add(solicitante)
		
	}
}