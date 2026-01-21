import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';

import '../utils/color_constant.dart';
import '../view_model/bottom_nav_view_model.dart';

class BottomNavItem {
  final String label;
  final String selectedIcon;
  final String unselectedIcon;

  const BottomNavItem({
    required this.label,
    required this.selectedIcon,
    required this.unselectedIcon,
  });
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const List<BottomNavItem> _items = [
    BottomNavItem(
      label: 'Home',
      selectedIcon: SvgAssets.homeFilled,
      unselectedIcon: SvgAssets.home,
    ),
    BottomNavItem(
      label: 'QR Bag',
      selectedIcon: SvgAssets.qrScanFilled,
      unselectedIcon: SvgAssets.qrScan,
    ),
    BottomNavItem(
      label: 'Book',
      selectedIcon: SvgAssets.bookFilled,
      unselectedIcon: SvgAssets.book,
    ),
    BottomNavItem(
      label: 'reward',
      selectedIcon: SvgAssets.rewardFilled,
      unselectedIcon: SvgAssets.reward,
    ),
    BottomNavItem(
      label: 'Profile',
      selectedIcon: SvgAssets.profileFilled,
      unselectedIcon: SvgAssets.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 10.r,
                offset: Offset(0, -10.h),
              ),
            ],
          ),
          height: 58.h,
          child: Consumer<BottomNavViewModel>(
            builder: (context, provider, child) {
              final int currentPage = provider.currentPage;
              return Row(
                children: List.generate(_items.length, (int index) {
                  final item = _items[index];
                  final isSelected = index == currentPage;
                  return _buildNavBarItem(
                    context: context,
                    item: item,
                    isSelected: isSelected,
                    index: index,
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }

  Expanded _buildNavBarItem({
    required BuildContext context,
    required BottomNavItem item,
    required bool isSelected,
    required int index,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          context.read<BottomNavViewModel>().changePage(index);
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                isSelected ? item.selectedIcon : item.unselectedIcon,
                height: 24.h,
                width: 24.h,
              ),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isSelected
                      ? AppColors.kPrimaryColor
                      : AppColors.textGreyColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
