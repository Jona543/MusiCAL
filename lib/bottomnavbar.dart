import 'package:flutter/material.dart';
import 'package:musical/main.dart';
import './themes/theme_provider.dart';
import './themes/themes.dart';
import 'package:provider/provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Calendar(),
    Recommendations(),
    Festical(),
    Settings()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).themeData == darkMode;

    return Scaffold(
      body: IndexedStack(children: [
        Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: isDarkMode
            ? TextStyle(color: const Color.fromARGB(255, 247, 245, 245))
            : TextStyle(color: const Color.fromARGB(255, 0, 0, 1)),
        selectedItemColor: isDarkMode
            ? const Color.fromARGB(255, 157, 245, 94)
            : const Color.fromARGB(255, 80, 155, 51),
        unselectedLabelStyle: isDarkMode
            ? TextStyle(color: Colors.white)
            : TextStyle(color: Colors.black),
        unselectedItemColor: isDarkMode
            ? const Color.fromARGB(255, 255, 255, 255)
            : const Color.fromARGB(255, 0, 0, 0),
        iconSize: 35,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded,
                  color: isDarkMode
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 124, 124, 124)),
              label: 'Calendar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_alt_rounded,
                color: isDarkMode
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 124, 124, 124)),
            label: 'For You',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.festival,
                  color: isDarkMode
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 124, 124, 124)),
              label: 'FestiCAL'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded,
                  color: isDarkMode
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 124, 124, 124)),
              label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
