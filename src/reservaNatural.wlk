import especies.*

object reserva {
	const habitats = []
	method agregarHabitat(unHabitat) {habitats.add(unHabitat)}
	method habitatConMayorBiomasa() = habitats.max({unHabitat => unHabitat.biomasaTotal()})
	method cantTotalDeBiomasa() = habitats.sum({unHabitat => unHabitat.biomasaTotal()})
	method habitatsSinEqulibrio() =	habitats.map({unHabitat => not unHabitat.estaEnEquilibrio()})
	method estaEnTodosLosHabitas(unaEspecie) = habitats.all({unEjemplar => unEjemplar.estaEnElHabitat(unaEspecie)})
	method estaEnLaReserva(unEjemplar) = habitats.any({u => u.estaEnElHabitat(unEjemplar)})
}

class Habitat {
	const seresVivos = []
	
	method agregarEspecie(unaEspecie) {seresVivos.add(unaEspecie)}
	method estaVacia() = seresVivos.size() == 0
	method biomasaTotal() = seresVivos.sum({serVivo => serVivo.biomasa()})
	method estaEnEquilibrio() = seresVivos.count({ejemplar => ejemplar.esGrande()}) 
								< seresVivos.count({ejemplar => ejemplar.esPequenio()}) / 3 
								and seresVivos.any({ejemplar => ejemplar.esMediano()})
	method estaEnElHabitat(unEjemplar) = seresVivos.contains(unEjemplar)
	method incendio() {
		seresVivos.forEach({ejemplar => ejemplar.sufrirIncendio()})
		seresVivos.removeAllSuchThat({ejemplar => not ejemplar.estaVivo()})
	}						

}