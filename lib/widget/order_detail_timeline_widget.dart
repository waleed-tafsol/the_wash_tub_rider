import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/widget/border_container_widget.dart';

class OrderDetailTimelineWidget extends StatelessWidget {
  OrderDetailTimelineWidget({super.key});
  final ValueNotifier<bool> _isChecked = ValueNotifier<bool>(false);

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
        ValueListenableBuilder<bool>(
          valueListenable: _isChecked,
          builder: (context, value, child) {
            return Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              side: BorderSide(color: AppColors.kPrimaryColor, width: 2.w),
              value: value,
              onChanged: (bool? newValue) {
                _isChecked.value = newValue ?? false;
              },
            );
          },
        ),
      ],
    );
  }
}
