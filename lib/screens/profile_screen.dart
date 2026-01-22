import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/constants/route_generator.dart';
import 'package:the_wash_tub_rider/widget/profile_options_tile.dart';

import '../constants/assets.dart';
import '../widget/app_dialog.dart';
import '../widget/border_container_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Image.asset(
                    DummyAssets.person,
                    height: 64.h,
                    width: 64.h,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alexander Detorit",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(fontSize: 20.sp),
                    ),
                    Text(
                      "detroit.alex@sample.com",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, editProfileScreen),
                  child: BorderContainerWidget(
                    shape: BoxShape.circle,
                    child: Icon(Icons.settings_outlined),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            ProfileOptionsTile(
              title: "Change Password",
              icon: Icons.lock_outline_sharp,
              onTap: () {
                Navigator.of(context).pushNamed(changePasswordScreen);
              },
            ),
            ProfileOptionsTile(
              title: "Contact Us",
              icon: Icons.info_outline,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  termsAndConditionScreen,
                  arguments: "Contact Us",
                );
              },
            ),
            ProfileOptionsTile(
              title: "FAQ’s",
              icon: Icons.question_mark_outlined,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  termsAndConditionScreen,
                  arguments: "FAQ’s",
                );
              },
            ),
            ProfileOptionsTile(
              title: "Privacy Policy",
              icon: Icons.privacy_tip_outlined,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  termsAndConditionScreen,
                  arguments: "Privacy Policy",
                );
              },
            ),
            ProfileOptionsTile(
              title: "Terms & Condition",
              icon: Icons.balance,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  termsAndConditionScreen,
                  arguments: "Terms and Conditions",
                );
              },
            ),
            ProfileOptionsTile(
              title: "Logout",
              logout: true,
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => AppDialog(
                    titleIcon: Image.asset(PngAssets.logout),
                    backgroundColor: Colors.white,
                    title: "Logout?",
                    message: "Are you sure want to logout from the app?",
                    secondaryText: "Cancel",
                    onSecondary: () {
                      Navigator.pop(context);
                    },
                    primaryText: "Continue",
                    primaryButtonColor: Color(0xffD72547),
                    onPrimary: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        loginScreen,
                        (route) => false,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
