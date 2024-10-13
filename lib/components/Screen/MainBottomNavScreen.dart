import 'package:app/components/Screen/Doctor_profile.dart';
import 'package:app/components/Screen/home_pages.dart';
import 'package:flutter/material.dart';


class MainBottomNavScreen extends StatefulWidget {
  @override
  _MainBottomNavScreenState createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePages(),
    DoctorProfileScreen()
    // Add your other pages here like SearchPage(), TimePage(), etc.
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 235, 251),
      body: _pages[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 10), // Adjust padding for a floating effect
          child: Container(
            height: 75, // Height of BottomNavigationBar
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 22, 108, 207), // White background for floating effect
              borderRadius: BorderRadius.circular(17), // Circular borders
              boxShadow: [
                BoxShadow(
                  color: Colors.black12, // Subtle shadow for floating effect
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30), // Same border radius as container
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent, // Transparent background
                elevation: 0, // Remove default shadow
                selectedItemColor: Colors.blue, // Selected icon color
                unselectedItemColor: Colors.grey, // Unselected icon color
                showSelectedLabels: false, // Hide selected labels
                showUnselectedLabels: false, // Hide unselected labels
                currentIndex: _selectedIndex, // Current selected index
                onTap: _onItemTapped, // Handle taps
                items: [
                  BottomNavigationBarItem(
                    icon: _buildIconWithBackground(Icons.home_filled, 0),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIconWithBackground(Icons.calendar_today, 1),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIconWithBackground(Icons.chat_bubble_outline, 2),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIconWithBackground(Icons.account_box_outlined, 3),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIconWithBackground(Icons.settings, 4),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper to build an icon with background circle effect when selected
  Widget _buildIconWithBackground(IconData iconData, int index) {
    bool isSelected = _selectedIndex == index;

    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.3), // Highlight background for selected icon
              shape: BoxShape.circle, // Circular background
            )
          : null, // No decoration for unselected
      padding: const EdgeInsets.all(8), // Padding around the icon
      child: Icon(
        iconData,
        size: 24,
        color: isSelected ? Colors.white : Colors.grey.shade500, // Icon color based on selection
      ),
    );
  }
}
