import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:votex/models/voting_model.dart';

class PieChartWidget extends StatelessWidget {
  final VotingModel? model;
  const PieChartWidget({@required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
        sections: model!.values
            .asMap()
            .entries
            .map((e) => PieChartSectionData(
                title: '${e.value.round()}%',
                badgePositionPercentageOffset: .90,
                color: model!.tags![e.key],
                showTitle: true,
                value: e.value))
            .toList(),
        sectionsSpace: 0,
        centerSpaceRadius: 60));
    ;
  }
}
