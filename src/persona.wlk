class Persona {
	var property provincia
	var property totalRecaudado
	method puedeSerAtendida(profesional){
		return profesional.provinciasDondePuedeTrabajar().contains(provincia)
	}
	method cobrar(importe){
		totalRecaudado+=importe
	}
	
}

class Institucion{
	var property universidadesReconocidas
	method puedeSerAtenddida(profesional){
		return universidadesReconocidas.contains(profesional.universidad())
	}
}
