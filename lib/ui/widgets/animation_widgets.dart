import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:votex/utils/animationPath.dart';

class LottieLoadingAnimation extends StatelessWidget {
  const LottieLoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      loading,
      repeat: true,
    );
  }
}

class LottieBallotBox extends StatelessWidget {
  const LottieBallotBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(ballot_box, repeat: true);
  }
}

class LottieEmptyBox extends StatelessWidget {
  const LottieEmptyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      empty_box,
      repeat: false,
    );
  }
}

class LottieNoData extends StatelessWidget {
  const LottieNoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(no_data, repeat: true);
  }
}

class LottieErrorPage extends StatelessWidget {
  const LottieErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(error_page, repeat: true);
  }
}
