import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class BaseNotifier extends ChangeNotifier {
  Future<T?> safeAction<T>(
    AsyncValueGetter<T> action, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) {
        EasyLoading.show();
      }
      final result = await action();
      return result;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      handleError(e.toString().replaceAll('Exception:', ''));
      return null;
    } finally {
      if (showLoading) {
        EasyLoading.dismiss();
      }
    }
  }

  void handleError(String message) {
    EasyLoading.showError(message);
  }
}
