class Persona {
	var property provincia
	
	method puedeSerAtendida(profesional){
		return profesional.provinciasDondePuedeTrabajar().contains(provincia)
	}
	
}

class Institucion{
	var property universidadesReconocidas
	method puedeSerAtenddida(profesional){
		return universidadesReconocidas.contains(profesional.universidad())
	}
}
