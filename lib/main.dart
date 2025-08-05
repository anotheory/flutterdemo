import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:myapp/presentation/bloc/auth_bloc.dart';
import 'package:myapp/presentation/pages/login/user_login_server_page.dart';
import 'package:myapp/presentation/pages/main_page.dart';
import 'package:myapp/presentation/pages/register/user_register_server_page.dart';
import 'package:provider/provider.dart';

import 'core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.injectionInit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<AppState>()),
        BlocProvider<AuthBloc>(create: (context) => di.sl<AuthBloc>()),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF90D3FF)),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthWrapper(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Check if there's a stored token on app start
    _checkInitialAuthState();
  }

  void _checkInitialAuthState() {
    // You can check stored token here and verify it
    // For now, we'll assume unauthenticated initially
    // If you have a stored token, you can dispatch VerifyTokenEvent

    // Example: if you have a stored token
    // final storedToken = await SharedPreferences.getInstance().getString('token');
    // if (storedToken != null) {
    //   context.read<AuthBloc>().add(VerifyTokenEvent(token: storedToken));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Handle navigation based on auth state changes
        if (state is AuthAuthenticated) {
          Navigator.of(context).pushReplacementNamed('/main');
        } else if (state is AuthUnauthenticated) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is AuthAuthenticated) {
            return const MainPage();
          } else if (state is AuthUnauthenticated || state is AuthError) {
            return const LoginPage();
          } else {
            // AuthInitial state - show login by default
            return const LoginPage();
          }
        },
      ),
    );
  }
}
