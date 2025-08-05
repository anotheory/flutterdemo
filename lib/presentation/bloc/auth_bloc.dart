import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/domain/entities/user_entity.dart';
import 'package:myapp/domain/usecases/authenticate_user.dart';
import 'package:myapp/domain/usecases/register_user.dart';
import 'package:myapp/domain/usecases/verify_token.dart';

// Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  
  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const RegisterEvent({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [email, password, firstName, lastName];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class VerifyTokenEvent extends AuthEvent {
  final String token;

  const VerifyTokenEvent({required this.token});

  @override
  List<Object> get props => [token];
}

class LogoutEvent extends AuthEvent {}

// States
abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String token;
  final UserEntity? user;

  const AuthAuthenticated({
    required this.token,
    this.user,
  });

  @override
  List<Object?> get props => [token, user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUser registerUseCase;
  final AuthenticateUser authenticateUseCase;
  final VerifyToken verifyTokenUseCase;

  AuthBloc({
    required this.registerUseCase,
    required this.authenticateUseCase,
    required this.verifyTokenUseCase,
  }) : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
    on<VerifyTokenEvent>(_onVerifyToken);
    on<LogoutEvent>(_onLogout);
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    final result = await registerUseCase(RegisterParams(
      email: event.email,
      password: event.password,
      firstName: event.firstName,
      lastName: event.lastName,
    ));

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (authResult) {
        if (authResult.success && authResult.token != null) {
          emit(AuthAuthenticated(
            token: authResult.token!,
            user: authResult.user,
          ));
        } else {
          emit(AuthError(message: authResult.message));
        }
      },
    );
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    final result = await authenticateUseCase(AuthenticateParams(
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (authResult) {
        if (authResult.success && authResult.token != null) {
          emit(AuthAuthenticated(
            token: authResult.token!,
            user: authResult.user,
          ));
        } else {
          emit(AuthError(message: authResult.message));
        }
      },
    );
  }

  void _onVerifyToken(VerifyTokenEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    final result = await verifyTokenUseCase(VerifyTokenParams(
      token: event.token,
    ));

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (authResult) {
        if (authResult.success) {
          emit(AuthAuthenticated(
            token: event.token,
            user: authResult.user,
          ));
        } else {
          emit(AuthUnauthenticated());
        }
      },
    );
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) {
    emit(AuthUnauthenticated());
  }
}