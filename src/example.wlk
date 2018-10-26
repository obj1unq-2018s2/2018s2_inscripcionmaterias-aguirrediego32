class Estudiante{
	var materiaInscripta
	var materiasAprobadas
	var creditosAcumulados
	
	method puedeCursarMateria(materia){
	return	not self.esMateriaInscripta(materia) and not self.aproboMateria(materia) and materia.prerrequisito(self)
	}
	
	method esMateriaInscripta(materia){
		return materiaInscripta.contains(materia)
	}
	
	method aproboMateria(materia){
	return	materiasAprobadas.contains(materia)
	}
		
}


class MateriaCorrelativas  {
	var correlatividades 

		method prerrequisito(alumno){
		return   correlatividades.map{mat=>alumno.aproboMateria(mat)}
	}
}

class MateriaCreditosNecesarios    {
	var creditosNecesarios

		method prerrequisito(alumno){
	return  alumno.creditosAcumulados() >= creditosNecesarios	
	}
}

class MateriaAnio {
	var anioDeMateria

	method prerrequisito(alumno){
		return alumno.materiasAprobadas().map{mat=>mat.anioDeMateria() ==mat.carrera().anioDeMateria()-1}
	}
}


class Carrera{
	var materias
}