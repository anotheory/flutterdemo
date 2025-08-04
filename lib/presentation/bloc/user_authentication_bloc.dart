import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserAuthenticationState extends Equatable {
  final bool isRegister;
  final bool isLogin;
  const UserAuthenticationState({ required this.isRegister, required this.isLogin });

  @override
  List<Object> get props => [isRegister, isLogin];

  UserAuthenticationState cloneWith([bool? isRegister, bool? isLogin]) {
    return UserAuthenticationState(isRegister: isRegister ?? this.isRegister, isLogin: isLogin ?? this.isLogin);
  }
}

@immutable
class UserAuthenticationEvent {
  
}

class UserAuthenticationBloc extends Bloc<UserAuthenticationEvent, UserAuthenticationState> {
  UserAuthenticationBloc() : super(UserAuthenticationState(isRegister: false, isLogin: false)) {
    on<UserAuthenticationEvent>(checkIsLogin);
  }

  Future<void> checkIsLogin(UserAuthenticationEvent event, Emitter<UserAuthenticationState> emit) async {
    emit(UserAuthenticationState(isRegister: false, isLogin: false));
  }
}