import 'package:flutter/material.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Screen/after_login/home_page.dart';
import 'package:plusch/Screen/after_login/mypage.dart';
import 'package:plusch/Screen/after_login/search_history_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int selectedIndex = 0;
  List<Widget> pageList = [
    const HomePage(),
    const SearchHistoryPage(),
    const MyPage(),
  ];

  void onTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: mainColor,
          highlightColor: Colors.white,
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Search'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'MyPage'
            )
          ],
          iconSize: 30,
          elevation: 10,
          backgroundColor: Colors.white,
          selectedItemColor: mainColor,
        ),
      ),
    );
  }
}
