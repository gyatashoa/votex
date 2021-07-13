import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/utils/color_tags.dart';

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
            .asMap()
            .entries
            .map((e) => PieChartSectionData(
                badgeWidget: _badgeWidget(e.value.imagePath!),
                titleStyle: GoogleFonts.montserrat(fontSize: 13),
                title: numberOfVoters == 0
                    ? '0%'
                    : '${((e.value.votes!.length * 100) / numberOfVoters!).toInt()}%',
                badgePositionPercentageOffset: 1.3,
                color: colorTags[e.key],
                showTitle: true,
                value: e.value.votes!.length.toDouble()))
            .toList(),
        sectionsSpace: 0,
        centerSpaceRadius: 60));
  }

  Widget _badgeWidget(String image) => Container(
        height: 30,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 2)
            ],
            image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.fitHeight)),
      );
}
