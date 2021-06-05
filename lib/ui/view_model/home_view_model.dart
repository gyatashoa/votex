import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final ScrollController mainScrollController = ScrollController();

  // final ScrollController mainScrollController = ScrollController();
  // void init(HomeViewModel _) {
  //   mainScrollController.addListener(() {});
  //   print(mainScrollController.offset);
  // }

  // double initOffset = 0;

  // void listen() async {
  //   mainScrollController.addListener(() {
  //     if (this.initOffset < mainScrollController.offset) {
  //       initOffset = mainScrollController.offset;
  //       print(initOffset);
  //     } else {
  //       initOffset = mainScrollController.offset;
  //       print(initOffset);
  //     }
  //   });
  // }

  // double getOpacity() {
  //   double opacity = mainScrollController.offset - initOffset;
  //   if (opacity > 1) opacity = 1;
  //   initOffset = mainScrollController.offset;
  //   return opacity;
  // }
}
