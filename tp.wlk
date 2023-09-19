object pou {
	var property edad = 7
	var property energiaInicial = edad * 10
	var property energia = energiaInicial
	
	var property seComio = []
	var property comio = false
	var property durmio = false
	var property jugo = false
	var property tieneHambre = true
	var property seRie = true

	method comer() {
		jugador.alimentos().forEach{ alimento =>
			if(alimento.tipo() == "fruta" || alimento.tipo() == "verduras") {
				energia += 1
			}
			
			if(alimento.tipo() == "bebidas") {
				energia += 0.5
			}
			
			if (alimento.tipo() == "frituras") {
				energia -= 0.2
			}
			comio = true
			seRie = true
			seComio.add(alimento)
		}
		self.dormir(durmio)
	}
	
	method dormir(quiereDormir) {
		if(quiereDormir) {
			durmio = true
		} else {
			seRie = not seRie
			self.energizarse()
                        if not self.banarse(){
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
			alimento.tipo() != "frituras"	
		}.size()
		const cantInsalubres = seComio.filter{ alimento => 
			alimento.tipo() == "frituras"
		}.size()
		
		return if(cantSaludables < cantInsalubres){
			"deplorable"
		} else if(cantInsalubres == cantSaludables) {
			"alarmante"
		} else if(cantInsalubres <= (cantInsalubres + cantSaludables) *0.1 ){
                       if(seRie){
			"normal"
                       }
                       else{
                       "aburrido"
                       }
		}
	} 
}

object jugador{
	var property alimentos = [alimento, alimento2]
	var property bebidas = []
}

object alimento{
	var property tipo = "fruta"
}

object alimento2{
	var property tipo = "frituras"
}
