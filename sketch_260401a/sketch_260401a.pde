// enviadorRecibidor
// ejemplo por montoyamoraga
// para dis9079 interacciones inalambricas
//
// basado en ejemplo
// oscP5sendreceived de andreas schlegel

// el dispositivo que envia
// debe saber donde enviar
// ese lugar donde envia tiene una direccion IP
// y tambien tiene un puerto

// el dispositivo que recibe
// no le importa quien le manda
// solamente debe abrir la comunicacion OSC
// en algun puerto

// importar bibliotecas
// para comunicacion
// con protocolo
// open sound control
import oscP5.*;
import netP5.*;

////////////////////////
/// esta seccion es fija
////////////////////////

// variables para recibir y enviar
OscP5 esteLugar;
NetAddress otroLugar;

// mensaje
OscMessage mensajeEnviar;


/////////////////////////////////////////
// esta seccion es para que la configuren
/////////////////////////////////////////

// puerto de este computador para recibir
int puertoDondeRecibo = 12000;

// direccion IP del dispositivo donde envio
String direccionDondeEnvio = "127.0.0.1";
// puerto del dispositivo donde envio
int puertoDondeEnvio = 12000;


// todos los mensajes tienen una etiqueta o tag
// las etiquetas
String etiquetaEnviar = "/saludo";
// cada mensaje puede tener un tipo distinto
// por ejemplo podemos enviar ints, strings, etc
int numeroEnviar = 0;
String stringEnviar = "hola";

void setup() {
  size(400, 400);
  frameRate(25);

  // este lugar
  // usa el puerto para recibir
  esteLugar = new OscP5(this, puertoDondeRecibo);

  // otro lugar
  // necesita la direccion IP donde esta enviando
  // necesita el puerto donde tiene que enviar en esa direccion
  otroLugar = new NetAddress(direccionDondeEnvio, puertoDondeEnvio);
}


void draw() {
  background(0);
}


// cada vez que se hace click con mouse
void mousePressed() {

  // crear nuevo mensaje
  mensajeEnviar = new OscMessage(etiquetaEnviar);


  // agregar numero al mensaje
  mensajeEnviar.add(numeroEnviar);
  // agregar string al mensaje
  mensajeEnviar.add(stringEnviar);


  // este lugar toma
  // el mensaje que se quiere enviar
  // y lo envia al otro lugar
  esteLugar.send(mensajeEnviar, otroLugar);
}


// funcion que detecta los mensajes que llegan
void oscEvent(OscMessage mensajeRecibido) {
  print("mensaje recibido");
  print(" etiqueta: "+ mensajeRecibido.addrPattern());
  println(" tipo: "+ mensajeRecibido.typetag());
  // 
  println(mensajeRecibido.get(0).intValue());
  println(mensajeRecibido.get(1).stringValue());

  //println(mensajeRecibido.
}
