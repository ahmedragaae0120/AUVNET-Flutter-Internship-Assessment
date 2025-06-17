import 'package:auvnet_task/core/Di/di.dart';
import 'package:auvnet_task/core/utils/assets_manager.dart';
import 'package:auvnet_task/ui/tabs/cart/cart_tab_view.dart';
import 'package:auvnet_task/ui/tabs/categories/categories_tab_view.dart';
import 'package:auvnet_task/ui/tabs/deliver/deliver_tab_view.dart';
import 'package:auvnet_task/ui/tabs/home/home_tab_view.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_bloc.dart';
import 'package:auvnet_task/ui/tabs/profile/profile_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MainScreen extends StatefulWidget {
  final int initialTab;
  final String? selectedCategoryId;

  const MainScreen({
    super.key,
    this.initialTab = 0,
    this.selectedCategoryId,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTab;

    _screens = [
      const HomeTabView(),
      const CategoriesTabView(),
      const DeliverTabView(),
      const CartTabView(),
      const ProfileTabView(),
    ];
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.iconsCategories,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
                BlendMode.srcIn,
              ),
            ),
            label: "categories",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.iconsDeliver,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
                BlendMode.srcIn,
              ),
            ),
            label: "deliver",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.iconsCart,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
                BlendMode.srcIn,
              ),
            ),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.iconsProfile,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 4
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
