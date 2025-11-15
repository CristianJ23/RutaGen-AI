import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(75.0); 

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    
    return AppBar(
      automaticallyImplyLeading: false, 
      backgroundColor: Colors.white,
      elevation: 0,
      
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04), 
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: const NetworkImage(
                'https://i.pinimg.com/564x/bb/dd/e3/bbdde34ccf2b181ba62d1d42ba002c5b.jpg',
              ),
              radius: width * 0.05, // Ajuste de tamaño
            ),
            SizedBox(width: width * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, 
              children: [
                Text(
                  'David Carrión',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Loja, Ecuador',
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.menu, size: width * 0.07, color: Colors.black),
          ],
        ),
      ),
    );
  }
}