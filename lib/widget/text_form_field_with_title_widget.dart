import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWithTitleWidget extends StatelessWidget {
  const TextFormFieldWithTitleWidget({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.formKey,
    this.validator,
  });

  final String title;
  final TextEditingController controller;
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          TextFormField(
            validator: (value) => validator != null ? validator!(value) : null,
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: hintText ?? "Enter",
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            ),
          ),
        ],
      ),
    );
  }
}
