import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter1001tickets/components/home_component.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeComponent(),
    const Text("Marketplace"),
    const Text("Busqueda"),
    const Text("Mis Tickets"),
    const Text("Mi Cuenta"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.blueGrey[300],
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.home_24_regular),
                activeIcon: Icon(FluentIcons.home_24_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.building_shop_24_regular),
                activeIcon: Icon(FluentIcons.building_shop_24_filled),
                label: "Marketplace"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.search_24_regular),
                activeIcon: Icon(FluentIcons.search_24_filled),
                label: "Buscar"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.ticket_diagonal_24_regular),
                activeIcon: Icon(FluentIcons.ticket_diagonal_24_filled),
                label: "Tickets"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.person_24_regular),
                activeIcon: Icon(FluentIcons.person_24_filled),
                label: "Noticias"),
          ]),
    );
  }
}
