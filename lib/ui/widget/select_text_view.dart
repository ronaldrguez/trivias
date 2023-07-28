import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/utils/enum/category.dart';

class SelectTextView extends StatefulWidget {
  final Function(String? option) onChoose;

  const SelectTextView(
      {super.key, required this.onChoose});

  @override
  State<StatefulWidget> createState() => _SelectTextViewState();
}

class _SelectTextViewState extends State<SelectTextView> {
  late bool _isExpanded;
  late String chosen;
  late List<String> items;
  @override
  void initState() {
    chosen = 'Select';
    items = CategoryEnum.getAllCategories;
    _isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: chosen,
        items: items
            .map((value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  onTap: () => chosen = value,
                ))
            .toList(),
        onChanged: (v) => setState(() {
              widget.onChoose.call(v);
            }));
  }
}
