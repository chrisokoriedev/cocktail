import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cocktail_app/main.dart';
import 'package:cocktail_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainControl extends StatefulWidget {
  const MainControl({Key? key}) : super(key: key);

  @override
  State<MainControl> createState() => _MainControlState();
}

class _MainControlState extends State<MainControl> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: [
            const MyHome(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: kBackgroundColorII,
        child: BottomNavyBar(
          backgroundColor: kBackgroundColorII,
          showElevation: false,
          curve: Curves.easeOutQuad,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                title: const Text('Home'),
                icon: const Icon(FontAwesomeIcons.house)),
            BottomNavyBarItem(
                title: const Text('Explore'), icon: const Icon(Icons.explore)),
            BottomNavyBarItem(
                title: const Text('Profile'), icon: const Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
