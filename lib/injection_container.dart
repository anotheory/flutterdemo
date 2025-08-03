import 'package:get_it/get_it.dart';
import 'package:myapp/presentation/bloc/app_state.dart';

final sl = GetIt.instance;

Future<void> injectionInit() async {
  sl.registerFactory<AppState>(() => AppState(
    
  ));
}