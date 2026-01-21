import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/widget/border_container_widget.dart';


class OrderDetailTimelineWidget extends StatelessWidget {
  const OrderDetailTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BorderContainerWidget(
          padding: EdgeInsets.all(13.w),
          color: AppColors.kPrimaryColor,
          child: SvgPicture.asset(
            SvgAssets.cube,
            color: Colors.white,
            width: 24.w,
            height: 24.w,
          ),
        ),
        SizedBox(width: 16.w),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Picked Up",
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(fontSize: 16.sp),
              ),
              Text(
                "Your laundry was collected",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Spacer(),
        Text("9:30AM", style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
