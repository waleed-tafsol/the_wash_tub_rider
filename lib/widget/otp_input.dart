import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final void Function(String otp)? onCompleted;

  const OtpInput({super.key, this.length = 4, this.onCompleted});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < widget.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }

    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    final otp = controllers.map((e) => e.text).join();
    if (!otp.contains('') && otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  Widget _buildBox(int index) {
    return SizedBox(
      width: 56,
      height: 56,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(
          fontSize: 30.sp,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          counterText: '',
          filled: true,
          fillColor: AppColors.textFieldFillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) => _onChanged(value, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: _buildBox(index),
        ),
      ),
    );
  }
}
