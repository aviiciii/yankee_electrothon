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
   int _selectedIndex = 0 ;
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue, // Set the active icon color to blue
          currentIndex: _selectedIndex,
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
              label: 'Add Today\'s Diet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cyclone_sharp),
              label: 'Dialysis cycle',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            _onItemTapped(index);
            _handleNavigation(context, _selectedIndex);
          },
        ),
      ),
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