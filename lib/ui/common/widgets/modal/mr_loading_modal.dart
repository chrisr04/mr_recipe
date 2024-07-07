import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/common.dart';

class MrLoadingModal {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          child: const Padding(
            padding: EdgeInsets.all(MrSpacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                MrSpacingM(),
                MrTextLarge(
                  MrStrings.loading,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
