import 'package:flutter/material.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:provider/provider.dart';

class MainNavigationBar extends StatelessWidget {
  MainNavigationBar({super.key});

  final Map<String, List<Icon>> navigationItem = {
    'Home': [Icon(Icons.home), Icon(Icons.home_outlined)],
    'Money': [Icon(Icons.attach_money), Icon(Icons.attach_money_outlined)],
    'Other': [Icon(Icons.help_outline), Icon(Icons.help_outline_outlined)],
  };

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: [
        for (var item in navigationItem.keys.toList())
          NavigationDestination(
            selectedIcon: navigationItem[item]![1],
            icon: navigationItem[item]![0],
            label: item,
          ),
      ],
      selectedIndex: appState.selectedIndex,
      onDestinationSelected: (value) {
        appState.onSelectIndex(value);
      },
    );
  }
}
