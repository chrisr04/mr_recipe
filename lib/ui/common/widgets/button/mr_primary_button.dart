part of 'button.dart';

class MrPrimaryButton extends StatelessWidget {
  const MrPrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.enabled = true,
  });

  final VoidCallback onPressed;
  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return _Button(
      key: key,
      onPressed: onPressed,
      enabled: enabled,
      color: Theme.of(context).primaryColor,
      height: 45.0,
      child: MrTextLarge(
        label,
        color: Theme.of(context).colorScheme.onPrimary,
        weight: FontWeight.w600,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
