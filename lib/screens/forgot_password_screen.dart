import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/route_generator.dart';
import '../widget/text_form_field_with_title_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot password',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 16.h),
              Text(
                'Enter your email for the verification process. We will send 4 digits code to your email.',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 10.h),
              TextFormFieldWithTitleWidget(
                title: 'Email Address',
                controller: TextEditingController(),
                hintText: "nicholas.bebjamin@example.com",
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Navigate to OTP Screen
                  Navigator.pushNamed(context, otpScreen);
                },
                child: const Text('Send Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
