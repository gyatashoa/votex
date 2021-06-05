import 'package:flutter/material.dart';

class FadeOnScroll extends StatefulWidget {
  final ScrollController? scrollController;
  final Widget? child;
  final double? appBarHeight;
  final bool isForNavBar;

  FadeOnScroll({
    this.isForNavBar = false,
    @required this.appBarHeight,
    @required this.scrollController,
    @required this.child,
  });

  @override
  _FadeOnScrollState createState() => _FadeOnScrollState();
}

class _FadeOnScrollState extends State<FadeOnScroll> {
  double? _offset;

  @override
  initState() {
    super.initState();
    _offset = widget.scrollController!.offset;
    widget.scrollController!.addListener(_setOffset);
  }

  @override
  dispose() {
    widget.scrollController!.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    setState(() {
      _offset = widget.scrollController!.offset;
    });
  }

  double initOffset = 0;

  double _getOpacity() {
    var val =
        (this.widget.appBarHeight! - _offset!) / this.widget.appBarHeight!;
    if (val.isNegative) val = 0;
    if (val > 1) val = 1;
    if (this.widget.isForNavBar && val < .4) val = .35;
    if (this.widget.isForNavBar &&
        (this.initOffset > this.widget.scrollController!.offset)) val = 1;
    initOffset = this.widget.scrollController!.offset;
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _getOpacity(),
      child: widget.child,
    );
  }
}
