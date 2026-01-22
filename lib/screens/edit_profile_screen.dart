import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/widget/border_container_widget.dart';

import '../constants/assets.dart';
import '../utils/color_constant.dart';
import '../widget/phone_widget.dart';
import '../widget/text_form_field_with_title_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Stack(
                children: [
                  ClipOval(
                    child: Image.asset(
                      DummyAssets.person,
                      height: 75.h,
                      width: 75.h,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: BorderContainerWidget(
                      shape: BoxShape.circle,
                      color: AppColors.kPrimaryColor,
                      child: Icon(
                        size: 21.sp,
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              TextFormFieldWithTitleWidget(
                title: 'Full Name',
                hintText: "Alexander Detorit",
                controller: TextEditingController(),
              ),
              TextFormFieldWithTitleWidget(
                title: 'Email Address',
                hintText: "detroit.alex@sample.com",
                controller: TextEditingController(),
              ),

              PhoneWidget(
                isEditable: false,
                controller: TextEditingController(),
                filled: true,
              ),

              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom + 24.0.h,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Update Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
