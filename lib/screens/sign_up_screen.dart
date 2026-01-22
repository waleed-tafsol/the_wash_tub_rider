import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_wash_tub_rider/utils/validator.dart';
import '../constants/assets.dart';
import '../constants/route_generator.dart';
import '../utils/color_constant.dart';
import '../widget/phone_widget.dart';
import '../widget/text_form_field_with_title_widget.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Create an account',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Let’s create your account.',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 10.h),
                  TextFormFieldWithTitleWidget(
                    title: 'Full Name',
                    validator: Validators.empty,
                    controller: TextEditingController(),
                    hintText: "Enter Full Name",
                  ),
                  TextFormFieldWithTitleWidget(
                    title: 'Email Address',
                    validator: Validators.email,
                    controller: TextEditingController(),
                    hintText: "Enter Email Address",
                  ),
                  TextFormFieldWithTitleWidget(
                    title: 'Password',
                    validator: Validators.password,
                    controller: TextEditingController(),
                    suffixIcon: Icons.visibility_outlined,
                    hintText: "Enter Password",
                  ),
                  PhoneWidget(
                    isEditable: false,
                    controller: _phoneController,
                    filled: true,
                  ),

                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // context
                        //     .read<AuthViewModel>()
                        //     .register(
                        //       RegisterRequestModel(
                        //         email: _emailController.value.text,
                        //         password: _passwordController.value.text,
                        //         phoneNumber: _phoneController.value.text,
                        //         cc: "cc",
                        //       ),
                        //     )
                        //     .then((success) {
                        //       if (success && context.mounted) {
                        //         Navigator.pushNamed(context, loginScreen);
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
                      style: Theme.of(context).textTheme.bodyMedium,
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
                        child: SvgPicture.asset(SvgAssets.google, width: 27.w),
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
                  SizedBox(height: 30.h),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, loginScreen),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account?  ',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            TextSpan(
                              text: 'Sign In',
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
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
