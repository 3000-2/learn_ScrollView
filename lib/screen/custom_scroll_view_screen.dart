import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final title = 'CustomScrollViewScreen';
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          // renderSliverChildList()
          // renderSliverChildBuilder()
          // renderSliverGridDefault()
          renderSliverGridBuilder()
        ],
      ),
    );
  }

  // Appbar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
      floating: true,
      // default false / true하면 위로 스크롤할 때 앱바 잠시 보이도록
      pinned: false,
      // default false / ture하면 앱바가 상단에 고정
      snap: true,
      // default false / floating과 같이 true해야함. 앱바가 보일 때 살짝만 내려도 자석처럼 동작
      stretch: true,
      // default false / 스크롤 할 때 앱바가 리스트에 딸려옴 (흰 배경 보이지 않게)
      expandedHeight: 210,
      // 여유 공간
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://picsum.photos/300/300',
          fit: BoxFit.cover,
        ),
        title: Text('FlexibleSpace'),
      ),
      // 여유 공간에 표시
      title: Text(title),
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
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3));
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
