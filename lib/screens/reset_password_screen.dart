import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/widget/app_dialog.dart';
import 'package:the_wash_tub_rider/widget/text_form_field_with_title_widget.dart';

import '../constants/route_generator.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Set the new password for your account so you can login and access all the features.',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 10.h),
                TextFormFieldWithTitleWidget(
                  title: 'New Password',
                  controller: TextEditingController(),
                  suffixIcon: Icons.visibility_outlined,
                ),
                TextFormFieldWithTitleWidget(
                  title: 'Confirm Password',
                  controller: TextEditingController(),
                  suffixIcon: Icons.visibility_outlined,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to OTP Screen
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => AppDialog(
                        titleIcon: SvgPicture.asset(SvgAssets.dialogBoxTick),
                        title: "Password Changed!",
                        message:
                            "Your can now use your new password to login to your account.",
                        primaryText: "Continue",
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
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
