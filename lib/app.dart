import 'package:flutter/material.dart';
import 'package:rutagen/features/home/views/perfil.dart';
import 'package:rutagen/features/home/views/splash.dart';
import 'routes/app_routes.dart';
import 'features/home/views/home_screen.dart';
import 'features/home/home_layout.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruta IA',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.home: (context) => const HomeLayout(child: TravelHomePage()),
        AppRoutes.splash: (context) => const OnboardingScreen(),
        AppRoutes.profile: (context) => const HomeLayout(child: ProfileScreen()),
      },
    );
  }
}
