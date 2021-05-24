import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/ui/view_model/home_view_model.dart';

class CustomNavBar extends StatelessWidget {
  final HomeViewModel? model;
  final SizingInformation? info;
  final int firstIndex = 0;
  final int secondIndex = 1;
  final int thirdIndex = 2;
  final int fourthIndex = 3;
  final int fifthIndex = 4;

  const CustomNavBar({Key? key, @required this.info, @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => model!.setIndex(this.firstIndex),
              icon: Icon(Icons.explore_outlined),
              color: model!.currentIndex == this.firstIndex
                  ? primaryGreenColor
                  : mainfaintedColor,
              iconSize: model!.currentIndex == this.firstIndex ? 40 : 28,
            ),
            IconButton(
              onPressed: () => model!.setIndex(this.secondIndex),
              icon: Icon(Icons.search_rounded),
              color: model!.currentIndex == this.secondIndex
                  ? primaryGreenColor
                  : mainfaintedColor,
              iconSize: model!.currentIndex == this.secondIndex ? 40 : 28,
            ),
            IconButton(
              onPressed: () => model!.setIndex(this.thirdIndex),
              icon: Icon(Icons.bar_chart_rounded),
              color: model!.currentIndex == this.thirdIndex
                  ? primaryGreenColor
                  : mainfaintedColor,
              iconSize: model!.currentIndex == this.thirdIndex ? 40 : 28,
            ),
            IconButton(
              onPressed: () => model!.setIndex(this.fourthIndex),
              icon: Icon(Icons.settings_outlined),
              color: model!.currentIndex == this.fourthIndex
                  ? primaryGreenColor
                  : mainfaintedColor,
              iconSize: model!.currentIndex == this.fourthIndex ? 40 : 28,
            ),
            IconButton(
              onPressed: () => model!.setIndex(this.fifthIndex),
              icon: Icon(Icons.person_pin),
              color: model!.currentIndex == this.fifthIndex
                  ? primaryGreenColor
                  : mainfaintedColor,
              iconSize: model!.currentIndex == this.fifthIndex ? 40 : 28,
            )
          ],
        ),
        width: double.infinity,
        // height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 3,
                  offset: Offset(3, 3),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(.13)),
            ]),
      ),
    );
  }
}
