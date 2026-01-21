import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';

class TodaysOrderTitle extends StatelessWidget {
  const TodaysOrderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.textFieldFillColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  DummyAssets.person,
                  height: 38.h,
                  width: 38.h,
                ),
              ),
              SizedBox(width: 7.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Christopher Smith",
                    style: Theme.of(context).textTheme.headlineMedium!,
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    "+1 (555) 123-4567",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  "New",
                  style: Theme.of(context).textTheme.headlineSmall!,
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              Icon(
                Iconsax.location,
                size: 18.sp,
                color: AppColors.textGreyColor,
              ),
              SizedBox(width: 7.w),
              Text(
                "123 Main Street, Apt 4B",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.textGreyColor),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Iconsax.clock, size: 18.sp, color: AppColors.textGreyColor),
              SizedBox(width: 7.w),
              Text(
                "9:00 AM - 5:00 PM",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.textGreyColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
