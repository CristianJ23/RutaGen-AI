import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<String> _routes = [
    '/home', 
    '/hotels', 
    '/planning', 
    '/profile', 
  ];

  int _currentIndex = 0; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentRoute = ModalRoute.of(context)?.settings.name;
      final index = _routes.indexOf(currentRoute ?? '');
      if (index != -1 && mounted) {
        setState(() {
          _currentIndex = index;
        });
      }
    });
  }

  void _onItemTapped(int index) {
    if (index == _currentIndex) {
      return; 
    }
    final newRoute = _routes[index];
    Navigator.pushReplacementNamed(context,newRoute);
    setState(()  => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = Color.fromARGB(255, 204, 114, 45); 

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) => _onItemTapped(index), 

      elevation: 10,
      backgroundColor: Colors.white,
      selectedItemColor: selectedColor,
      unselectedItemColor: Colors.grey[700],
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home, color: selectedColor),
          label: 'Inicio',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.king_bed_outlined), 
          activeIcon: Icon(Icons.king_bed, color: selectedColor),
          label: 'Hoteles',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.route_outlined), 
          activeIcon: Icon(Icons.route, color: selectedColor),
          label: 'Planificación',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person, color: selectedColor),
          label: 'Perfil',
        ),
      ],
    );
  }
}