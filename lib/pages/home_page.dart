import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/widgets/resource_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    ResourceList(),
    CartPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 0,
          currentIndex: currentPage,
          onTap: (value) {
            setState(
              () {
                currentPage = value;
              },
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
