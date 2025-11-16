import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final List<Map<String, String>> opiniones = [
    {
      "img": "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
      "nombre": "Maria Guarnizo",
      "rol": "Turista",
      "descripcion":
          "Una experiencia increíble, llena de naturaleza y paisajes únicos.",
    },
    {
      "img": "https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg",
      "nombre": "Carlos Ruiz",
      "rol": "Turista",
      "descripcion":
          "Me encantó la biodiversidad, animales únicos en todo el mundo.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            // ----------------------------------------
            //   IMAGEN SUPERIOR CON ICONOS
            // ----------------------------------------
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://mediaim.expedia.com/destination/1/3b5df5ac1523b7e59cf11dc5ed15570e.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Botón regresar
                Positioned(
                  top: 15,
                  left: 15,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Center(
                      child: _buildIconButton(Icons.arrow_back_ios_new),
                    ),
                  ),
                ),

                // Íconos compartir y corazón
                Positioned(
                  top: 15,
                  right: 15,
                  child: Row(
                    children: [
                      _buildIconButton(Icons.share),
                      SizedBox(width: 10),
                      _buildIconButton(Icons.favorite_border),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // ----------------------------------------
            //   TÍTULO
            // ----------------------------------------
            Text(
              "Galápagos",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // ----------------------------------------
            //   TARJETAS SCROLL HORIZONTAL
            // ----------------------------------------
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSmallCard("Animales"),
                  _buildSmallCard("Playas"),
                  _buildSmallCard("Tours"),
                  _buildSmallCard("Barcos"),
                ],
              ),
            ),

            SizedBox(height: 20),

            // ----------------------------------------
            //   DESCRIPCIÓN
            // ----------------------------------------
            Text(
              "Las islas Galápagos son un archipiélago volcánico del océano Pacífico. Es conocido como uno de los destinos más famosos del mundo para la observación de fauna.",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),

            SizedBox(height: 25),

            // ----------------------------------------
            //   SECCIÓN ICONOS + TEXTOS
            // ----------------------------------------
            Column(
              children: [
                Row(
                  children: [
                    // Columna 1: ICONO
                    Expanded(flex: 1, child: Icon(Icons.cloud, size: 20)),

                    // Columna 2: ETIQUETA
                    Expanded(
                      flex: 1,
                      child: Text("Clima:", style: TextStyle(fontSize: 16)),
                    ),

                    // Columna 3: INFORMACIÓN
                    Expanded(flex: 4, child: Text("(cálido, lluvias)")),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.restaurant, size: 20)),
                    Expanded(
                      flex: 1,
                      child: Text("Comida:", style: TextStyle(fontSize: 16)),
                    ),
                    Expanded(flex: 4, child: Text("(mariscos, carne)")),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.location_on, size: 20)),
                    Expanded(
                      flex: 1,
                      child: Text("País:", style: TextStyle(fontSize: 16)),
                    ),
                    Expanded(flex: 4, child: Text("Ecuador")),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.house, size: 20)),
                    Expanded(
                      flex: 1,
                      child: Text("Hoteles:", style: TextStyle(fontSize: 16)),
                    ),
                    Expanded(flex: 4, child: Text("Sí")),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.campaign, size: 20)),
                    Expanded(
                      flex: 1,
                      child: Text("Camping:", style: TextStyle(fontSize: 16)),
                    ),
                    Expanded(flex: 4, child: Text("Sí")),
                  ],
                ),
              ],
            ),

            SizedBox(height: 25),

            Divider(),

            SizedBox(height: 15),

            // ----------------------------------------
            //   TÍTULO OPINIONES
            // ----------------------------------------
            Text(
              "Opiniones",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Divider(),

            // ----------------------------------------
            //   LISTA DE OPINIONES
            // ----------------------------------------
            Column(children: opiniones.map((op) => _buildOpinion(op)).toList()),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // WIDGET BOTÓN ICONO SUPERIOR
  // ------------------------------------------------------------
  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 22, color: Colors.black),
    );
  }

  // ------------------------------------------------------------
  // TARJETAS PEQUEÑAS DEL SCROLL
  // ------------------------------------------------------------
  Widget _buildSmallCard(String title) {
    return Container(
      width: 110,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  // ------------------------------------------------------------
  // CARD DINÁMICO PARA OPINIONES
  // ------------------------------------------------------------
  Widget _buildOpinion(Map<String, String> data) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Imagen
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  data["img"]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),

              // Nombre + Rol
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["nombre"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["rol"]!,
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Icono de 3 puntos
              Icon(Icons.more_vert),
            ],
          ),

          SizedBox(height: 10),

          // Descripción
          Text(
            data["descripcion"]!,
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}
