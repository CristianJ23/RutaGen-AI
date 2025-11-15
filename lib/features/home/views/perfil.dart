import 'package:flutter/material.dart';
import 'dart:ui'; // Para el ImageFilter.blur

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _buildSectionHeader(BuildContext context, String title) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Text(
      title,
      style: TextStyle(
        fontSize: screenWidth * 0.055, 
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildAccountItem(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () => print('Navegar a $title'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[700], size: MediaQuery.of(context).size.width * 0.06),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045, color: Colors.black87),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: MediaQuery.of(context).size.width * 0.04, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey[700], size: MediaQuery.of(context).size.width * 0.06),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Text(
                title,
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045, color: Colors.black87),
              ),
            ],
          ),
          Switch(
            value: true,
            onChanged: (bool value) {},
            activeColor: const Color.fromARGB(255, 204, 114, 45),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    const double profileSectionHeight = 320.0; 

    return Scaffold(
      backgroundColor: Colors.grey[200], 
      appBar: AppBar(
        toolbarHeight: 0.0, 
        elevation: 0, 
        backgroundColor: Colors.transparent, 
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            expandedHeight: profileSectionHeight, 
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://i.pinimg.com/564x/bb/dd/e3/bbdde34ccf2b181ba62d1d42ba002c5b.jpg',
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.1,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.15,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: screenWidth * 0.14,
                            backgroundImage: NetworkImage(
                              'https://i.pinimg.com/564x/bb/dd/e3/bbdde34ccf2b181ba62d1d42ba002c5b.jpg',
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'Luis Antonio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
                          ),
                        ),
                        Text(
                          'Turista',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth * 0.04,
                            shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 30, 
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.03,
                  ).copyWith(top: 0),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.01), 

                      Container(
                        width: screenWidth,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionHeader(context, 'Cuenta'),
                            SizedBox(height: screenHeight * 0.02),
                            _buildAccountItem(context, 'Información Personal', Icons.person_outline),
                            _buildAccountItem(context, 'Logros', Icons.emoji_events_outlined),
                            _buildAccountItem(context, 'Historial de actividades', Icons.history),
                            _buildAccountItem(context, 'Estadísticas', Icons.bar_chart),
                          ],
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      Container(
                        width: screenWidth,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionHeader(context, 'Notificaciones'),
                            SizedBox(height: screenHeight * 0.02),
                            _buildNotificationItem(context, 'Activar Notificaciones', Icons.notifications_none),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.09), // Padding final
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}