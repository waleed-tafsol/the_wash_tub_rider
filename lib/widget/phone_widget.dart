import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/utils/validator.dart';

import '../utils/color_constant.dart';

class PhoneWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueSetter<String>? onChanged;

  final bool showLabel;
  final bool filled;
  final bool removeValidation;
  final bool isEditable;
  final ValueNotifier _currentCountry = ValueNotifier(
    Country(
      phoneCode: '65',
      countryCode: 'SG',
      e164Sc: 0,
      geographic: false,
      level: 1,
      name: "Singapore",
      example: '81234567',
      displayName: 'Singapore (SG) [+65]',
      displayNameNoCountryCode: 'Singapore (SG)',
      e164Key: '',
    ),
  );

  PhoneWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.showLabel = true,
    this.filled = false,
    this.isEditable = false,
    this.removeValidation = false,
  });

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text(
            "Phone Number",
            style: Theme.of(context).textTheme.headlineSmall,
            overflow: TextOverflow.ellipsis,
          ),
          TextFormField(
            readOnly: isEditable,
            controller: controller,
            // focusNode: _focusNode,
            onChanged: onChanged,
            autofocus: false,
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: Validators.phone,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontFamily: "General Sans"),
            onTapOutside: (_) {
              _focusNode.unfocus();
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: filled,
              fillColor: AppColors.textFieldFillColor,
              hintText: '921 - 2341 -99908',
              // hintStyle:
              //     Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
              //           // color: Colors.amber
              //           fontFamily: "General Sans",
              //         ),
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,

                color: Colors.grey,
              ),
              prefixIcon: _buildPhoneNumberPicker(context: context),
            ),
          ),
        ],
      ),
    );
  }

  IntrinsicHeight _buildPhoneNumberPicker({required BuildContext context}) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (!isEditable) {
                showCountryPicker(
                  // countryCodeWidth: 45.w,
                  moveAlongWithKeyboard: true,
                  countryListTheme: CountryListThemeData(
                    bottomSheetWidth: MediaQuery.sizeOf(context).width,
                    bottomSheetHeight: 560.h,
                    textStyle: TextStyle(fontSize: 14.sp),
                    searchTextStyle: TextStyle(fontSize: 14.sp),
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.only(
                      top: 15.h,
                      bottom: 27.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                  ),
                  context: context,
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    _currentCountry.value = country;
                    controller.value.text.padLeft(
                      controller.value.text.length + 1,
                      country.phoneCode.padRight(country.phoneCode.length, "-"),
                    );
                  },
                );
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 4.w),
                  child: Center(
                    child: ValueListenableBuilder(
                      valueListenable: _currentCountry,
                      builder: (context, value, child) {
                        return Text(
                          _currentCountry.value.flagEmoji,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // fontFamily: languageController
                            // .fontFamily.value,
                            fontSize: 14.sp,
                          ), // Adjust flag size
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: ValueListenableBuilder(
                    valueListenable: _currentCountry,
                    builder: (context, value, child) {
                      return Text(
                        "+ ${_currentCountry.value.phoneCode}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textGreyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.3.h),
            child: const VerticalDivider(
              color: Color(0xffE2E5E8),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
