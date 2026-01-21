import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/widget/order_timeling_widget.dart';

import '../utils/color_constant.dart';
import '../widget/border_container_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Details")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(DummyAssets.orderDetail),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Order Timeline",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 18.h),
            OrderTimelingWidget(),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Rider",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 18.h),
            BorderContainerWidget(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Image.asset(
                      DummyAssets.person,
                      height: 42.h,
                      width: 42.h,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Charlie Donin",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(fontSize: 14.sp),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xffF0B100),
                          ),
                          Text(
                            "4.4 Ratings",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  BorderContainerWidget(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    child: Icon(
                      Icons.messenger_outline,
                      color: Color(0XFF761C5C),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  BorderContainerWidget(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    child: Icon(Icons.call_outlined, color: Color(0XFF761C5C)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Payment Summary",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 18.h),
            BorderContainerWidget(
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              // color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Current Points",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text("120", style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Points to Redeem",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "-100",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Current Points",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "20",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
