import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/widget/notification_list_tile.dart';

import '../utils/color_constant.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.copyWith(fontSize: 19.sp),
                ),
                Text(
                  "Mark all as read",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.darkPurpleColor,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemBuilder: (_, index) => const NotificationListTile(),
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
