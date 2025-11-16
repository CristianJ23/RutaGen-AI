import 'package:flutter/material.dart';

class PlanificacionPage extends StatefulWidget {
  const PlanificacionPage({super.key});

  @override
  State<PlanificacionPage> createState() => _PlanificacionPageState();
}

class _PlanificacionPageState extends State<PlanificacionPage> {
  int vecesEntrado = 0;

  @override
  void initState() {
    super.initState();
    vecesEntrado++;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1),

            // 📌 TÍTULO ARRIBA A LA IZQUIERDA
            const Text(
              "Planificación",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: size.height * 0.05),

            // IMAGEN
            Center(
              child: SizedBox(
                width: size.width * 0.6,
                height: size.height * 0.25,
                child: Image.asset(
                  "lib/assets/images/logo_robot.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // TÍTULO
            const Center(
              child: Text(
                "Organiza tu día",
                style: TextStyle(
                  color: Color(0xFFA5632E),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.015),

            // TEXTO SECUNDARIO
            const Center(
              child: Text(
                "Aquí podrás planificar tus actividades diarias\ny mantener un seguimiento claro.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),

            SizedBox(height: size.height * 0.04),

            // BOTÓN
            Center(
              child: SizedBox(
                width: size.width * 0.65,
                height: size.height * 0.065,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/chat'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA5632E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Continuar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
