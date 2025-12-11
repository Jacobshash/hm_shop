import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> _navBarList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png",
      "active_icon": "lib/assets/ic_public_home_active.png",
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "active_icon": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getNavBar() {
    return List.generate(_navBarList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_navBarList[index]["icon"], width: 30, height: 30),
        activeIcon: Image.asset(
          _navBarList[index]["active_icon"],
          width: 30,
          height: 30,
        ),
        label: _navBarList[index]["text"],
      );
    });
  }

  Widget _getBodyView() {
    return IndexedStack(
      index: _currentIndex,
      children: [HomeView(), CategoryView(), CartView(), MineView()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _getBodyView()),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: _getNavBar(),
      ),
    );
  }
}
