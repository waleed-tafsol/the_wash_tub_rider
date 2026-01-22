import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/constants/route_generator.dart';

import '../utils/color_constant.dart';

class _OnboardingModel {
  final String title;
  final String description;
  final String image;

  _OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final GlobalKey<FormState> personalFormKey = GlobalKey<FormState>();

  final List<_OnboardingModel> _onboardingList = [
    _OnboardingModel(
      title: 'Welcome to The Wash Tub',
      description:
          'Your ultimate laundry service solution, at your fingertips.',
      image: PngAssets.onboarding1,
    ),
    _OnboardingModel(
      title: 'Scan and Deliver',
      description:
          'Quickly scan laundry bags to retrieve customer info and handle orders efficiently.',
      image: PngAssets.onboarding2,
    ),
    _OnboardingModel(
      title: 'Stay on Track',
      description:
          'Optimize your route, stay updated with real-time alerts, and ensure timely deliveries.',
      image: PngAssets.onboarding3,
    ),
  ];
  final PageController _pageController = PageController();
  final ValueNotifier _currentPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: PageView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          _currentPage.value = index;
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(_onboardingList[index].image),
              SizedBox(height: 60.h),
              Text(
                _onboardingList[index].title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                child: Text(
                  _onboardingList[index].description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 24.h),
              ValueListenableBuilder(
                valueListenable: _currentPage,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_onboardingList.length, (index) {
                      final bool isSelected = index == _currentPage.value;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 24.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.kPrimaryColor
                              : AppColors.textFieldFillColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                child: ValueListenableBuilder(
                  valueListenable: _currentPage,
                  builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_currentPage.value < 2) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushReplacementNamed(context, loginScreen);
                        }
                      },
                      child: Text(
                        _currentPage.value < 2 ? 'Next' : 'Get Started',
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
