import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/bloc/trivia/trivia_bloc.dart';
import 'package:trivia/ui/screen/complete_screen.dart';
import 'package:trivia/ui/widget/trivia_form_widget.dart';

class TriviaFormScreen extends StatefulWidget {
  final String category;
  const TriviaFormScreen({super.key, required this.category});


  @override
  State<StatefulWidget> createState() => _TriviaFormScreenState();
}

class _TriviaFormScreenState extends State<TriviaFormScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TriviaBloc, TriviaState>(
      bloc: context.read<TriviaBloc>(),
      builder: (context, state) {
        if(state is InTriviaState) {
          return Scaffold(
            appBar: AppBar(title: Text('Trivia of ${widget.category}'),),
            body: TriviaFormWidget(trivia: state.trivia, index: state.index,),
          );
        } else if(state is LoadTriviaState) {
          return Scaffold(
            appBar: AppBar(title: Text('Trivia of ${widget.category}'),),
            body: const Center(child: CircularProgressIndicator(),),
          );
        } else if(state is CompleteTriviaState) {
          return CompleteScreen(trivia: state.trivia,);
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('Trivia of ${widget.category}'),),
            body: const Center(child: Text('An error has happens'),),
          );
        }
      },
    );
  }

}