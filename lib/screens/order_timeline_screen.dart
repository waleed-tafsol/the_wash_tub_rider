import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/constants/route_generator.dart';
import 'package:the_wash_tub_rider/widget/order_timeline_widget.dart';
import '../widget/border_container_widget.dart';

class OrderTimelineScreen extends StatelessWidget {
  const OrderTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(DummyAssets.orderDetail, height: 375.h),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Client",
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

                    child: Icon(Iconsax.message_text, color: Color(0XFF761C5C)),
                  ),
                  SizedBox(width: 6.w),
                  BorderContainerWidget(
                    color: Colors.white,

                    child: Icon(Icons.call_outlined, color: Color(0XFF761C5C)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Order Timeline",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 18.h),
            OrderTimelineWidget(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.w),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, ratingScreen);
          },
          child: Text("Mark as Delivered"),
        ),
      ),
    );
  }
}
