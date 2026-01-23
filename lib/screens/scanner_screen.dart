import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../constants/route_generator.dart';
import '../widget/scanner_overlay.dart';

class ScannerScreen extends StatelessWidget {
  ScannerScreen({super.key});

  final MobileScannerController _controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scanAreaSize = size.width * 0.7;
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            fit: BoxFit.cover,
            onDetect: (barcodeCapture) {
              //_controller.stop();
              _controller.dispose();

              Navigator.popAndPushNamed(context, orderTimelineScreen);
            },
            overlayBuilder: (context, constraints) {
              return Stack(
                children: [
                  ScannerOverlay(
                    scanAreaSize: scanAreaSize,
                    borderColor: Colors.white,
                    borderWidth: 3.0,
                    cornerLength: 30.0,
                    cornerWidth: 4.0,
                    overlayColor: Colors.black,
                    overlayOpacity: 0.5,
                  ),
                  BarcodeOverlay(
                    controller: _controller,
                    boxFit: BoxFit.contain,
                  ),
                ],
              );
            },
          ),

          /// Overlay text
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Scan QR Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
