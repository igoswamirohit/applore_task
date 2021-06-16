import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Image.asset('assets/pngs/Vector.png'),
            ),
            label: 'Check'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/pngs/Vector (1).png'), label: 'Check'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/pngs/Vector (2).png'), label: 'Check'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            color: Colors.grey[400],
          ),
          label: 'Check',
        ),
      ],
    );
  }
}
