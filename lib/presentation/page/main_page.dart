import 'package:flutter/material.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:myapp/presentation/widgets/main_navigation_bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    var selectedIndex = appState.selectedIndex;

    Widget page;
    switch (appState.selectedIndex) {
      case 0:
        page = Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Home')],
          ),
        );
      case 1:
        page = Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Money')],
          ),
        );
      case 2:
        page = Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Other')],
          ),
        );
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          bottomNavigationBar: MainNavigationBar(),
          body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ));
      },
    );
  }
}
