part of '../home_screen.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(MrSpacing.sl),
          child: MrTextHeading6(
            message,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
