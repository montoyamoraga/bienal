class Imagen {
  PImage imagen;
  int numero;
  float posX;
  float posY;

  Imagen(int numeroDiapo, String path) {
    imagen = loadImage(path);
    numero = numeroDiapo;
  }

  void escalar(int ancho) {
    imagen.resize(ancho, 0);
  }

  void posicionar(float x, float y) {
    posX = x;
    posY = y;
  }

  void mostrar() {
    image(imagen, posX, posY);
  }
}

ArrayList<Imagen> estrellas = new ArrayList<Imagen>();
ArrayList<Imagen> dibujos = new ArrayList<Imagen>();

// parametros son
// numeroDiapo
// nombreArchivo
// tamanoEscalaX en porcentaje de width
// posX
// posY
String[][] listaDibujos = {
  {"1", "dibujos/diapo-01.png", "25", "70", "50"},
  {"2", "dibujos/diapo-02.png", "30", "50", "50"},
  {"3", "dibujos/diapo-03.png", "20", "65", "20"},
  {"5", "dibujos/diapo-05.png", "10", "20", "40"},
  {"7", "dibujos/diapo-07a.png", "30", "20", "40"},
  {"7", "dibujos/diapo-07b.png", "30", "70", "40"}
};

String[][] listaEstrellas = {
  {"32", "numeradas/0.jpg", "50", "25", "50"},
  {"32", "numeradas/1.jpg", "50", "75", "50"},
  {"32", "numeradas/2.jpg", "50", "25", "50"},
  {"32", "numeradas/3.jpg", "50", "75", "50"},
  {"32", "numeradas/4.jpg", "50", "25", "50"},
  {"32", "numeradas/5.jpg", "50", "75", "50"}
};

void inicializarImagenes() {
  imageMode(CENTER);
  for (int i = 0; i < listaEstrellas.length; i++) {
    estrellas.add(new Imagen(int(listaEstrellas[i][0]), listaEstrellas[i][1] ));
    estrellas.get(i).escalar(int(listaEstrellas[i][2]) * width/100);
    estrellas.get(i).posicionar(
      int(listaEstrellas[i][3]) * width/100,
      int(listaEstrellas[i][4]) * height/100
      );
  }

  for (int i = 0; i < listaDibujos.length; i++) {
    dibujos.add(new Imagen(int(listaDibujos[i][0]), listaDibujos[i][1]));
    dibujos.get(i).escalar(int(listaDibujos[i][2]) * width/100);
    dibujos.get(i).posicionar(
      int(listaDibujos[i][3]) * width/100,
      int(listaDibujos[i][4]) * height/100
      );
  }
}
