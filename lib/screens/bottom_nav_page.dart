import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_wash_tub_rider/screens/profile_screen.dart';

import '../view_model/bottom_nav_view_model.dart';
import '../widget/bottom_nav_bar.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  static final List<Widget> _children = [
    // const HomeScreen(),
    // QrBagScreen(),
    // BookScreen(),
    // RewardsScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavViewModel>(
      builder: (context, provider, child) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            body: _children[provider.currentPage],
            extendBody: true,
            bottomNavigationBar: BottomNavBar(),
          ),
        );
      },
    );
  }
}
