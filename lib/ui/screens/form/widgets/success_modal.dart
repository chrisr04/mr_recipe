part of '../form_screen.dart';

class RecipeFormSuccessModal {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required VoidCallback onBack,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          surfaceTintColor: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MrSpacing.md,
              vertical: MrSpacing.lg,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.success,
                  size: 40.0,
                ),
                const MrSpacingM(),
                MrTextHeading5(
                  title,
                  textAlign: TextAlign.center,
                ),
                const MrSpacingL(),
                SizedBox(
                  width: double.infinity,
                  child: MrPrimaryButton(
                    label: MrStrings.back,
                    onPressed: onBack,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
