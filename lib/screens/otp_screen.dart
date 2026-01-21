import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/constants/route_generator.dart';
import 'package:the_wash_tub_rider/widget/otp_input.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                'Enter 4 Digit Code',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 16.h),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.displayLarge,

                  children: [
                    TextSpan(
                      text:
                          'Enter 4 digit code that you receive on your email ',
                    ),
                    TextSpan(text: '(nicholas.bebjamin@example.com).'),
                  ],
                ),
              ),

              SizedBox(height: 30.h),
              OtpInput(
                length: 4,
                onCompleted: (otp) {
                  print("OTP entered: $otp");
                },
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Email not received? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      // handle resend
                    },
                    child: Text(
                      "Resend code",
                      style: TextStyle(
                        decoration: TextDecoration.underline,

                        color: Colors.purple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    resetPasswordScreen,
                    (route) {
                      return false;
                    },
                  );
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
