import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoadLogin extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LogIn extends LoginEvent {
  final String phoneNumber;

  const LogIn({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class Logout extends LoginEvent {
  @override
  List<Object?> get props => [];
}
