part of 'bloc_dependencies.dart';

class HomeBlocDependency extends InheritedWidget {
  const HomeBlocDependency({
    super.key,
    required super.child,
    required this.create,
  });

  final HomeBloc Function(BuildContext context) create;

  static HomeBloc of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<HomeBlocDependency>()!
      .create(context);

  @override
  bool updateShouldNotify(HomeBlocDependency oldWidget) => false;
}
