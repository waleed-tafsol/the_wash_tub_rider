import 'package:flutter/material.dart';

/// A stylish square scanner overlay with animated corner indicators
class ScannerOverlay extends StatefulWidget {
  const ScannerOverlay({
    super.key,
    required this.scanAreaSize,
    this.borderColor = Colors.white,
    this.borderWidth = 3.0,
    this.cornerLength = 30.0,
    this.cornerWidth = 4.0,
    this.overlayColor = Colors.black,
    this.overlayOpacity = 0.5,
  });

  final double scanAreaSize;
  final Color borderColor;
  final double borderWidth;
  final double cornerLength;
  final double cornerWidth;
  final Color overlayColor;
  final double overlayOpacity;

  @override
  State<ScannerOverlay> createState() => _ScannerOverlayState();
}

class _ScannerOverlayState extends State<ScannerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scanArea = widget.scanAreaSize;
    final left = (size.width - scanArea) / 2;
    final top = (size.height - scanArea) / 2;

    return Stack(
      children: [
        // Semi-transparent overlay with cutout
        CustomPaint(
          painter: ScannerOverlayPainter(
            scanArea: scanArea,
            left: left,
            top: top,
            overlayColor: widget.overlayColor,
            overlayOpacity: widget.overlayOpacity,
          ),
          child: Container(),
        ),
        // Stylish corner indicators
        Positioned(
          left: left,
          top: top,
          child: SizedBox(
            width: scanArea,
            height: scanArea,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return CustomPaint(
                  painter: CornerIndicatorPainter(
                    cornerLength: widget.cornerLength,
                    cornerWidth: widget.cornerWidth,
                    borderColor: widget.borderColor,
                    animationValue: _animationController.value,
                  ),
                );
              },
            ),
          ),
        ),
        // Scanning line animation
        Positioned(
          left: left,
          top: top,
          child: SizedBox(
            width: scanArea,
            height: scanArea,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return CustomPaint(
                  painter: ScanningLinePainter(
                    scanArea: scanArea,
                    borderColor: widget.borderColor,
                    animationValue: _animationController.value,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ScannerOverlayPainter extends CustomPainter {
  ScannerOverlayPainter({
    required this.scanArea,
    required this.left,
    required this.top,
    required this.overlayColor,
    required this.overlayOpacity,
  });

  final double scanArea;
  final double left;
  final double top;
  final Color overlayColor;
  final double overlayOpacity;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = overlayColor.withValues(alpha: overlayOpacity)
      ..style = PaintingStyle.fill;

    // Draw four rectangles around the scanning area instead of cutting out
    // Top rectangle
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, top), paint);

    // Bottom rectangle
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        top + scanArea,
        size.width,
        size.height - (top + scanArea),
      ),
      paint,
    );

    // Left rectangle
    canvas.drawRect(Rect.fromLTWH(0, top, left, scanArea), paint);

    // Right rectangle
    canvas.drawRect(
      Rect.fromLTWH(
        left + scanArea,
        top,
        size.width - (left + scanArea),
        scanArea,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CornerIndicatorPainter extends CustomPainter {
  CornerIndicatorPainter({
    required this.cornerLength,
    required this.cornerWidth,
    required this.borderColor,
    required this.animationValue,
  });

  final double cornerLength;
  final double cornerWidth;
  final Color borderColor;
  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    // Animated corner color (pulsing effect)
    final animatedPaint = Paint()
      ..color = borderColor.withValues(alpha: 0.5 + (animationValue * 0.5))
      ..style = PaintingStyle.stroke
      ..strokeWidth = cornerWidth
      ..strokeCap = StrokeCap.round;

    // Top-left corner
    canvas.drawLine(const Offset(0, 0), Offset(cornerLength, 0), animatedPaint);
    canvas.drawLine(const Offset(0, 0), Offset(0, cornerLength), animatedPaint);

    // Top-right corner
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width - cornerLength, 0),
      animatedPaint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, cornerLength),
      animatedPaint,
    );

    // Bottom-left corner
    canvas.drawLine(
      Offset(0, size.height),
      Offset(cornerLength, size.height),
      animatedPaint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(0, size.height - cornerLength),
      animatedPaint,
    );

    // Bottom-right corner
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - cornerLength, size.height),
      animatedPaint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - cornerLength),
      animatedPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! CornerIndicatorPainter) return true;
    return oldDelegate.animationValue != animationValue;
  }
}

class ScanningLinePainter extends CustomPainter {
  const ScanningLinePainter({
    required this.scanArea,
    required this.borderColor,
    required this.animationValue,
  });

  final double scanArea;
  final Color borderColor;
  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    // Animated scanning line
    final lineY = size.height * animationValue;

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        borderColor.withValues(alpha: 0.0),
        borderColor.withValues(alpha: 0.8),
        borderColor.withValues(alpha: 0.0),
      ],
      stops: const [0.0, 0.5, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, lineY - 2, size.width, 4),
      )
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, lineY - 2, size.width, 4), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! ScanningLinePainter) return true;
    return oldDelegate.animationValue != animationValue;
  }
}
