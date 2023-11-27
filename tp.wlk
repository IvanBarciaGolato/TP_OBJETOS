class jugarConPouFelizException inherits DomainException {}
class energiaBajaPou inherits DomainException {}

class mascota {
var property estadoInterno = aburrido
var property edad	= 7
var property energiaInicial = edad * 10
var property energia = energiaInicial
var property seComio = []
var property comio = false
var property durmio = false
var property jugo = false
var property tieneHambre = true
var property seRie = true
	
}

object pouAdulto inherits mascota {
var property cantidadAcciones = 0
method aumentarEdad(){
	if(cantidadAcciones % 5 == 0){
	edad += 1
   }
}

}
object pou inherits mascota{
	var property estadoSalud = ""
	
	method verificarEnergia (){
		if(energia < energiaInicial){
			self.energizarse()
			throw new energiaBajaPou(message = "Un pou no debe tener una energía menor que la inicial")
		}
	}
	method jugarConOtro(companieroJuego){
		estadoInterno.jugarConOtro(self, companieroJuego)
	}

	method comer(unJugador) {
		unJugador.alimentos().forEach{ alimento => energia += alimento.ingerirAlimento()}
	}
	
	method verificarSiPuedeJugar(unPou){
		estadoInterno.verificarSiPuedeJugar(self, unPou)
	}
	
	method dormir(quiereDormir) {
		if(quiereDormir) {
			durmio = true
		} else {
			seRie = not seRie
			self.energizarse()
                        if (not (self.banarse())) {
			   energia -= 1
                        }
		}
	}
	
	method banarse() {
		if(comio && jugo) {
			energia -= 2
			seRie = false
			self.dormir(durmio)
		}
	}
	
	method jugar(){
		seRie = true
		self.dormir(durmio)
	}
	
	method energizarse() {
		if(seRie || energia <= energiaInicial){
			energia = energiaInicial
		}
	}
	
	method salud() {
		const cantSaludables = seComio.filter{ alimento =>
			not (alimento.esFritura())
		}.size()
		const cantInsalubres = seComio.filter{ alimento => 
			alimento.esFritura()
		}.size()
		
	   if(cantSaludables < cantInsalubres){
			estadoSalud = "deplorable"
		} else if(cantInsalubres == cantSaludables) {
			estadoSalud = "alarmante"
		} else if(cantInsalubres <= (cantInsalubres + cantSaludables) *0.1 ){
                       if(seRie){
			estadoSalud = "normal"
                       }
                       else{
                estadoSalud = "aburrido"
                       }
		}
	}
	
}
object aburrido {
	method jugarConOtro(unPou, otroPou){
		
		otroPou.verificarSiPuedeJugar(unPou)
	}
	
	method verificarSiPuedeJugar(unPou, otroPou){
		unPou.jugar()
		otroPou.jugar()
	}
}

class alimento{
 
var property aumentoEnergia = 0.2
var property esFritura = false



}
object alimentoCocido inherits alimento {
	var property elementoCoccion = null
	
	method ingerirAlimento (){
    if (elementoCoccion.puedeFreir()){
   	esFritura = true
	return -0.2
   }
   else{
   	esFritura = false
   	return aumentoEnergia

   }
}
	
}

object sarten{
	var property puedeFreir = false
}

object olla{
	var property puedeFreir = false
}

object plancha{
	var property puedeFreir = false
}

object freidora{
	var property puedeFreir = false
}

object feliz {
	method verificarSiPuedeJugar(unPou, otroPou){
	
	self.verificarEnergia(unPou.energia() , otroPou.energia())
	
	}
		
	method verificarEnergia(unaEnergia, otraEnergia ){
		if (unaEnergia < otraEnergia){
			throw new jugarConPouFelizException(message = "Un pou aburrido no debe jugar con un pou feliz de mayor energía")
		}
	}
	}

object jugador{
	var property alimentos = []
	var property bebidas = []
}

const fruta = new alimento (aumentoEnergia = 1)
const verdura = new alimento ( aumentoEnergia = 1)
const bebida = new alimento ( aumentoEnergia = 0.5)
const papasFritas = new alimentoCocido(elementoCoccion = freidora)
const fideos = new alimentoCocido(elementoCoccion = olla)
const mochi = new mascota()
const flixnat = new mascota()
const patitasFritas = new alimentoCocido(elementoCoccion = freidora)
onst poucotton = new mascota()
