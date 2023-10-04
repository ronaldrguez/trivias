import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/bloc/ranking/ranking_bloc.dart';
import 'package:trivia/bloc/trivia/trivia_bloc.dart';
import 'package:trivia/bloc/user/user_bloc.dart';
import 'package:trivia/provider/online/auth_online_provider.dart';
import 'package:trivia/provider/online/trivia_online_provider.dart';
import 'package:trivia/repository/auth_repository.dart';
import 'package:trivia/repository/ranking_repository.dart';
import 'package:trivia/repository/trivia_repository.dart';
import 'package:trivia/ui/screen/home_screen.dart';
import 'package:trivia/ui/screen/login_screen.dart';
import 'package:trivia/utils/navigation_widget.dart';
import 'package:trivia/utils/services/firebase_service.dart';
import 'package:trivia/utils/theme/theme_manager.dart';
import 'package:trivia/utils/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class AppPage extends Page {
  const AppPage({required String name}) : super(name: name);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const MyApp(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    context.read<RankingBloc>().add(LoadingRankingEvent());
    return BlocBuilder<UserBloc, UserState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is UnAuthUserState) {
            return const LoginScreen();
          } else if (state is InAuthUserState) {
            return const MyHomePage();
          } else {
            bloc.add(LoadingUserEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    return super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseService.init(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()),);
        } else if(snapshot.connectionState == ConnectionState.done){
          return ScreenUtilInit(
            designSize: const Size(370, 640),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, _) => MultiBlocProvider(
              providers: [
                BlocProvider<UserBloc>(
                    create: (_) => UserBloc(
                        const AuthRepository(provider: AuthOnlineProvider()))),
                BlocProvider<RankingBloc>(
                    create: (_) => RankingBloc(const RankingRepository())),
                BlocProvider<TriviaBloc>(
                  create: (_) => TriviaBloc(
                      const TriviaRepository(provider: TriviaOnlineProvider())),
                )
              ],
              child: MaterialApp(
                title: 'Trivia Game',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: _themeManager.themeMode,
                home: const NavigationWidget(),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator(),);

      },
    );
  }
}
