class Stream {
  const invitados

  method estaPegado() = self.nivelHype() > 60

  method nivelHype() = invitados.sum({ invitado => invitado.popularidad() }).min(100)

  method viewers()

  method ganancia() = self.viewers() + self.nivelHype()
} 

class EpisodioDeCanal inherits Stream{

  const costoProduccion

  override method ganancia() = super() - costoProduccion
}

class SQV inherits EpisodioDeCanal{
  const canciones = ["cancion1", "cancion2", "cancion3", "cancion4", "cancion5"]
  
  override method viewers() = canciones.size() * 10000
}

class HAA inherits EpisodioDeCanal{

  var dia

  override method viewers() {
    if(self.posibleAnalisisSesudo()){
      return 200000
    } else {
      return 100000
    }
  }

  method posibleAnalisisSesudo() = dia.estaInteresante()

  override method nivelHype() = 100

}

class RealidadDelDia{
  const cantSucesos

  method estaInteresante() = cantSucesos > 10
}

class StreamerIndependiente inherits Stream{

  var suscriptores

  override method viewers() = suscriptores * 1.randomUpTo(3)

  method frenesiSuscriptores() { 
  suscriptores *= 2
  }

  override method ganancia() = super() * (9/10)
}

class Invitado{
  var seguidores

  method popularidad() = seguidores / 2
}

class InvitadoConMascota inherits Invitado{
  const cantMascotas

  method jugarConMascota() { 
  seguidores *= cantMascotas
  }
}

class StreamCoscu inherits StreamerIndependiente{

  var momentoDia

  override method viewers() = super() + momentoDia.viewers()
}

object maniana{
  method viewers() = 1000
}

object tarde{
  method viewers() = 5000
}

object noche{
  method viewers() = 10000
}

