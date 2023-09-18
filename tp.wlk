
object pou {
	var property tieneHambre
	var property energia
	var property seRie
	var property juguete
	var property listacomidas = []
    var property energiaInicial
    var property estaAlegre
	    
	method comer (unaComida){
	   
	   if (unaComida.aporteComida() == "Fruta" || unaComida.aporteComida() == "Verdura" ){
	   	energia += 1
	   }
	   
	   if(unaComida.aporteComida() == "Bebida"){
	   	energia += 0.5
	   }
	   
	   if(unaComida.aporteComida() == "Fritura"){
	   	energia -= 0.2
	   }

	   if(tieneHambre){
	   	self.reir(true)
	   }
       return energia
	}
	
	method reir(debeReir){

    if(debeReir){
	seRie = true
	}
	else
	{
	seRie = false
	}
	return seRie
	}
	    	 	
	method jugar (){
		juguete = "Pelota"
		return juguete
	}
	
	method baniar () {
		if (self.comer(comida) && self.jugar()){
		   self.reir(false)
		   energia -= 2
		   }
		   return energia
	}
    method energizar (){
    	if (estaAlegre and energia <= energiaInicial){
    		energia = energiaInicial
    	}
    	return energia
    }
}

object comida {
	var  property tipoComida
	var  property aporteComida
	
}
