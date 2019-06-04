// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var property universidad
	

	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var property universidad
	
	method honorariosPorHora() { return universidad.honorariosRecomendados() }
	method provinciasDondePuedeTrabajar() { return [universidad.provincia()] }

}

// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var property universidad
	var property honorariosPorHora
	var property provinciasDondePuedeTrabajar
	
	
}


class Universidad{
	var property provincia
	var property honorariosRecomendados
}

class EmpresaDeServicios{
	
	var property honorariosDeReferencia
	var property profesionalesContratados
	
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
		
	}
}