class Diapo {

  int numero;

  // hacer que el texto aparezca de a poquito
  // caracter a caracter
  // mover una, la mas significativa de la diapo
  // o mover ninguna
  // mejor respetar la logica x,y del diagrama
  // hacer un rectangulo blanco abajo de cada palabra
  // para esconder donde termina cada linea

  ArrayList<Imagen> imagenes = new ArrayList<Imagen>();
  ArrayList<Texto> textos = new ArrayList<Texto>();
  ArrayList<Linea> lineas = new ArrayList<Linea>();

  IntList textoLineas = new IntList();

  int textoActual;
  long tiempoRefresco;
  long tiempoActualizacion;
  // nuevos
  long tiempoEntreCaracteres;
  long tiempoCaracterAnterior;

  Diapo(int nuevoNumero) {
    numero = nuevoNumero;
    textoActual = 0;
    tiempoRefresco = 100;
    tiempoActualizacion = millis();
    tiempoEntreCaracteres = 200;
    tiempoCaracterAnterior = millis();
  }

  void inicializar() {
    textoActual = 0;
    tiempoActualizacion = millis();
  }

  void agregarTexto(String nuevoTexto, float[] params) {

    Texto temp = new Texto(nuevoTexto, params);

    //print(temp.texto);
    textos.add(temp);

    int contadorLineas = 1 + nuevoTexto.split("\n").length;

    textoLineas.append(contadorLineas);
  }

  void mostrarTextos() {
    for (int i = 0; i < textos.size(); i++) {
      Texto temp = textos.get(i);
      fill(0);
      textSize(temp.tamano);
      text(temp.texto.substring(0, temp.caracterActual),
        temp.posX * width/100,
        temp.posY * height/100
        );
    }
  }

  void actualizar() {

    if (millis() - tiempoCaracterAnterior > tiempoEntreCaracteres) {
      for (int i = 0; i < textos.size(); i++) {
        Texto temp = textos.get(i);
        temp.aumentarCaracter();
      }
      tiempoCaracterAnterior = millis();
    }

    if (millis() - tiempoActualizacion > tiempoRefresco) {
      textoActual++;
      textoActual = constrain(textoActual, 0, textos.size() - 1);
      tiempoActualizacion = millis();
    }

    for (int i = 0; i <= textoActual; i++) {
      Texto temp = textos.get(i);
      textSize(temp.tamano);
    }
  }

  void agregarImagen(Imagen imagen) {
    imagenes.add(imagen);
  }

  void mostrarImagenes() {
    for (int i = 0; i < imagenes.size(); i++) {
      imagenes.get(i).mostrar();
    }
  }
}

ArrayList<Diapo> diapos = new ArrayList<Diapo>();

void inicializarDiapos() {
  for (int i =0; i < textosTodos.length; i++ ) {
    diapos.add(new Diapo(i));
    for (int texto = 0; texto < textosTodos[i].length; texto++) {
      Diapo temp = diapos.get(i);
      temp.agregarTexto(textosTodos[i][texto], textosParams[i][texto]);
    }
  }

  // agregar imagen correspondiente a ese proyector
  diapos.get(32).agregarImagen(estrellas.get(proyector * 2));
  diapos.get(32).agregarImagen(estrellas.get(proyector * 2 + 1));
}
