import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

class RefreshIndicatorScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  RefreshIndicatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'RefreshIndicatorScreen',
      body: RefreshIndicator(
        onRefresh: () async {
          print('onRefresh');
          await Future.delayed(Duration(microseconds: 1));
        },
        child: ListView(
          children: numbers
              .map((number) => renderContainer(
                  color: rainbowColors[number % rainbowColors.length],
                  index: number))
              .toList(),
        ),
      ),
    );
  }

  Widget renderContainer({required Color color, int? index, double? height}) {
    if (index != null) {
      print(index);
    }
    return Container(
      height: height == null ? 300 : height,
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
