import cosas.*
object camion {
    var carga = []
    method tara() = 1000
    method peso() = carga.sum() + self.tara()
    method cargar(cosa) {
        carga.add(cosa)

    }
    method descargar(cosa) {
        carga.remove(cosa)
    }
    method sonPares() {
      return  carga.all({c=>c.peso().even()})
    }
    method algoPesa(unPeso) {
        return carga.any({c=>c.peso() == unPeso})
    }
    method elPrimeroConPeligrosidad(unaPeligrosidad) = carga.find({c=>c.peligrosidad() == unaPeligrosidad})
    method todasLasQueSuperan(unaPeligrosidad) = carga.filter({c=>c.peligrosidad() > unaPeligrosidad})
    method lasQueSonMasPeligrosasQue(unaCosa) = carga.filter({c=>c.peligrosidad() > unaCosa.peligrosidad()})
    method estaExcedido() = self.peso() > 2500
    method puedeCircularEnRutaDeNivel(nivel) = not self.estaExcedido() and  not self.algunaCosaSupera(nivel)
    method algunaCosaSupera(unaPeligrosidad) =  carga.any({c=>c.peligrosidad() > unaPeligrosidad})
        
    
}