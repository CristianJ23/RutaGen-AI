import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:rutagen/routes/app_routes.dart';

class Category {
  final String name;
  final String imageUrl;
  final String score;
  final String location;
  final List<String> tags;
  final String description;

  Category({
    required this.name,
    required this.imageUrl,
    required this.score,
    required this.location,
    required this.tags,
    required this.description,
  });
}

class Cronograma extends StatefulWidget {
  const Cronograma({super.key});

  @override
  State<Cronograma> createState() => _CronogramaState();
}

class _CronogramaState extends State<Cronograma> {
  int selectedItem = 0;

  final List<Category> categorias1 = [
    Category(
      name: 'Categoria 1',
      imageUrl:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/cd/ac/f1/photo0jpg.jpg?w=1200&h=-1&s=1',
      score: '9,7',
      location: 'Loja, Ecuador',
      tags: ['Cultura', 'Ciudad', 'Seguridad'],
      description:
          'Loja es una ciudad del sur de Ecuador, conocida como la capital cultural del país por su escena musical. En el centro de la ciudad, el Museo de Música exhibe instrumentos y partituras originales.',
    ),
    Category(
      name: 'Categoria 2',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7uc7avbe3hwvu4TBzsfifkLAVbnlqj9PZXj48A8tKYegeXhU-a6_xLqfDlnunY9HE7ek&usqp=CAU',
      score: '8,9',
      location: 'Quito, Ecuador',
      tags: ['Aventura', 'Naturaleza', 'Gastronomía'],
      description:
          'Disfruta de la aventura y gastronomía en los paisajes quiteños.',
    ),
    Category(
      name: 'Categoria 3',
      imageUrl:
          'https://media.viajando.travel/p/4855e8bf4fdffe4768fd727aff06bcb4/adjuntos/236/imagenes/000/603/0000603088/1200x0/smart/para-quienes-disfrutan-los-atractivos-religiosos-la-catedral-loja-es-el-sitio-perfecto.jpeg',
      score: '9,7',
      location: 'Loja, Ecuador',
      tags: ['Cultura', 'Ciudad', 'Seguridad'],
      description:
          'Explora los principales atractivos de Loja con tranquilidad y cultura.',
    ),
    Category(
      name: 'Categoria 4',
      imageUrl:
          'https://mediaim.expedia.com/destination/1/3b5df5ac1523b7e59cf11dc5ed15570e.jpg',
      score: '8,9',
      location: 'Quito, Ecuador',
      tags: ['Aventura', 'Naturaleza', 'Gastronomía'],
      description:
          'Disfruta de la aventura y gastronomía en los paisajes quiteños.',
    ),
  ];
  final List<Map<String, dynamic>> cronogramaItems = [
    {
      'numero': '01',
      'score': '9,7',
      'imagenUrl':
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/cd/ac/f1/photo0jpg.jpg?w=1200&h=-1&s=1',
      'titulo': 'Iglesia de San Sebastián',
      'hora': '09H00',
      'descripcion':
          'Loja es una ciudad del sur de Ecuador, conocida como la capital cultural del país por su escena musical.',
      'iconos': [Icons.church, Icons.celebration, Icons.fastfood],
    },
    {
      'numero': '02',
      'score': '8,9',
      'imagenUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7uc7avbe3hwvu4TBzsfifkLAVbnlqj9PZXj48A8tKYegeXhU-a6_xLqfDlnunY9HE7ek&usqp=CAU',
      'titulo': 'Plaza Central',
      'hora': '11H00',
      'descripcion':
          'Disfruta de la aventura y gastronomía en los paisajes quiteños.',
      'iconos': [Icons.place, Icons.local_fire_department, Icons.restaurant],
    },
    {
      'numero': '03',
      'score': '9,2',
      'imagenUrl':
          'https://media.viajando.travel/p/4855e8bf4fdffe4768fd727aff06bcb4/adjuntos/236/imagenes/000/603/0000603088/1200x0/smart/para-quienes-disfrutan-los-atractivos-religiosos-la-catedral-loja-es-el-sitio-perfecto.jpeg',
      'titulo': 'Catedral de Loja',
      'hora': '13H00',
      'descripcion':
          'Explora los principales atractivos de Loja con tranquilidad y cultura.',
      'iconos': [Icons.church, Icons.event, Icons.local_dining],
    },
  ];

  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  int currentIndex = 0;

