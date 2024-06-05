import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/widgets/widgets.dart';

class MrSnackBar {
  static void showError(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MrTextMedium(
          message,
          color: Theme.of(context).colorScheme.onError,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
