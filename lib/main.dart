import 'package:flutter/material.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:myapp/presentation/page/main_page.dart';
import 'package:myapp/presentation/widgets/main_navigation_bar.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart' as di;

void main() async {
  await di.injectionInit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di.sl<AppState>(),
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF90D3FF)),
        ),
        home: MainPage(),
      ),
    );
  }
}
