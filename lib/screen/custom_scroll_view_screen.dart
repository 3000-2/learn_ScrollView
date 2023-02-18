import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('CustomScrollViewScreen'),
          ),
          // renderSliverChildList()
          // renderSliverChildBuilder()
          // renderSliverGridDefault()
          renderSliverGridBuilder()
        ],
      ),
    );
  }

  /*
  * 1. ListView 기본과 비슷
  * */
  SliverList renderSliverChildList() {
    return SliverList(
        delegate: SliverChildListDelegate(numbers
            .map((number) => renderContainer(
                color: rainbowColors[number % rainbowColors.length],
                index: number))
            .toList()));
  }

  /*
  * 2. SliverChild Builder
  * */
  SliverList renderSliverChildBuilder() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return renderContainer(
          color: rainbowColors[index % rainbowColors.length], index: index);
    }, childCount: numbers.length));
  }

  /*
  * 3. SliverGrid default
  * */
  SliverGrid renderSliverGridDefault() {
    return SliverGrid(
        delegate: SliverChildListDelegate(numbers
            .map((number) => renderContainer(
                color: rainbowColors[number % rainbowColors.length],
                index: number))
            .toList()),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));
  }

  /*
  * 4. SliverGrid Builder
  * */
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        }, childCount: numbers.length),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5));
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
