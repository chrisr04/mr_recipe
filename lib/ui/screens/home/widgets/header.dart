part of '../home_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MrSpacing.md,
        vertical: MrSpacing.lg,
      ),
      child: Center(
        child: Image(
          image: AssetImage(MrAssets.mrRecipeLogo),
          width: 120.0,
        ),
      ),
    );
  }
}
