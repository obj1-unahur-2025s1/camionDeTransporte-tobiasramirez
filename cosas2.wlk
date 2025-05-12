import camion2.*

object knightRider {
    method peso()= 500
    method peligrosidad() = 10
    method bultos() = 1
    method consecuencias() {}
}
object bumblebee {
    var peligrosidad = null
    method peso()= 800
    method peligrosidad() = peligrosidad
    method transformarEnAuto(){peligrosidad = 15}
    method transformarEnRobot() {peligrosidad=30}
    method bultos() = 2
    method consecuencias() {
        self.transformarEnRobot()
    }
}
object paqueteLadrillos {
    var ladrillos = 0
    method cantidadLadrillos(nuevaCantidad) {ladrillos += nuevaCantidad}
    method peso()= ladrillos * 2
    method peligrosidad() = 2
    method bultos() =if(ladrillos<=100) 1
                     else if(ladrillos.between(101,300)) 2
                     else 3
    method consecuencias() {
        self.cantidadLadrillos(12)
    }
}
object arenaGranel {
    var peso = 0
    method nuevoPeso(unPeso) {peso+=0.max(unPeso)}
    method peso()= peso
    method peligrosidad() = 1
    method bultos() = 1
    method consecuencias() {
        self.nuevoPeso(-10)
    }
}
object bateriaAntiaerea {
    var tieneMisiles = false
    method peso() = if(self.tieneMisiles()) 300 else 200
    
    method peligrosidad() = if(self.tieneMisiles()) 100 else 0
    method tieneMisiles() = tieneMisiles
    method ponerMisiles() {tieneMisiles = true}
     method bultos() = if(self.tieneMisiles()) 2 else 1
     method consecuencias() {
        self.ponerMisiles()
     }
}
object contenedor {
    const cosas = [ ]
    method peso()= 100+cosas.sum({c=>c.peso()})
    method peligrosidad() =  if (cosas.isEmpty()) 0 else (self.elMasPeligroso().peligrosidad())
    method elMasPeligroso() = cosas.max({c=>c.peligrosidad()})
    method agregarAlContenedor(algo) = cosas.add(algo)
    method sacarDelContenedor(algo) = cosas.remove(algo)
    method vaciar() = cosas.clear()
    method bultos() = 1 + cosas.sum({c=>c.bultos()})
    method consecuencias() {
        cosas.forEach({c=>c.consecuencias()})
    }
}
object residuos {
    var peso = 0
    method nuevoPeso(unPeso) {peso+=0.max(unPeso)}
    method peso()= peso
    method peligrosidad() = 200
    method bultos() = 1
    method consecuencias() {
        self.nuevoPeso(15)
    }
}
object embalaje {
    var embalado = null
    
    method peso()= embalado.peso()
    method peligrosidad() = embalado.peligrosidad() / 2
    method embalar(algo) {embalado = algo}
    method bultos() = 2
    method consecuencias() {}
}