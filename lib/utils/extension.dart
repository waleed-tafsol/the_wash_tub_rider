// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// extension TruncateDouble on double {
//   String toStringAsTruncated(int fractionDigits) {
//     if (isNaN || isInfinite) {
//       return toString();
//     }

//     String s = toStringAsFixed(20);
//     int dotIndex = s.indexOf('.');
//     if (dotIndex == -1) return s; // No decimal point

//     int endIndex = dotIndex + 1 + fractionDigits;
//     if (endIndex > s.length) endIndex = s.length;

//     String truncated = s.substring(0, endIndex);

//     // Ensure correct number of digits after the decimal
//     int actualFractionDigits = endIndex - dotIndex - 1;
//     if (actualFractionDigits < fractionDigits) {
//       truncated = truncated.padRight(dotIndex + 1 + fractionDigits, '0');
//     }

//     return truncated;
//   }
// }

// extension FileUtils on File {
//   String get base64 {
//     final Uint8List bytes = readAsBytesSync();
//     return base64Encode(bytes);
//   }
// }

// extension NumberUtils on num {
//   String get formatted {
//     final NumberFormat formatter = NumberFormat.currency(
//       locale: 'en_US',
//       symbol: '\€',
//     );
//     return formatter.format(this);
//   }
// }

// extension DateTimeUtils on DateTime {
//   String get formattedDate {
//     return DateFormat('MM-dd-yyyy').format(this);
//   }

//   String get formattedTime {
//     if (kDebugMode) {
//       return DateFormat('MMM dd, yyyy hh:mm a').format(this);
//     }
//     return DateFormat('hh:mm a').format(this);
//   }

//   String get formattedDateTime {
//     return DateFormat('MMM dd, yyyy • hh:mm a').format(this);
//   }
// }

// extension StringUtils on String {
//   String get capitalizeWord {
//     return split(' ').map((word) {
//       return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
//     }).join(' ');
//   }
// }

// extension EnpochTime on DateTime {
//   int get epochSeconds => millisecondsSinceEpoch ~/ 1000;
// }

// extension ShimmerExtension on Widget {
//   Widget withShimmer({
//     Color? baseColor,
//     Color? highlightColor,
//   }) {
//     return Shimmer.fromColors(
//       baseColor: baseColor ?? Colors.grey.shade300,
//       highlightColor: highlightColor ?? Colors.grey.shade100,
//       child: this,
//     );
//   }
// }
