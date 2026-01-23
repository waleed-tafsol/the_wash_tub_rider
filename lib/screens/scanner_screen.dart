import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:the_wash_tub_rider/constants/route_generator.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScanned = false;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(DummyAssets.scanner),
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ),
    );
  }
}
