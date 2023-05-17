import 'package:flutter/material.dart';
import 'package:pos_van/modules/category/category_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _selectedIndex = 0;

  static const List<Widget> _viewOptions = [
    CategoryView(),
    CategoryView(),
    CategoryView(),
    CategoryView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _viewOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
              ),
              label: 'ขาย',
              activeIcon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.blue,
              ),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'ออร์เดอร์',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'ออร์เดอร์',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'ออร์เดอร์',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int newIndex) {
            _selectedIndex = newIndex;
            setState(() {});
          },
        ),
      ),
    );
  }
}
