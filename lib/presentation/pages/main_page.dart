import 'package:flutter/material.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:myapp/presentation/pages/checklist_page.dart';
import 'package:myapp/presentation/pages/financial_page.dart';
import 'package:myapp/presentation/pages/home_page.dart';
import 'package:myapp/presentation/pages/lifting_page.dart';
import 'package:myapp/presentation/pages/other_page.dart';
import 'package:myapp/presentation/widgets/main_navigation_bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class MainPageNavigationItem {
  final String navigateName;
  final Icon inactiveStateIcon;
  final Icon activeStateIcon;
  final Widget page;

  MainPageNavigationItem(
    this.navigateName,
    this.inactiveStateIcon,
    this.activeStateIcon,
    this.page,
  );
}

class _MainPageState extends State<MainPage> {
  List<MainPageNavigationItem> navigationItemList = [
    MainPageNavigationItem(
      "Home",
      Icon(Icons.home_outlined),
      Icon(Icons.home),
      HomePage(),
    ),
    MainPageNavigationItem(
      "Checklist",
      Icon(Icons.check_box_outlined),
      Icon(Icons.check_box),
      ChecklistPage(),
    ),
    MainPageNavigationItem(
      "Fitness",
      Icon(Icons.fitness_center_outlined),
      Icon(Icons.fitness_center),
      LiftingPage(),
    ),
    MainPageNavigationItem(
      "Financial",
      Icon(Icons.account_balance_outlined),
      Icon(Icons.account_balance),
      FinancialPage(),
    ),
    MainPageNavigationItem(
      "Other",
      Icon(Icons.help_outline),
      Icon(Icons.help),
      OtherPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    var selectedIndex = appState.selectedIndex;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          bottomNavigationBar: MainNavigationBar(
            navigationItemList: navigationItemList,
          ),
          body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: navigationItemList[selectedIndex].page,
          ),
        );
      },
    );
  }
}
