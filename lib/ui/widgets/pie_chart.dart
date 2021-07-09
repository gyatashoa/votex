import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:votex/models/voting_data_model.dart';

class PieChartWidget extends StatelessWidget {
  final VotingDataModel? model;
  final int? numberOfVoters;
  const PieChartWidget(
      {@required this.model, @required this.numberOfVoters, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
        sections: model!.contestants!
            .map((e) => PieChartSectionData(
                title: numberOfVoters == 0
                    ? '0%'
                    : '${(e.votes!.length.toDouble() / numberOfVoters!.toDouble()).toStringAsFixed(2) * 100}%',
                badgePositionPercentageOffset: .90,
                //TODO: Will have to implement color tag here
                color: Colors.red,
                showTitle: true,
                value: e.votes!.length.toDouble()))
            .toList(),
        sectionsSpace: 0,
        centerSpaceRadius: 60));
    ;
  }
}