  void next() {
    if (currentIndex < categorias1.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    buttonCarouselController.animateToPage(currentIndex);
  }

  void previous() {
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex = categorias1.length - 1;
    }
    buttonCarouselController.animateToPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titulo 1 ----------------------------------------------------
              Row(
                children: [
                  Text(
                    "5 Días en Ecuador - ",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Turismo gastronómico",
                    style: TextStyle(
                      fontSize: screenWidth * 0.025,
                      color: Color(0xFFA5632E),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
              // Titulo 2 ----------------------------------------------------
              Text(
                "Lunes 03 de Noviembre",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenWidth * 0.05),

              // Carrusel ----------------------------------------------------
              Stack(
                children: [
                  // Carrusel
                  CarouselSlider(
                    items:
                        categorias1.map((cat) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                // Imagen
                                Image.network(
                                  cat.imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 420,
                                ),
                                // Overlay oscuro
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(87, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                // Contenido encima de la imagen
                                Positioned(
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                  bottom: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // contenedor score
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              cat.score,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Icon(
                                              Icons.star,
                                              size: screenWidth * 0.04,
                                              color: const Color.fromARGB(
                                                255,
                                                250,
                                                238,
                                                18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      // titulo direccion
                                      Text(
                                        cat.location,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      // cuadros negros
                                      SizedBox(
                                        height: 35,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: cat.tags.length,
                                          separatorBuilder:
                                              (_, __) => SizedBox(width: 8),
                                          itemBuilder:
                                              (_, index) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    cat.tags[index],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        ),
                                      ),
                                      // texto
                                      const SizedBox(height: 12),
                                      Text(
                                        cat.description,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                    controller: buttonCarouselController,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.6,
                      height: 420,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      scrollPhysics: BouncingScrollPhysics(),
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),

                  // Botón izquierdo
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 10,
                    child: Center(
                      child: GestureDetector(
                        onTap: previous,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Botón derecho
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 10,
                    child: Center(
                      child: GestureDetector(
                        onTap: next,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
              // Titulo 3 ----------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Cronograma",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.45),
                  Text(
                    "3 tareas",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Color.fromARGB(255, 150, 150, 150),
                    ),
                  ),
                ],
              ),

              // Columna del cronograma----------------------------------------------
              Column(
                children:
                    cronogramaItems.map((item) {
                      int index = cronogramaItems.indexOf(item);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Columna 1: Número
                            Text(
                              item["numero"],
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(width: 16),

                            // Columna 2: Círculo con borde y línea vertical
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // Círculo exterior
                                    Container(
                                      width: screenWidth * 0.04,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFA5632E),
                                        ),
                                      ),
                                    ),

                                    // Círculo interior (dinámico)
                                    Container(
                                      width: screenWidth * 0.015,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            selectedItem == index
                                                ? Color(0xFFA5632E)
                                                : Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),

                                DashedLineVertical(height: 120),
                              ],
                            ),

                            SizedBox(width: 12),

                            // Columna 3: imagen y información (SELECCIONABLE)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedItem = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(screenWidth * 0.01),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          selectedItem == index
                                              ? Color(0xFFA5632E)
                                              : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      // Imagen
                                      Stack(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.20,
                                            height: screenWidth * 0.28,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    selectedItem == index
                                                        ? Color(0xFFA5632E)
                                                        : Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  item['imagenUrl'],
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),

                                          // Score
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.015,
                                                vertical: screenWidth * 0.008,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color:
                                                      selectedItem == index
                                                          ? Color(0xFFA5632E)
                                                          : Colors.grey,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    item['score'],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          screenWidth * 0.025,
                                                    ),
                                                  ),
                                                  SizedBox(width: 2),
                                                  Icon(
                                                    Icons.star,
                                                    size: screenWidth * 0.04,
                                                    color: Color.fromARGB(
                                                      255,
                                                      250,
                                                      238,
                                                      18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(width: screenWidth * 0.015),

                                      // Información
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.025,
                                            vertical: screenWidth * 0.008,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // título y hora
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item["titulo"],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: (screenWidth *
                                                              0.034)
                                                          .clamp(12, 18),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    item["hora"],
                                                    style: TextStyle(
                                                      fontSize: (screenWidth *
                                                              0.03)
                                                          .clamp(10, 16),
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 4),

                                              // Descripción
                                              Text(
                                                item["descripcion"],
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.025,
                                                ),
                                              ),

                                              SizedBox(
                                                height: screenWidth * 0.02,
                                              ),

                                              // Iconos
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children:
                                                    item["iconos"].map<Widget>((
                                                      icono,
                                                    ) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              right:
                                                                  screenWidth *
                                                                  0.02,
                                                            ),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                screenWidth *
                                                                    0.015,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color:
                                                                Colors
                                                                    .grey[300],
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  8,
                                                                ),
                                                          ),
                                                          child: Icon(
                                                            icono,
                                                            size:
                                                                screenWidth *
                                                                0.035,
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
              SizedBox(height: screenWidth * 0.02),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.historialplanificacion,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Guardar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedLineVertical extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DashedLineVertical({
    super.key,
    required this.height,
    this.color = const Color(0xFFA5632E),
    this.dashWidth = 6,
    this.dashSpace = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: _DashedLineVerticalPainter(
          color: color,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
        ),
      ),
    );
  }
}

class _DashedLineVerticalPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  _DashedLineVerticalPainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = 2;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
