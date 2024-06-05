part of 'di.dart';

class CoreDependencies extends StatelessWidget {
  const CoreDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DataManagerDependency(
      hiveManager: DataManager(),
      child: child,
    );
  }
}

class DataManagerDependency extends InheritedWidget {
  const DataManagerDependency({
    super.key,
    required super.child,
    required this.hiveManager,
  });

  final DataManager hiveManager;

  static DataManager of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<DataManagerDependency>()!
      .hiveManager;

  @override
  bool updateShouldNotify(DataManagerDependency oldWidget) => false;
}
