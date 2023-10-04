import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/models/category_trivia.dart';
import 'package:trivia/utils/enum/category.dart';
import 'package:trivia/utils/services/firebase_service.dart';

class SelectTextView extends StatefulWidget {
  final Function(CategoryTrivia? option) onChoose;

  const SelectTextView(
      {super.key, required this.onChoose});

  @override
  State<StatefulWidget> createState() => _SelectTextViewState();
}

class _SelectTextViewState extends State<SelectTextView> {
  late bool _isExpanded;
  late CategoryTrivia? chosen;
  @override
  void initState() {
    chosen = null;
    _isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryTrivia>>(future: FirebaseService().getAllCategories(), builder: (context,snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting) {
        return const LinearProgressIndicator();
      } else if(snapshot.hasData) {
        return DropdownButton(
            value: chosen,
            hint: const Text('Select'),
            items: snapshot.data!.map((value) => DropdownMenuItem<CategoryTrivia>(
              value: value,
              child: Text(value.sentence),
              onTap: () => chosen = value,
            ))
                .toList(),
            onChanged: (v) => setState(() {
              widget.onChoose.call(v);
            }));
      } else {
        return Text(snapshot.error?.toString() ?? 'An error has happend');
      }

    });
  }
}
