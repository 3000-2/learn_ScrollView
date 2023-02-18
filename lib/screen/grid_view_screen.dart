import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'GridViewScreen', body: renderBuilderCrossAxiosCount()
        // renderMaxExtent()
        // renderBuilderCrossAxiosCount()
        // renderCount()
        );
  }

  /*
  * 1. 전부 그린다.
  * */
  Widget renderCount() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      children: numbers
          .map((number) => renderContainer(
              color: rainbowColors[number % rainbowColors.length],
              index: number))
          .toList(),
    );
  }

  /*
  * 2. 화면에 보이는 부분만 그린다.
  * */
  Widget renderBuilderCrossAxiosCount() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12.0, mainAxisSpacing: 12.0),
      itemBuilder: (BuildContext context, int index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
    );
  }

  /*
  * 3. 최대 사이즈에 맞춰서 그린다.
  * */
  Widget renderMaxExtent() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
      itemBuilder: (BuildContext context, int index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
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
