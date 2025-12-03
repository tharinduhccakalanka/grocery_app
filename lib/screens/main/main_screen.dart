import 'package:flutter/material.dart';
import 'package:grocery_app_1/screens/main/favourites/favourites.dart';
import 'package:grocery_app_1/screens/main/home/home.dart';
import 'package:grocery_app_1/screens/main/profile/profile.dart';
import 'package:grocery_app_1/screens/main/search/search.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //to store the active bottom bar index
  int _activeIndex = 0;

  //trigger when bottem bar index
  void onItemTapped(int i) {
    setState(() {
      _activeIndex = i;
    });
  }

  //screens List
  final List<Widget> _screens = [
    const Home(),
    const Favourites(),
    const Search(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: SizedBox(
        height: 83,
        //color: AppColors.ash,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavTile(
              icon: Icons.home,
              isActive: _activeIndex == 0,
              onTap: () => onItemTapped(0),
            ),
            BottomNavTile(
              icon: Icons.favorite,
              isActive: _activeIndex == 1,
              onTap: () => onItemTapped(1),
            ),
            BottomNavTile(
              icon: Icons.search,
              isActive: _activeIndex == 2,
              onTap: () => onItemTapped(2),
            ),
            BottomNavTile(
              icon: Icons.person,
              isActive: _activeIndex == 3,
              onTap: () => onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile({
    super.key,
    required this.isActive,
    required this.icon,
    required this.onTap,
  });

  final bool isActive;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 33,
        color: isActive ? AppColors.primaryColor : AppColors.ash,
      ),
    );
  }
}
