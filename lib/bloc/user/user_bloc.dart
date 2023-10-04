import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/models/user.dart';
import 'package:trivia/repository/auth_repository.dart';

part 'package:trivia/bloc/user/user_event.dart';
part 'package:trivia/bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepository _repository;
  UserBloc(this._repository): super(LoadUserState()){

    on<LoadingUserEvent>((event, emit) async {
      final user = await _repository.keepLogin();
      if(user != null) {
        emit(InAuthUserState(user));
      } else {
        emit(UnAuthUserState());
      }

    });

    on<SignInEvent>((event, emit) async {
      try {
        final user = await _repository.signIn(event.email, event.password);
        if(user != null) {
          emit(InAuthUserState(user));
        } else {
          emit(UnAuthUserState());
        }
      } on Exception catch (e) {
        emit(InErrorState(e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      try {
        await _repository.signUp(event.user);
        emit(UnAuthUserState());
      } on Exception catch (e) {
        emit(InErrorState(e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      await _repository.signOut();
      emit(UnAuthUserState());
    });
  }
}