part of '../detail_screen.dart';

class DetailErrorMessage extends StatelessWidget {
  const DetailErrorMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MrTextHeading6(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }
}
