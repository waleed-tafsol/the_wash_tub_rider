import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/widget/border_container_widget.dart';


class ProfileOptionsTile extends StatelessWidget {
  const ProfileOptionsTile({
    super.key,
    required this.title,
    this.logout = false,
    this.icon,
    required this.onTap,
  });
  final String title;
  final bool logout;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BorderContainerWidget(
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        child: Row(
          children: [
            logout
                ? Icon(Icons.logout, color: Colors.red)
                : Icon(icon, color: Color(0xff065D84)),
            SizedBox(width: 4.w),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: logout ? Colors.red : null,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
