import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:votex/models/voting_model.dart';
import 'package:votex/theme/fonts.dart';

class CustomVCards extends StatelessWidget {
  final VotingModel? model;

  const CustomVCards({Key? key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    late String statusText;
    switch (this.model!.status) {
      case PollStatus.COMPLETED:
        statusText = 'Completed';
        break;
      case PollStatus.ONGOING:
        statusText = 'Ongoing';
        break;
      default:
        statusText = 'Not Started';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                children: [
                  Text(
                    this.model!.pollTitle,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Status: ',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '$statusText',
                        style: onGoingText,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: this
                              .model!
                              .contestants
                              .asMap()
                              .entries
                              .map((e) => _nameLabel(
                                  e.value, this.model!.tags![e.key], context))
                              .toList(),
                        ),
                      ),
                      Container(
                          height: devSize.height * .15,
                          width: devSize.width * .31,
                          child: _chart(this.model!))
                    ],
                  )
                ],
              )),
          // height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.16),
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(3, 3))
              ]),
          width: double.infinity),
    );
  }
}

Widget _nameLabel(String name, Color color, BuildContext context) => Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
        Container(
          child: Text(name,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.subtitle2),
        ),
      ],
    );

PieChart _chart(VotingModel model) {
  const image = 'assets/images/user_c.jpg';

  return PieChart(PieChartData(
      sections: model.values
          .asMap()
          .entries
          .map((e) => PieChartSectionData(
              badgeWidget: _badgeWidget(image),
              badgePositionPercentageOffset: .90,
              color: model.tags![e.key],
              showTitle: false,
              value: e.value))
          .toList(),
      sectionsSpace: 0,
      centerSpaceRadius: 15));
}

Widget _badgeWidget(String image) => Container(
      height: 20,
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
              image: AssetImage(
                image,
              ),
              fit: BoxFit.fitHeight)),
    );
