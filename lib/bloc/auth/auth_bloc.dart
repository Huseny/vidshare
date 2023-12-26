import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vid_share/bloc/auth/auth_events.dart';
import 'package:vid_share/bloc/auth/auth_states.dart';
import 'package:vid_share/repository/auth/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final int delay = 5;
  final AuthRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginInitial()) {
    on<LoadLogin>((event, emit) {
      emit(const LoginInitial());
    });

    on<LogIn>((event, emit) async {
      if (state is LoginLoading) return;
      emit(const LoginLoading());
      Future.delayed(Duration(seconds: delay));
      try {
        debugPrint("Trying to login");
      } catch (error) {
        emit(LoginFailure(error: error));
      }
    });

    on<Logout>(
      (event, emit) async {
        if (state is LogOutLoading) return;
        emit(LogOutLoading());
        Future.delayed(Duration(seconds: delay));
        try {
          debugPrint("Trying to logout");
          emit(LogOutSuccess());
          emit(const LoginInitial());
        } catch (error) {
          emit(LogOutFailure(error: error));
        }
      },
    );
  }
}
