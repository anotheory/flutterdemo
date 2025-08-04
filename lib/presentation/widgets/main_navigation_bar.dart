import 'package:flutter/material.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:myapp/presentation/page/main_page.dart';
import 'package:provider/provider.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({super.key, required this.navigationItemList});

  final List<MainPageNavigationItem> navigationItemList;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: [
        for (var item in navigationItemList)
          NavigationDestination(
            selectedIcon: item.activeStateIcon,
            icon: item.inactiveStateIcon,
            label: item.navigateName,
          ),
      ],
      selectedIndex: appState.selectedIndex,
      onDestinationSelected: (value) {
        appState.onSelectIndex(value);
      },
    );
  }
}
