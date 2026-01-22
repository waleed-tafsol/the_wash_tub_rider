import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/constants/route_generator.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ratings")),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                "Rate your Rider",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16.h),
              Text(
                "Rate the customer.",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  ClipOval(
                    child: Center(
                      child: Image.asset(
                        DummyAssets.person,
                        fit: BoxFit.cover,
                        height: 42.w,
                        width: 42.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Christopher Smith",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Customer",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                "How was your experience?",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 14.h),
              RatingBar(
                glow: false,
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star_rounded, color: Colors.amber),
                  half: const Icon(
                    Icons.star_half_rounded,
                    color: Colors.amber,
                  ),
                  empty: const Icon(
                    Icons.star_outline_rounded,
                    color: AppColors.textBlackColor,
                  ),
                ),
                onRatingUpdate: (double value) {},
              ),

              SizedBox(height: 30.h),
              Text(
                "Leave your thought",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 10.h),
              TextFormField(
                minLines: 4,
                maxLines: 4,
                decoration: InputDecoration(hintText: 'Type here'),
              ),
              SizedBox(height: 10.h),
              Text(
                "Write in 100 Character",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGreyColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0.w),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              bottomNavBarScreen,
              (route) => false,
            );
          },
          child: Text("Submit"),
        ),
      ),
    );
  }
}
