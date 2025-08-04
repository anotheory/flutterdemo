import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:myapp/presentation/bloc/user_authentication_bloc.dart';
import 'package:myapp/presentation/page/login/user_login_page.dart';
import 'package:myapp/presentation/page/main_page.dart';
import 'package:myapp/presentation/page/register/user_register_page.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.sl<AppState>(),
        ),
        Provider(
          create: (context) => di.sl<UserAuthenticationBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF90D3FF)),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthWrapper(),
          '/login': (context) => const UserLoginPage(),
          '/register': (context) => const UserRegisterPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthenticationBloc, UserAuthenticationState>(
      builder: (context, state) {
        // Dispatch AppStartedEvent to check initial auth state
        if (state.status == AuthenticationStatus.unknown) {
          context.read<UserAuthenticationBloc>().add(AppStartedEvent());
          // Show loading while checking auth state
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Navigate based on authentication status
        if (state.status == AuthenticationStatus.authenticated) {
          return const MainPage();
        } else {
          return const UserLoginPage();
        }
      },
    );
  }
}
