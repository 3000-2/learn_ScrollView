import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({Key? key}) : super(key: key);

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'ReorderableListViewScreen',
        body: renderBuilder() //
      // renderDefault()
    );
  }

  Widget renderDefault() {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        print('oldIndex: $oldIndex newIndex: $newIndex');
        setState(() {
          // [red, orange, yellow]
          // [0, 1, 2]
          // red를 yellow 다음으로 옮긴다
          // red : 0(old) -> 3(new) onReorder는 옮기기 전의 index를 기준으로 함
          // [orange, yellow, red]
          //
          // [red, orange, yellow]
          // yellow를 red 앞으로 옮긴다
          // yellow : 2(old) -> 0(new)
          // [yellow, red, orange]

          if (oldIndex < newIndex) {
            newIndex--;
          }

          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
      },
      children: numbers
          .map((number) =>
          renderContainer(
              color: rainbowColors[number % rainbowColors.length],
              index: number))
          .toList(),
    );
  }

  Widget renderBuilder() {
    return ReorderableListView.builder(
        itemBuilder: (context, index) {
          final number = numbers[index];
          return renderContainer(
              color: rainbowColors[number % rainbowColors.length],
              index: number);
        },
        itemCount: numbers.length,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex--;
            }

            final item = numbers.removeAt(oldIndex);
            numbers.insert(newIndex, item);
          });
        });
  }

  Widget renderContainer({required Color color, int? index, double? height}) {
    if (index != null) {
      print(index);
    }
    return Container(
      key: Key(index.toString()),
      height: height == null ? 100 : height,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30.0),
        ),
      ),
    );
  }
}
