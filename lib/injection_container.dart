import 'package:get_it/get_it.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:myapp/presentation/bloc/user_authentication_bloc.dart';

final sl = GetIt.instance;

Future<void> injectionInit() async {
  sl.registerFactory<AppState>(() => AppState());
  sl.registerFactory<UserAuthenticationBloc>(() => UserAuthenticationBloc());
}