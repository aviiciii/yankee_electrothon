import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/addfood.dart';
import 'package:renalcare/pages/discover.dart';
import 'package:renalcare/pages/graph/graph.dart';
import 'package:renalcare/pages/homepage.dart';
import 'package:renalcare/pages/profile.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({Key? key}) : super(key: key);

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _handleNavigation(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add Food',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.graphic_eq),
          label: 'Graph',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blue, // Change the selected item color here
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    switch (index) {
      case 0:
        Get.offAll(() => homePage()); // Use Get.offAll() for replacing the current route
        break;
      case 1:
        Get.offAll(() => discover());
        break;
      case 2:
        Get.offAll(() => addFood());
        break;
      case 3:
        Get.offAll(() => myGraph());
        break;
      case 4:
        Get.offAll(() => profile());
        break;
    }
  }
}
