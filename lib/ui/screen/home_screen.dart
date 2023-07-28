import 'package:app_navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/bloc/ranking/ranking_bloc.dart';
import 'package:trivia/bloc/trivia/trivia_bloc.dart';
import 'package:trivia/ui/screen/trivia_form_screen.dart';
import 'package:trivia/ui/widget/dialog_widget.dart';
import 'package:trivia/ui/widget/ranking_list_widget.dart';
import 'package:trivia/ui/widget/select_text_view.dart';
import 'package:trivia/utils/enum/category.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String choice = 'Select';
  late TriviaBloc bloc;

  @override
  void initState() {
    bloc = context.read<TriviaBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking'),
      ),
      body: BlocBuilder<RankingBloc, RankingState>(
        bloc: context.read<RankingBloc>(),
        builder: (context, state) {
          if(state is InRankingState){
            return RankingList(trivias: state.trivias, users: state.users);
          } else if (state is ErrorRankingState){
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startTrivia,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _startTrivia() {
    DialogService.chooseCategory(context, title: 'Choose category of trivia', content: SelectTextView(onChoose: (value)=> choice = value ?? 'Select'), onAccepted: () {
      if(choice != CategoryEnum.select.value) {
        bloc.add(LoadingTriviaEvent(category: choice));
        AppNavigator().push(TriviaFormScreen(category: choice,), name: 'trivia_form');
      } /*else {
        DialogService.showInfo(context, title: 'Alert', content: const Text('You must choose a category'));
      }*/
    },);
  }
}