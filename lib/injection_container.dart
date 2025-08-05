import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:myapp/core/network/network_info.dart';
import 'package:myapp/data/datasources/auth_remote_data_source.dart';
import 'package:myapp/data/datasources/auth_remote_data_source_impl.dart';
import 'package:myapp/data/models/generated/lib/data/protos/user.pbgrpc.dart';
import 'package:myapp/data/repositories/auth_repository_impl.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';
import 'package:myapp/domain/usecases/authenticate_user.dart';
import 'package:myapp/domain/usecases/register_user.dart';
import 'package:myapp/domain/usecases/verify_token.dart';
import 'package:myapp/presentation/bloc/app_state.dart';
import 'package:myapp/presentation/bloc/auth_bloc.dart';
import 'package:myapp/presentation/bloc/user_authentication_bloc.dart';

final sl = GetIt.instance;

Future<void> injectionInit() async {
  sl.registerFactory<AppState>(() => AppState());
  sl.registerFactory<UserAuthenticationBloc>(() => UserAuthenticationBloc());

   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // BLoC
  sl.registerFactory(
    () => AuthBloc(
      registerUseCase: sl(),
      authenticateUseCase: sl(),
      verifyTokenUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => AuthenticateUser(sl()));
  sl.registerLazySingleton(() => VerifyToken(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton<UserAuthenticationClient>(() {
    final channel = ClientChannel(
      // '10.0.2.2', // Android
      // '172.18.104.117',
      'localhost',
      port: 5080,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    return UserAuthenticationClient(channel);
  });
}
