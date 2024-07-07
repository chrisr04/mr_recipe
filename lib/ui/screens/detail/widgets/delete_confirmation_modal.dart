part of '../detail_screen.dart';

class DeleteConfirmationModal {
  static Future<void> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MrSpacing.md,
            vertical: MrSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_rounded,
                color: Theme.of(context).colorScheme.warning,
                size: 40.0,
              ),
              const MrSpacingM(),
              const MrTextHeading5(
                MrStrings.areYouSureWantDeleteThisRecipe,
                textAlign: TextAlign.center,
              ),
              const MrSpacingL(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MrPrimaryButton(
                    label: MrStrings.yesSure,
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                  ),
                  const MrSpacingS(axis: MrSpacingAxis.x),
                  MrPrimaryLabelButton(
                    label: MrStrings.noBack,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
