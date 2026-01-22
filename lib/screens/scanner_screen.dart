import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_wash_tub_rider/constants/assets.dart';
import 'package:the_wash_tub_rider/constants/route_generator.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, orderTimelineScreen);
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(DummyAssets.scanner),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
