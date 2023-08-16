import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/bloc/user/user_bloc.dart';
import 'package:trivia/models/user.dart';
import 'package:trivia/repository/auth_repository.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main () {
  late UserBloc sut;
  late AuthRepository repo;

  group('User Bloc Test', () {

    setUp((){
      repo = MockAuthRepository();
      sut = UserBloc(repo);
    });
    
    test('Initial Test', () => expect(sut.state, LoadUserState()));

    blocTest<UserBloc, UserState>('When an user is not previously login return UnAuthUserState',
        build: () => sut,
      act: (bloc) {
      when(repo.keepLogin()).thenAnswer((_) async => null);
        bloc.add(LoadingUserEvent());
      },
      expect: () => <UserState>[UnAuthUserState()]
    );

    blocTest<UserBloc, UserState>('When an user is previously login return InAuthUserState',
        build: () => sut,
        act: (bloc) {
          const user = User( id: 'asdq1', name: 'Ronald', userName: 'rrreyes', password: '1234', results: []);
          when(repo.keepLogin()).thenAnswer((_) async => user);
          bloc.add(LoadingUserEvent());
        },
        expect: () => <UserState>[InAuthUserState(const User( id: 'asdq1', name: 'Ronald', userName: 'rrreyes', password: '1234', results: []))]
    );

    blocTest<UserBloc, UserState>('If an user is login right it should return InAuthUserState',
        build: () => sut,
        act: (bloc) {
          const user = User( id: 'asdq1', name: 'Ronald', userName: 'rrreyes', password: '1234', results: []);
          when(repo.signIn('rrreyes', '1234')).thenAnswer((_) async => user);
          bloc.add(SignInEvent('rrreyes', '1234'));
        },
        expect: () => <UserState>[InAuthUserState(const User( id: 'asdq1', name: 'Ronald', userName: 'rrreyes', password: '1234', results: []))]
    );

    blocTest<UserBloc, UserState>('If an user is login wrong it should return UnAuthUserState',
        build: () => sut,
        act: (bloc) {
          when(repo.signIn('rrreyes', '1234')).thenAnswer((_) async => null);
          bloc.add(SignInEvent('rrreyes', '1234'));
        },
        expect: () => <UserState>[UnAuthUserState()]
    );

    blocTest<UserBloc, UserState>('If an user is signOut right it should return UnAuthUserState',
        build: () => sut,
        act: (bloc) {
          when(repo.signOut()).thenAnswer((_) async => true);
          bloc.add(SignOutEvent());
        },
        expect: () => <UserState>[UnAuthUserState()]
    );

    blocTest<UserBloc, UserState>('If an user is signUp right it should return UnAuthUserState',
        build: () => sut,
        act: (bloc) {
          const user = User( id: 'asdq1', name: 'Ronald', userName: 'rrreyes', password: '1234', results: []);
          when(repo.signUp(user)).thenAnswer((_) async => true);
          bloc.add(SignUpEvent(user));
        },
        expect: () => <UserState>[UnAuthUserState()]
    );
  });
}