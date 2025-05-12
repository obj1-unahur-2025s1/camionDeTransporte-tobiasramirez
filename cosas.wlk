import camion.*
object knightRider {
    method peso()= 500
    method peligrosidad() = 10
    
}
object bumblebee {
    var peligrosidad = null
    method peso()= 800
    method peligrosidad() = peligrosidad
    method transformarEnAuto(){peligrosidad = 15}
    method transformarEnRobot() {peligrosidad=30}
    
}
object paqueteLadrillos {
    var ladrillos = null
    method cantidadLadrillos(nuevaCantidad) {ladrillos = 0.max(nuevaCantidad)}
    method peso()= ladrillos * 2
    method peligrosidad() = 2
    method ladrillos() = ladrillos
    
}
object arenaGranel {
    var peso = null
    method nuevoPeso(unPeso) {peso=unPeso}
    method peso()= peso
    method peligrosidad() = 1
    
}
object bateriaAntiaerea {
    var tieneMisiles = false
    method peso() = if(self.tieneMisiles()) 300 else 200
    
    method peligrosidad() = if(self.tieneMisiles()) 100 else 0
    method tieneMisiles() = tieneMisiles
    method ponerMisiles() {tieneMisiles = true}
   
}
object contenedor {
    const cosas = [ ]
    method peso()= 100+cosas.sum({c=>c.peso()})
    method peligrosidad() =  if (cosas.isEmpty()) 0 else (self.elMasPeligroso().peligrosidad())
    method elMasPeligroso() = cosas.max({c=>c.peligrosidad()})
    method agregarAlContenedor(algo) = cosas.add(algo)
    method sacarDelContenedor(algo) = cosas.remove(algo)
    method vaciar() = cosas.clear()
    
}
object residuos {
    var peso = null
    method nuevoPeso(unPeso) {peso=unPeso}
    method peso()= peso
    method peligrosidad() = 200
    
}
object embalaje {
    var embalado = null
    
    method peso()= embalado.peso()
    method peligrosidad() = embalado.peligrosidad() / 2
    method embalar(algo) {embalado = algo}
    
}