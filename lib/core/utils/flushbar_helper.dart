import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.dart';

class FlushBarHelper {
  // static BuildContext? get _context =>
  //     StackedService.navigatorKey?.currentContext;

  static void showErrorMessage({required String message}) {
    final context = getContext;
    if (context == null) return;

    // Defer showing the Flushbar until after the current frame completes to
    // avoid route transition conflicts (e.g. showing during a pop).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error, size: 28, color: Colors.white),
        )..show(context),
      );
    });
  }

  static void showSuccessMessage({required String message}) {
    final context = getContext;
    if (context == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.check_circle, size: 28, color: Colors.white),
        )..show(context),
      );
    });
  }
}
