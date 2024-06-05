part of 'core_dependencies.dart';

class DataManagerDependency extends InheritedWidget {
  const DataManagerDependency({
    super.key,
    required super.child,
    required this.dataManager,
  });

  final DataManager dataManager;

  static DataManager of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<DataManagerDependency>()!
      .dataManager;

  @override
  bool updateShouldNotify(DataManagerDependency oldWidget) => false;
}
