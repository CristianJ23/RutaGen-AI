import 'package:flutter/material.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  _TravelHomePageState createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> travelCardImages = [
    'https://static.caribbeannewsdigital.com/cdn/ff/iPja5jJ7KwQzwWqbRYZM_dx9_yCGgBrKIO9agQ6TzoA/1758889441/public/2025-09/dia%20turismo.jpg',
    'https://via.placeholder.com/400x200/CCFFCC/000000?text=Planifica+tu+Viaje+2',
    'https://via.placeholder.com/400x200/CCCCFF/000000?text=Planifica+tu+Viaje+3',
    'https://via.placeholder.com/400x200/FFFFCC/000000?text=Planifica+tu+Viaje+4',
  ];

  List<Map<String, dynamic>> categoryCards = [
    {'icon': Icons.bed, 'text': 'Hoteles'},
    {'icon': Icons.location_on, 'text': 'Lugares'},
    {'icon': Icons.food_bank, 'text': 'Comidas'},
  ];

  List<String> smallCategoryCards = [
    'Todos',
    'Ecuador',
    'Perú',
    'Naturaleza',
    'Playa',
  ];

  List<Map<String, dynamic>> destinationCards = [
    {
      'image':
          'https://concepto.de/wp-content/uploads/2013/03/turismo-peru-800x400.jpg',
      'title': 'Galápagos',
      'location': 'Ecuador',
      'rating': 4.8,
    },
    {
      'image': 'https://www.ceupe.pe/images/easyblog_articles/239/b2ap3_large_turis.jpg',
      'title': 'Cusco',
      'location': 'Perú',
      'rating': 4.7,
    },
    {
      'image': 'https://www.entornoturistico.com/wp-content/uploads/2025/06/Evolucion-del-turismo.jpg',
      'title': 'Quito',
      'location': 'Ecuador',
      'rating': 4.5,
    },
    {
      'image':
          'https://www.ceupe.com/images/easyblog_articles/2449/b2ap3_amp_Caractersticas-del-turismo-de-aventura.jpg',
      'title': 'Machu Picchu',
      'location': 'Perú',
      'rating': 4.9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0, 
        elevation: 0, 
        backgroundColor: Colors.transparent, 
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Viajes',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Ver más',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            // Segunda fila: Card con PageView horizontal
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Container(
                height: screenHeight * 0.25,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: travelCardImages.length,



                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            travelCardImages[index],
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),

                              //qiemado texto cambiar 
                              child: Text(
                                'Ecuador y Perú',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.03,
                                ),
                              ),


                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.05,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Planifica tu Viaje',
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 57, 57, 57),
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'De manera Gratuita',
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 17, 17, 17),
                                      fontSize: screenWidth * 0.035,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.rocket_launch,
                                      size: screenWidth * 0.05,
                                    ),
                                    label: Text(
                                      'Planificar',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.pink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },



                ),
              ),
            ),

            // Tercera fila: Indicadores de página
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(travelCardImages.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: screenWidth * 0.02,
                    height: screenWidth * 0.02,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.red : Colors.grey,
                    ),
                  );
                }),
              ),
            ),

            // Segunda Fila de Contenido: "Categorías" y "Ver más"
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categorías',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Ver más',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            // Segunda Fila de Contenido: 3 Cards centradas con icono y texto
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    categoryCards.map((category) {
                      return Expanded(
                        child: Card(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Column(
                              children: [
                                Icon(
                                  category['icon'],
                                  size: screenWidth * 0.07,
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  category['text'],
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

              Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                bottom: screenHeight * 0.02, 
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      smallCategoryCards.map((text) {
                        return Card(
                          margin: EdgeInsets.only(right: screenWidth * 0.02),
                          elevation: 0,
                          color: text == 'Todos' ? Colors.deepOrange : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.01,
                            ),
                            child: Text(
                              text,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color:
                                    text == 'Todos'
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      
                ),
              
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: ListView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), 
                itemCount: destinationCards.length,
                itemBuilder: (context, index) {
                  final cardData = destinationCards[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Image.network(
                          cardData['image'],
                          fit: BoxFit.cover,
                          height: screenHeight * 0.3,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: screenHeight * 0.01,
                          right: screenWidth * 0.02,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            padding: EdgeInsets.all(screenWidth * 0.015),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: screenWidth * 0.06,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height:
                                screenHeight *
                                0.1, // Altura del efecto traslúcido
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(
                                0.4,
                              ), // Efecto traslúcido
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03,
                                vertical: screenHeight * 0.01,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cardData['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: screenWidth * 0.04,
                                          ),
                                          Text(
                                            cardData['rating'].toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.035,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: screenWidth * 0.04,
                                      ),
                                      SizedBox(width: screenWidth * 0.01),
                                      Text(
                                        cardData['location'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}