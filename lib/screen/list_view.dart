import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'ListViewScreen',
        body: renderSeparated()
      // renderDefault()
      //  renderBuilder()
    );
  }

  /*
  * 1. SingleChildScrollView와 비슷하게 동작
  * */
  Widget renderDefault() {
    return ListView(
      children: numbers
          .map((number) =>
          renderContainer(
              color: rainbowColors[number % rainbowColors.length],
              index: number))
          .toList(),
    );
  }

  /*
  * 2. builder 화면에 보이는 것보다 조금 더 그림
  * */
  Widget renderBuilder() {
    return ListView.builder(
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
    );
  }

  /*
  * 3. separated builder와 똑같이 동작하지만 separated가 추가
  * */
  Widget renderSeparated() {
    return ListView.separated(
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        index += 1;
        if (index % 5 == 0) {
          return renderContainer(color: Colors.black, index: index, height: 50);
        }
        return Container();
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
