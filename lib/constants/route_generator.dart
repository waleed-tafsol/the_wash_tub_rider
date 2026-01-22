import 'package:flutter/material.dart';
import 'package:the_wash_tub_rider/screens/bottom_nav_page.dart';
import 'package:the_wash_tub_rider/screens/change_password_screen.dart';
import 'package:the_wash_tub_rider/screens/edit_profile_screen.dart';
import 'package:the_wash_tub_rider/screens/forgot_password_screen.dart';
import 'package:the_wash_tub_rider/screens/login_screen.dart';
import 'package:the_wash_tub_rider/screens/notification_screen.dart';
import 'package:the_wash_tub_rider/screens/onboarding_screen.dart';
import 'package:the_wash_tub_rider/screens/order_detail_screen.dart';
import 'package:the_wash_tub_rider/screens/order_timeline_screen.dart';

import 'package:the_wash_tub_rider/screens/otp_screen.dart';
import 'package:the_wash_tub_rider/screens/rating_screen.dart';
import 'package:the_wash_tub_rider/screens/reset_password_screen.dart';
import 'package:the_wash_tub_rider/screens/scanner_screen.dart';
import 'package:the_wash_tub_rider/screens/sign_up_screen.dart';
import 'package:the_wash_tub_rider/screens/splash_screen.dart';

const String splashScreen = '/';
const String onboardingScreen = '/onboarding_Screen';
const String loginScreen = '/login_Screen';
const String ratingScreen = '/rating_screen';
const String forgotPasswordScreen = '/forgot_password_screen';
const String otpScreen = '/otp_screen';
const String resetPasswordScreen = '/reset_password_screen';
const String orderTimelineScreen = '/order_timeline_screen';
const String bottomNavBarScreen = '/bottom_nav_page';
const String orderDetailScreen = '/order_detail_screen';
const String changePasswordScreen = '/change_password_screen';
const String editProfileScreen = '/edit_profile_screen';
const String scannerScreen = '/scanner_screen';
const String notificationScreen = '/notification_screen';
const String signUpScreen = '/sign_up_screen';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: splashScreen),
          builder: (_) => SplashScreen(),
        );
      case onboardingScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: onboardingScreen),
          builder: (_) => OnboardingScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: loginScreen),
          builder: (_) => LoginScreen(),
        );
      case scannerScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: scannerScreen),
          builder: (_) => const ScannerScreen(),
        );
      case forgotPasswordScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: forgotPasswordScreen),
          builder: (_) => const ForgotPasswordScreen(),
        );
      case otpScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: otpScreen),
          builder: (_) => const OtpScreen(),
        );
      case resetPasswordScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: resetPasswordScreen),
          builder: (_) => const ResetPasswordScreen(),
        );
      case orderTimelineScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: orderTimelineScreen),
          builder: (_) => const OrderTimelineScreen(),
        );
      case bottomNavBarScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: bottomNavBarScreen),
          builder: (_) => const BottomNavBarScreen(),
        );
        case orderDetailScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: orderDetailScreen),
          builder: (_) => const OrderDetailScreen(),
        );
      case changePasswordScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: changePasswordScreen),
          builder: (_) => const ChangePasswordScreen(),
        );
      case editProfileScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: editProfileScreen),
          builder: (_) => const EditProfileScreen(),
        );
      case ratingScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: ratingScreen),
          builder: (_) => const RatingScreen(),
        );
      case notificationScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: notificationScreen),
          builder: (_) => const NotificationScreen(),
        );
        case signUpScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: signUpScreen),
          builder: (_) =>  SignUpScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('ERROR')),
        );
      },
    );
  }
}
