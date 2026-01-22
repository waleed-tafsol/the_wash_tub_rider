import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';

import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/widget/border_container_widget.dart';
import 'package:the_wash_tub_rider/widget/order_detail_timeline_widget.dart';

class OrderTimelineWidget extends StatelessWidget {
  const OrderTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderContainerWidget(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(16.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderDetailTimelineWidget(
            title: "Picked Up From Customer",
            subtitle: "123 Main Street, Apt 4B",
            svgIcon: SvgAssets.cube,
          ),
          SizedBox(height: 10.h),
          Container(
            margin: EdgeInsets.only(left: 25.w),
            height: 22.h,
            width: 2.w,
            color: AppColors.kPrimaryColor,
          ),
          SizedBox(height: 10.h),
          OrderDetailTimelineWidget(
            title: "Delivered to Factory",
            subtitle: "123 Main Street, Apt 4B",
            svgIcon: SvgAssets.delivery,
          ),
          SizedBox(height: 10.h),
          Container(
            margin: EdgeInsets.only(left: 25.w),
            height: 22.h,
            width: 2.w,
            color: AppColors.kPrimaryColor,
          ),
          SizedBox(height: 10.h),
          OrderDetailTimelineWidget(
            title: "Pickup From Factory",
            subtitle: "123 Main Street, Apt 4B",
            svgIcon: SvgAssets.delivery,
          ),
          Container(
            margin: EdgeInsets.only(left: 25.w),
            height: 22.h,
            width: 2.w,
            color: AppColors.kPrimaryColor,
          ),
          SizedBox(height: 10.h),
          OrderDetailTimelineWidget(
            title: "Delivered to Factory",
            subtitle: "123 Main Street, Apt 4B",
            svgIcon: SvgAssets.cube,
          ),
          // SizedBox(height: 10.h),
          // // Container(
          // //   margin: EdgeInsets.only(left: 25.w),
          // //   height: 22.h,
          // //   width: 2.w,
          // //   color: AppColors.kPrimaryColor,
          // // ),
          // // SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
