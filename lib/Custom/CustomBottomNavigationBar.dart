import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      elevation: 8,
      scaleFactor: 0.3, // Adjusted scale factor to ensure it fits well
      iconSize: 24, // Reduced icon size
      selectedColor: Color(0xff040307),
      strokeColor: Color(0x30040307),
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          title: Text('My Reviews', style: TextStyle(fontSize: 12)),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.medical_services),
          title: Text('New Review', style: TextStyle(fontSize: 12)),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile', style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}
