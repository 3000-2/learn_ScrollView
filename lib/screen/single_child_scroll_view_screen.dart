import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

class SingleChildScreenViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  SingleChildScreenViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'SingleChildScrollView', body: renderAlwaysScroll()
      // renderMany() // renderSimple()
      // renderAlwaysScroll()
      // renderClip()
      // renderPhysics()
    );
  }

  /*
  * 1. 기본
  * 화면이 넘어가면 스크롤
  * */
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors
            .map((Color color) => renderContainer(color: color))
            .toList(),
      ),
    );
  }

  /*
  * 2. 화면을 넘어가지 않아도 스크롤
  * */
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      // NeverScrollableScrollPhysics - 스크롤 안됌
      child: Column(
        children: [renderContainer(color: Colors.black)],
      ),
    );
  }

  /*
  * 3. 위젯이 잘리지 않게 하기
  * */
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [renderContainer(color: Colors.black)],
      ),
    );
  }

  /*
  * 4. 여러가지 Physics 정리
  * */
  Widget renderPhysics() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      // ClampingScrollPhysics() - 바운싱 x (안드로이드 스타일)
      // BouncingScrollPhysics() - 스크롤 끝날때 바운싱 (아이폰 스타일)
      // NeverScrollableScrollPhysics() - 스크롤 안됌
      // AlwaysScrollableScrollPhysics() - 스크롤 됌
      child: Column(
        children: rainbowColors
            .map((Color color) => renderContainer(color: color))
            .toList(),
      ),
    );
  }

  /*
  * 5. 매우 많이 그리기
  * ListView는 화면에 보이는 부분만 그리는데, 얘는 그냥 다 그린다.
  * */
  Widget renderMany() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map((number) =>
            renderContainer(
                color: rainbowColors[number % rainbowColors.length],
                index: number))
            .toList(),
      ),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    if (index != null) {
      print(index);
    }
    return Container(
      height: 300,
      color: color,
    );
  }
}
