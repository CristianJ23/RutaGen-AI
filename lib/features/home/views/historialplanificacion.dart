import 'package:flutter/material.dart';

class HistorialPlanificacionPage extends StatefulWidget {
  @override
  _HistorialPlanificacionPageState createState() =>
      _HistorialPlanificacionPageState();
}

class Category {
  final String name;
  final String imageUrl;
  final String precio;
  final String titulo;
  final String titulo2;
  final List<String> tags;
  final String description;

  Category({
    required this.name,
    required this.imageUrl,
    required this.precio,
    required this.titulo,
    required this.titulo2,
    required this.tags,
    required this.description,
  });
}

class _HistorialPlanificacionPageState
    extends State<HistorialPlanificacionPage> {
  int selectedIndex = 0;

  final List<String> tabs = ["Guardados", "Pendientes", "Sección"];
  final List<Category> categorias1 = [
    Category(
      name: 'Categoria 1',
      imageUrl:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/cd/ac/f1/photo0jpg.jpg?w=1200&h=-1&s=1',
      precio: '559.99\$',
      titulo: '5 dias en Ecuador',
      titulo2: 'turismo gastronomico',
      tags: ['Cultura', 'Ciudad', 'Seguridad'],
      description:
          'Loja es una ciudad del sur de Ecuador, conocida como la capital cultural del país por su escena musical. En el centro de la ciudad, el Museo de Música exhibe instrumentos y partituras originales.',
    ),
    Category(
      name: 'Categoria 2',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7uc7avbe3hwvu4TBzsfifkLAVbnlqj9PZXj48A8tKYegeXhU-a6_xLqfDlnunY9HE7ek&usqp=CAU',
      precio: '559.99\$',
      titulo: '5 dias en Ecuador',
      titulo2: 'turismo religioso',
      tags: ['Aventura', 'Naturaleza', 'Gastronomía'],
      description:
          'Disfruta de la aventura y gastronomía en los paisajes quiteños.',
    ),
    Category(
      name: 'Categoria 3',
      imageUrl:
          'https://media.viajando.travel/p/4855e8bf4fdffe4768fd727aff06bcb4/adjuntos/236/imagenes/000/603/0000603088/1200x0/smart/para-quienes-disfrutan-los-atractivos-religiosos-la-catedral-loja-es-el-sitio-perfecto.jpeg',
      precio: '559.99\$',
      titulo: '5 dias en Ecuador',
      titulo2: 'turismo cultural',
      tags: ['Cultura', 'Ciudad', 'Seguridad'],
      description:
          'Explora los principales atractivos de Loja con tranquilidad y cultura.',
    ),
    Category(
      name: 'Categoria 4',
      imageUrl:
          'https://media.viajando.travel/p/4855e8bf4fdffe4768fd727aff06bcb4/adjuntos/236/imagenes/000/603/0000603088/1200x0/smart/para-quienes-disfrutan-los-atractivos-religiosos-la-catedral-loja-es-el-sitio-perfecto.jpeg',
      precio: '559.99\$',
      titulo: '5 dias en Ecuador',
      titulo2: 'turismo cultural',
      tags: ['Cultura', 'Ciudad', 'Seguridad'],
      description:
          'Explora los principales atractivos de Loja con tranquilidad y cultura.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    double textScale = width * 0.04;
    double tabSpacing = width * 0.06;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITULO --------------------------------------------------------
                Text(
                  "Historial Planificación",
                  style: TextStyle(
                    fontSize: textScale * 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: height * 0.02),

                /// NAVIGATOR --------------------------------------------------
                SizedBox(
                  height: height * 0.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == selectedIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedIndex = index);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: tabSpacing),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /// Titulo
                              Text(
                                tabs[index],
                                style: TextStyle(
                                  fontSize: textScale * 0.9,
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                ),
                              ),

                              /// Línea
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                margin: EdgeInsets.only(top: 4),
                                height: 2,
                                width: isSelected ? width * 0.25 : 0,
                                color:
                                    isSelected
                                        ? Colors.black
                                        : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// CONTENIDO NAVIGATOR
                Container(child: _buildSectionContent(width, textScale)),
                SizedBox(height: 45),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// CAMBIAR SEGÚN ÍNDICE
  Widget _buildSectionContent(double width, double textScale) {
    switch (selectedIndex) {
      case 0:
        return _buildGuardados(textScale);
      case 1:
        return _buildPendientes(textScale);
      case 2:
        return _buildSeccion(textScale);
      default:
        return Container();
    }
  }

  /// SECCIÓN 1
  /// SECCIÓN 1 RESPONSIVA
  Widget _buildGuardados(double textScale) {
    return Column(
      children:
          categorias1.map((cat) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;
                final imgSize = screenWidth * 0.30; // Imagen más grande
                final contentWidth = screenWidth * 0.5; // Contenido más pequeño

                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// IMAGEN -----------------------------------------------------
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              cat.imageUrl,
                              width: imgSize,
                              height: imgSize * 1.3,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 12),

                          /// CONTENIDO --------------------------------------------------
                          Container(
                            width: contentWidth, // contenido más pequeño
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// TÍTULO + SUBTÍTULO
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${cat.titulo} - ",
                                        style: TextStyle(
                                          fontSize: textScale * 0.65,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cat.titulo2,
                                        style: TextStyle(
                                          fontSize: textScale * 0.55,
                                          color: Color(0xFFA5632E),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10),

                                /// DESCRIPCIÓN
                                Text(
                                  cat.description,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: textScale * 0.55,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: 12),

                                /// TAGS
                                SizedBox(
                                  height: 30,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cat.tags.length,
                                    separatorBuilder:
                                        (_, __) => SizedBox(width: 8),
                                    itemBuilder:
                                        (_, index) => Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              cat.tags[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: textScale * 0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                  ),
                                ),

                                SizedBox(height: 12),

                                /// PRECIO
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    cat.precio,
                                    style: TextStyle(
                                      fontSize: textScale * 0.7,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
    );
  }

  /// SECCIÓN 2
  Widget _buildPendientes(double textScale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• Revisión pendiente 1", style: TextStyle(fontSize: textScale)),
        SizedBox(height: 10),
        Text("• Revisión pendiente 2", style: TextStyle(fontSize: textScale)),
      ],
    );
  }

  /// SECCIÓN 3
  Widget _buildSeccion(double textScale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• Elemento de la sección A",
          style: TextStyle(fontSize: textScale),
        ),
        SizedBox(height: 10),
        Text(
          "• Elemento de la sección B",
          style: TextStyle(fontSize: textScale),
        ),
        SizedBox(height: 10),
        Text(
          "• Elemento de la sección C",
          style: TextStyle(fontSize: textScale),
        ),
      ],
    );
  }
}
