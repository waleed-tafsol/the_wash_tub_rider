import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/widget/todays_order_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(PngAssets.homeVector),
          Column(
            children: [
              SizedBox(height: 59.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        DummyAssets.person,
                        height: 42.w,
                        width: 42.w,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Donald James",
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(fontSize: 20.sp, color: Colors.white),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Rider",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
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
                      Container(
                        height: 222.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(DummyAssets.map),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "Today’s Order",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(fontSize: 18.sp),
                      ),
                      // Wrap the ListView inside Flexible or Expanded
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20.h),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return TodaysOrderTitle();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
