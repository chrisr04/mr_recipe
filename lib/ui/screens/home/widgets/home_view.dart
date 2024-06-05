part of '../home_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final _homeBloc = BlocInjector.of<HomeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            HomeRecipeList(),
          ],
        ),
      ),
      floatingActionButton: AddRecipeButton(),
    );
  }

  @override
  void dispose() {
    _homeBloc.events.add(const UnwatchRecipesEvent());
    _homeBloc.dispose();
    super.dispose();
  }
}
