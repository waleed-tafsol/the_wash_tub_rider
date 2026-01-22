import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final Widget? titleIcon;
  final String message;
  final String primaryText;
  final VoidCallback onPrimary;
  final String? secondaryText;
  final Color? backgroundColor;
  final Color? primaryButtonColor;
  final VoidCallback? onSecondary;

  const AppDialog({
    super.key,
    required this.title,
    this.titleIcon,
    required this.message,
    required this.primaryText,
    required this.onPrimary,
    this.secondaryText,
    this.onSecondary,
    this.backgroundColor,
    this.primaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (titleIcon != null) titleIcon!,
            if (titleIcon != null) SizedBox(height: 20.h),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                if (secondaryText != null)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onSecondary ?? () => Navigator.pop(context),

                      child: Text(secondaryText!),
                    ),
                  ),
                if (secondaryText != null) const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onPrimary,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryButtonColor,
                    ),
                    child: Text(primaryText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
