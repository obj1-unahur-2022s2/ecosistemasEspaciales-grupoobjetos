class EspecieFauna {
	const property pesoReferencia
	const property coeficienteEspecie
	
}

class EspecieFlora {
	const property alturaReferencia = 10
}

class Animal {
	var property peso
	var property estaVivo = true
	const property pesoReferencia 
	const property coeficienteEspecie
	const property biomasa = peso ** 2 / coeficienteEspecie
	const property formaDeLocomocion 
	method esPequenio() = peso < pesoReferencia / 2
	method esGrande() = peso > pesoReferencia * 2 
	method esMediano() = peso == pesoReferencia
	method morir() {estaVivo = false}
	method sufrirIncendio() {
		if (formaDeLocomocion.seSalva(self))
			{peso -= peso * 10 / 100}
		else {
			self.morir()
		}
	}
}

class Planta {
	var property altura
	const property alturaReferencia = 10
	const property biomasa = (altura * 2).min(alturaReferencia) 
	var property estaVivo = true
	method esGrande() = altura == 10
	method esPequenio() = altura < 10
	
	method morir() {estaVivo = false}
	method sufrirIncendio() {
		if (self.esGrande())
			{altura = altura - 5}
		else {self.morir()}
	}
}

object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(_) = true}
object correr{method seSalva(animal) = animal.esMediano()}
object quieto{method seSalva(_) = false}


