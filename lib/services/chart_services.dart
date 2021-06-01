import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartService {
  static ChartService chartInstance = ChartService();

  Widget pieChart({bool hasBegun = false}) {
    return !hasBegun
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NameWithDots('Michael Abuah Yeboah'),
              _NameWithDots(
                'Michael Abuah Yeboah',
                tag: Colors.green,
              ),
              _NameWithDots(
                'Michael Abuah Yeboah',
                tag: Colors.red,
              ),
              _NameWithDots(
                'Michael Abuah Yeboah',
                tag: Colors.yellow,
              ),
            ],
          )
        : PieChart(PieChartData(
            sections: [
              PieChartSectionData(
                // showTitle: true,
                radius: 48,
                title: '48%',
                value: 48,
                badgePositionPercentageOffset: .98,
                badgeWidget: _Badge(),
                color: Colors.green,
              ),
              PieChartSectionData(
                // showTitle: true,
                title: '32%',
                value: 32,
                color: Colors.red,
                badgePositionPercentageOffset: .98,
                badgeWidget: _Badge(),
              ),
              PieChartSectionData(
                // showTitle: true,
                title: '20%',
                value: 20,
                color: Colors.yellow,
                badgePositionPercentageOffset: .98,
                badgeWidget: _Badge(),
              ),
            ],
            // centerSpaceColor: Colors.white,
            centerSpaceRadius: 40,
            // sectionsSpace: 0
          ));
  }
}

class _Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(
              width: 2, style: BorderStyle.solid, color: Colors.white),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.13))
          ],
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('assets/images/user.jpg'))),
    );
  }
}

class _NameWithDots extends StatelessWidget {
  final String name;
  final Color? tag;

  const _NameWithDots(this.name, {Key? key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: this.tag ?? Colors.grey, shape: BoxShape.circle),
          ),
          Text(this.name.toUpperCase())
        ],
      ),
    );
  }
}
