import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:votex/theme/fonts.dart';

class CustomVCards extends StatelessWidget {
  final String? pollTitle;

  const CustomVCards({Key? key, this.pollTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                children: [
                  Text(
                    this.pollTitle!,
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
                        'Ongoing',
                        style: onGoingText,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _nameLabel(
                                'Micheal Abuah Yeboah', Colors.red, context),
                            _nameLabel(
                                'Micheal Abuah Yeboah', Colors.yellow, context),
                            _nameLabel(
                                'Micheal Abuah Yeboah', Colors.blue, context),
                            _nameLabel(
                                'Micheal Abuah Yeboah', Colors.black, context),
                          ],
                        ),
                      ),
                      Container(
                          height: devSize.height * .15,
                          width: devSize.width * .31,
                          child: _chart())
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
              style: Theme.of(context).textTheme.bodyText1),
        ),
      ],
    );

PieChart _chart() {
  const image = 'assets/images/user_c.jpg';
  return PieChart(PieChartData(sections: [
    PieChartSectionData(
        badgeWidget: _badgeWidget(image),
        badgePositionPercentageOffset: .90,
        color: Colors.red,
        showTitle: false,
        value: 58),
    PieChartSectionData(
        badgeWidget: _badgeWidget(image),
        badgePositionPercentageOffset: .90,
        color: Colors.yellow,
        showTitle: false,
        value: 22),
    PieChartSectionData(
        badgeWidget: _badgeWidget(image),
        badgePositionPercentageOffset: .90,
        color: Colors.blue,
        showTitle: false,
        value: 15),
    PieChartSectionData(
        badgeWidget: _badgeWidget(image),
        badgePositionPercentageOffset: .90,
        color: Colors.black,
        showTitle: false,
        value: 5),
  ], sectionsSpace: 0, centerSpaceRadius: 15));
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
