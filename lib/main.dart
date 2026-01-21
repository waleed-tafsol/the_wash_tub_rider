import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:the_wash_tub_rider/view_model/bottom_nav_view_model.dart';
import 'app_init.dart';
import 'services/storage_service.dart';
import 'utils/color_constant.dart';
import 'utils/secure_storage_services.dart';
import 'view_model/theme_view_model.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0.h
    ..errorWidget = Icon(Icons.error, color: Colors.red, size: 45.0.sp)
    ..radius = 10.0.r
    ..progressColor = AppColors.kPrimaryColor
    ..backgroundColor = Colors.white
    ..boxShadow = [
      BoxShadow(color: Colors.grey.withValues(alpha: 0.5), blurRadius: 10),
    ]
    ..indicatorColor = AppColors.kPrimaryColor
    ..textColor = AppColors.kPrimaryColor
    ..textStyle = TextStyle(
      color: AppColors.kPrimaryColor,

      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    )
    ..toastPosition = EasyLoadingToastPosition.bottom
    //..maskColor = Colors.white.withValues(alpha: 0.5)
    // ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false
    ..dismissOnTap = false;
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().init();
  await SecureStorageService().init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeViewModel()),
        ChangeNotifierProvider(create: (context) => BottomNavViewModel()),
      ],
      child: AppInit(),
    ),
  );
}
