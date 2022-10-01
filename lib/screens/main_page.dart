import 'package:flutter/material.dart';
import 'package:yuiapp/screens/basket_page.dart';

import '../themes/color.dart';
import 'account_page.dart';
import 'categories.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int tabIndex = 0;
  onChangeTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: buildBody()),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: tabIndex,
      children: const [
        HomePage(),
        Categories(),
        ShopPage(),
        AccountPage(),
      ],
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: tabIndex,
      onTap: onChangeTab,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: black,
      unselectedItemColor: grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Anasayfa",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Kategoriler",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Sepet",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Hesap",
        ),
      ],
    );
  }
}
