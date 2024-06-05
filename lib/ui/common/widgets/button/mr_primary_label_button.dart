part of 'button.dart';

class MrPrimaryLabelButton extends StatelessWidget {
  const MrPrimaryLabelButton({
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
      color: Colors.transparent,
      height: 45.0,
      child: MrTextLarge(
        label,
        color: Theme.of(context).colorScheme.primary,
        weight: FontWeight.w600,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
