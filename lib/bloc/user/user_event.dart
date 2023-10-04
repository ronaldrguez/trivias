part of 'user_bloc.dart';

abstract class UserEvent {}

class SignInEvent extends UserEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);

}

class LoadingUserEvent extends UserEvent {

}

class SignOutEvent extends UserEvent {

}

class SignUpEvent extends UserEvent {
  final User user;

  SignUpEvent(this.user);
}