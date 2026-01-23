import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';

import '../constants/route_generator.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScanned = false;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: MobileScanner(
              onDetect: (result) {
                if (isScanned) {
                  return;
                }
                final String? value = result.barcodes.firstOrNull?.rawValue;
                if (value != null) {
                  isScanned = true;
                  log('VALUE: $value');
                  Navigator.pushReplacementNamed(context, orderTimelineScreen);
                }
              },
            ),
          ),
          Positioned(
            top: 193.h,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              SvgAssets.frame,
              width: 300.w,
              height: 300.w,
            ),
          ),
        ],
      ),
    );
  }
}
