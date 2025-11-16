import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rutagen/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PantallaChat extends StatefulWidget {
  const PantallaChat({super.key});

  @override
  State<PantallaChat> createState() => _PantallaChatState();
}

class _PantallaChatState extends State<PantallaChat>
    with SingleTickerProviderStateMixin {
  bool mostrarCuadros = true;
  List<Map<String, dynamic>> mensajes = [];
  final TextEditingController _controller = TextEditingController();

  late AnimationController anim;
  late Animation<double> fadeAnim;

  @override
  void initState() {
    super.initState();
    anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    fadeAnim = CurvedAnimation(parent: anim, curve: Curves.easeOut);
  }

  void _marcarCronogramaDesbloqueado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("cronogramaDesbloqueado", true);
  }

  void enviarMensaje() {
    if (_controller.text.trim().isEmpty) return;

    String mensaje = _controller.text.trim();

    setState(() {
      if (mensajes.isEmpty) {
        mostrarCuadros = false;
        anim.forward();
      }

      mensajes.add({"me": true, "text": mensaje});

      mensajes.add({
        "me": false,
        "text": "Hola, esto es un mensaje automático.",
      });

      int enviados = mensajes.where((e) => e["me"] == true).length;
      if (enviados >= 5) {
        _marcarCronogramaDesbloqueado();
        Navigator.pushNamed(context, AppRoutes.cronograma);
      }
    });

    _controller.clear();
  }

  Widget _cuadroInfo(String svg, String texto, Color colorIcono) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorIcono, // ⭐ FONDO PERSONALIZADO
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(svg, width: 24, height: 24),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mensajeBurbuja(String texto, bool me) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: me ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: size.width * 0.55),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          color: me ? const Color(0xFFA5632E) : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          texto,
          style: TextStyle(color: me ? Colors.white : Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(4),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color.fromARGB(255, 219, 218, 218),
                  width: 1.3,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 13,
                ),
              ),
            ),
          ),
        ),

        title: Row(
          children: [
            Image.asset("lib/assets/images/robot.png", width: 55, height: 55),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Asesor de viajes",
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                Text(
                  "Sphere",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  if (mostrarCuadros)
                    FadeTransition(
                      opacity: Tween<double>(
                        begin: 1,
                        end: 0,
                      ).animate(fadeAnim),
                      child: ListView(
                        padding: const EdgeInsets.all(15),
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _cuadroInfo(
                                  "lib/assets/images/casa.svg",
                                  "Cronograma para turismo Cultural",
                                  Colors.blue.shade100,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _cuadroInfo(
                                  "lib/assets/images/fiesta.svg",
                                  "Cronograma para turismo de naturaleza",
                                  Colors.green.shade100,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _cuadroInfo(
                                  "lib/assets/images/fiesta.svg",
                                  "Cronograma para turismo gastronómico",
                                  Colors.orange.shade100,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _cuadroInfo(
                                  "lib/assets/images/fiesta.svg",
                                  "Cronograma para turismo Rural",
                                  Colors.pink.shade100,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  if (!mostrarCuadros)
                    ListView.builder(
                      padding: const EdgeInsets.only(bottom: 80, top: 10),
                      itemCount: mensajes.length,
                      itemBuilder: (context, i) {
                        return _mensajeBurbuja(
                          mensajes[i]["text"],
                          mensajes[i]["me"],
                        );
                      },
                    ),
                ],
              ),
            ),

            // INPUT CHAT
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Ingresa un mensaje...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    Icon(Icons.attach_file, color: Colors.grey.shade700),

                    const SizedBox(width: 8),

                    GestureDetector(
                      onTap: enviarMensaje,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.send,
                          color: Colors.grey.shade800,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
