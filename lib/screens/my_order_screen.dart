import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';
import 'package:the_wash_tub_rider/widget/order_tile.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final _statusNotifier = ValueNotifier<OrderStatus>(OrderStatus.allOrder);

  @override
  void dispose() {
    _statusNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: const Text("My Orders"),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  borderRadius: BorderRadius.circular(7.0.r),
                ),
                padding: EdgeInsets.all(2.0.w),
                child: ValueListenableBuilder(
                  valueListenable: _statusNotifier,
                  builder: (context, orderStatus, child) {
                    return Row(
                      spacing: 2.w,
                      children: OrderStatus.values.map((status) {
                        return jobTags(
                          title: status.text,
                          isSelected: orderStatus == status,
                          onTap: () {
                            _statusNotifier.value = status;
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              SizedBox(height: 19.h),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(height: 20.h),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return OrderTile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget jobTags({
  required String title,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11.5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : AppColors.textGreyColor,
            ),
          ),
        ),
      ),
    ),
  );
}

enum OrderStatus {
  allOrder("All Orders"),
  pending("Pending"),
  completed("Completed");

  final String text;

  const OrderStatus(this.text);
}
