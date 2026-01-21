import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/widget/border_container_widget.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderContainerWidget(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainerWidget(
            shape: BoxShape.circle,
            padding: EdgeInsets.all(15.w),
            color: Color(0xffE5F2FF),
            child: Icon(
              Icons.date_range_outlined,
              color: AppColors.kPrimaryColor,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Booking Confirmation",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      "2min ago",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pickup scheduled for ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: '3:00 PM - 4:00 PM ',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      TextSpan(
                        text: 'today.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "View Details",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
