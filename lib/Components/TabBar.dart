import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Screen/after_login/home_related/home_page.dart';
import 'package:plusch/Screen/after_login/mypage_related/enter_info_page.dart';
import 'package:plusch/Screen/after_login/mypage_related/mypage.dart';
import 'package:plusch/Screen/after_login/mypage_related/settings.dart';
import 'package:plusch/Screen/after_login/search_history_related/search_history_page.dart';

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
    return PersistentTabView(
      context,
      screens: pageList,
      navBarStyle: NavBarStyle.style6,
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: 'ホーム',
          activeColorPrimary: mainColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: '履歴検索',
          activeColorPrimary: mainColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: 'マイページ',
          activeColorPrimary: mainColor,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
    );
  }
}
