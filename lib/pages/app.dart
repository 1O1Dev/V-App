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

  final Widget homeIcon = SvgPicture.asset('assets/icons/home.svg');
  final Widget searchIcon = SvgPicture.asset('assets/icons/search.svg');
  final Widget postIcon = SvgPicture.asset('assets/icons/post.svg');
  final Widget notificationIcon =
      SvgPicture.asset('assets/icons/notification.svg');
  final Widget profileIcon = SvgPicture.asset('assets/icons/profile.svg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
          PostPage(),
          NotificationPage(),
          MyProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: homeIcon,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: searchIcon,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: postIcon,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: notificationIcon,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: profileIcon,
            label: '',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
