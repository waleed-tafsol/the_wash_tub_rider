import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/widget/text_form_field_with_title_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Password")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormFieldWithTitleWidget(
              title: 'Current Password',
              suffixIcon: Icons.visibility_outlined,
              controller: TextEditingController(),
            ),
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
                Navigator.of(context).pop();
              },
              child: const Text('Update Password'),
            ),
          ],
        ),
      ),
    );
  }
}
