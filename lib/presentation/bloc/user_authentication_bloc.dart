import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Authentication status enum
enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

// User model
class User extends Equatable {
  final String id;
  final String email;

  const User({
    required this.id,
    required this.email,
  });

  @override
  List<Object> get props => [id, email];
}

// State
class UserAuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;
  final String? errorMessage;

  const UserAuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
    this.errorMessage,
  });

  const UserAuthenticationState.unknown() : this._();

  const UserAuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const UserAuthenticationState.unauthenticated([String? errorMessage])
      : this._(
          status: AuthenticationStatus.unauthenticated,
          errorMessage: errorMessage,
        );

  @override
  List<Object?> get props => [status, user, errorMessage];

  UserAuthenticationState copyWith({
    AuthenticationStatus? status,
    User? user,
    String? errorMessage,
  }) {
    return UserAuthenticationState._(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Event
abstract class UserAuthenticationEvent extends Equatable {
  const UserAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends UserAuthenticationEvent {}

class LoginEvent extends UserAuthenticationEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends UserAuthenticationEvent {
  final String email;
  final String password;

  const RegisterEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends UserAuthenticationEvent {}

// Bloc
class UserAuthenticationBloc
    extends Bloc<UserAuthenticationEvent, UserAuthenticationState> {
  UserAuthenticationBloc() : super(const UserAuthenticationState.unknown()) {
    on<AppStartedEvent>(_onAppStarted);
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onAppStarted(
    AppStartedEvent event,
    Emitter<UserAuthenticationState> emit,
  ) async {
    // Check if user is already authenticated (e.g., from local storage)
    // For now, we'll just emit unauthenticated state
    emit(const UserAuthenticationState.unauthenticated());
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<UserAuthenticationState> emit,
  ) async {
    // Emit loading state
    // In a real app, you would make an API call here
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Validate inputs
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(const UserAuthenticationState.unauthenticated(
            'Email and password are required'));
        return;
      }

      // In a real app, you would validate credentials against a server
      // For demo purposes, we'll use a simple check
      if (event.email == 'test@example.com' && event.password == 'password') {
        final user = User(id: '1', email: event.email);
        emit(UserAuthenticationState.authenticated(user));
      } else {
        emit(const UserAuthenticationState.unauthenticated(
            'Invalid email or password'));
      }
    } catch (e) {
      emit(const UserAuthenticationState.unauthenticated(
          'An error occurred during login'));
    }
  }

  Future<void> _onRegister(
    RegisterEvent event,
    Emitter<UserAuthenticationState> emit,
  ) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Validate inputs
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(const UserAuthenticationState.unauthenticated(
            'Email and password are required'));
        return;
      }

      // In a real app, you would make an API call to register the user
      // For demo purposes, we'll just simulate successful registration
      final user = User(id: '1', email: event.email);
      emit(UserAuthenticationState.authenticated(user));
    } catch (e) {
      emit(const UserAuthenticationState.unauthenticated(
          'An error occurred during registration'));
    }
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<UserAuthenticationState> emit,
  ) async {
    // In a real app, you would clear any stored tokens or session data
    emit(const UserAuthenticationState.unauthenticated());
  }
}
