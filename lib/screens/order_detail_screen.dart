import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/widget/todays_order_title.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(PngAssets.homeVector),

          Column(
            children: [
              SizedBox(height: 159.h),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 26.h,
                    horizontal: 24.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      buildProfile(context: context),
                      SizedBox(height: 30.h),
                      buildProfileInfo(context: context),
                      SizedBox(height: 30.h),
                      Text(
                        "Comments by Customer",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis volutpat penatibus nullam elementum pulvinar lectus cras tempus iaculis. Ut nascetur elementum orci dictumst tempus tristique viverra aliquam dui. Semper eget lobortis pharetra facilisis cursus porttitor. Non, neque eget facilisis interdum molestie est.",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 121.h,
            left: 24.w,
            child: ClipOval(
              child: Image.asset(DummyAssets.person, height: 82.w, width: 82.w),
            ),
          ),
          Positioned(
            top: 64.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.arrow_left,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 51.w),
                  Text(
                    "New Order Details",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(24.w),
        child: ElevatedButton(onPressed: () {}, child: Text("Scan Order")),
      ),
    );
  }

  Row buildProfile({required BuildContext context}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Christopher Smith",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontSize: 19.sp),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Iconsax.call, size: 16.sp, color: AppColors.textGreyColor),
                SizedBox(width: 6.w),
                Text(
                  "+1 (555) 123-4567",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(9.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColors.lightGrey, width: 1.w),
              ),
              child: Icon(
                Iconsax.message_text,
                size: 20.sp,
                color: AppColors.darkPurpleColor,
              ),
            ),
            SizedBox(width: 14.w),
            Container(
              padding: EdgeInsets.all(9.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColors.lightGrey, width: 1.w),
              ),
              child: Icon(
                Iconsax.call,
                size: 20.sp,
                color: AppColors.darkPurpleColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildProfileInfo({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 111.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Postal Code",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "10001",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 30.w),
            SizedBox(
              width: 111.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "09:00 - 10:00",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text("Location", style: Theme.of(context).textTheme.displayMedium),
        SizedBox(height: 10.h),
        Text(
          "2487 Maplewood Drive, Austin, TX 78704, United States",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
