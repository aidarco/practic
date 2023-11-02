part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SuccesLoginEvent extends LoginEvent
{
  final String email;
  final String password;
  SuccesLoginEvent({required this.email, required this.password});

}