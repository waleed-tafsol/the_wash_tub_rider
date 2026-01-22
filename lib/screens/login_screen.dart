import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/svg.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/models/request/login_request_model.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/utils/validator.dart';
import 'package:the_wash_tub_rider/view_model/auth_view_model.dart';
import 'package:the_wash_tub_rider/widget/text_form_field_with_title_widget.dart';

import '../constants/route_generator.dart';
import '../widget/phone_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login to your account',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'It’s great to see you again.',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(height: 10.h),
                    TextFormFieldWithTitleWidget(
                      title: 'Email Address',
                      validator: Validators.email,
                      controller: _emailController,
                    ),
                    TextFormFieldWithTitleWidget(
                      title: 'Password',
                      validator: Validators.password,
                      controller: _passwordController,
                      suffixIcon: Icons.visibility_outlined,
                    ),

                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, forgotPasswordScreen),
                        child: Text(
                          'Forgot your Password?',
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(color: AppColors.purpleColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // context
                          //     .read<AuthViewModel>()
                          //     .login(
                          //       loginReq: LoginRequestModel(
                          //         email: _emailController.text,
                          //         password: _passwordController.text,
                          //       ),
                          //     )
                          //     .then((success) {
                          //       if (success && context.mounted) {
                          //         // Navigator.pushNamed(
                          //         //   context,
                          //         //   stayUpdatedScreen,
                          //         // );
                          //       }
                          //     });
                          Navigator.pushNamed(context, bottomNavBarScreen);
                        }
                      },
                      child: const Text('Continue'),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        "Or",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(17.w),
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8F9),
                            border: Border.all(
                              color: Colors.grey[200]!,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset(
                            SvgAssets.google,
                            width: 27.w,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(17.w),
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8F9),
                            border: Border.all(
                              color: Colors.grey[200]!,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset(
                            SvgAssets.facebook,
                            width: 27.w,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(17.w),
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8F9),
                            border: Border.all(
                              color: Colors.grey[200]!,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset(SvgAssets.apple, width: 27.w),
                        ),
                      ],
                    ),

                    SizedBox(height: 200.h),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, signUpScreen);
                        }, // Navigator.pushNamed(context, signUpScreen),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don’t have an account?  ',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              TextSpan(
                                text: 'join',
                                style: Theme.of(context).textTheme.displayLarge
                                    ?.copyWith(
                                      color: AppColors.purpleColor,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
