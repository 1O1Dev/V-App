import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_app/pages/page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final _pageViewController = PageController();
  int _currentIndex = 0;

  void _onItemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
    _pageViewController.jumpToPage(index);
  }

  final Widget homeIcon = SvgPicture.asset(
    'assets/icons/home.svg',
    height: 23,
  );
  final Widget homeActiveIcon = SvgPicture.asset(
    'assets/icons/home-active.svg',
    height: 23,
  );
  final Widget searchIcon = SvgPicture.asset(
    'assets/icons/search.svg',
    height: 24,
  );
  final Widget searchActiveIcon =
      SvgPicture.asset('assets/icons/search-active.svg', height: 24);
  final Widget chatIcon = SvgPicture.asset('assets/icons/chat.svg', height: 24);
  final Widget chatActiveIcon =
      SvgPicture.asset('assets/icons/chat-active.svg', height: 24);
  final Widget notificationIcon =
      SvgPicture.asset('assets/icons/notification.svg', height: 24);
  final Widget notificationActiveIcon =
      SvgPicture.asset('assets/icons/notification-active.svg', height: 24);
  final Widget profileIcon = SvgPicture.asset(
    'assets/icons/profile.svg',
    height: 24,
  );
  final Widget profileActiveIcon =
      SvgPicture.asset('assets/icons/profile-active.svg', height: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
          ChatPage(),
          NotificationPage(),
          MyProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: homeIcon,
            label: '',
            activeIcon: homeActiveIcon,
          ),
          BottomNavigationBarItem(
            icon: searchIcon,
            label: '',
            activeIcon: searchActiveIcon,
          ),
          BottomNavigationBarItem(
            icon: chatIcon,
            label: '',
            activeIcon: chatActiveIcon,
          ),
          BottomNavigationBarItem(
            icon: notificationIcon,
            label: '',
            activeIcon: notificationActiveIcon,
          ),
          BottomNavigationBarItem(
            icon: profileIcon,
            label: '',
            activeIcon: profileActiveIcon,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
