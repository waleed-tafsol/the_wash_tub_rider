import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/widget/border_container_widget.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderContainerWidget(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  DummyAssets.person,
                  height: 38.w,
                  width: 38.w,
                ),
              ),
              SizedBox(width: 7.w),
              Column(
                children: [
                  Text(
                    "Charlie Donin",
                    style: Theme.of(context).textTheme.headlineMedium!,
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    "Normal Wash",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
              Spacer(),
              BorderContainerWidget(
                color: Colors.white,
                child: Text("Compeleted"),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        children: [
                          Icon(
                            Iconsax.clock,
                            size: 18.sp,
                            color: AppColors.textGreyColor,
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            "10:30 - 11:30",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.star_rate_rounded, color: Color(0xffF0B100)),
                      Text(
                        "4.7",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
