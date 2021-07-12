import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/ui/view_model/about_contestant_view_model.dart';

class AboutContestantView extends StatelessWidget {
  final Contestant contestant;
  const AboutContestantView(this.contestant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutContestantViewModel>.reactive(
        builder: (context, model, widget) {
          return ResponsiveBuilder(builder: (context, info) {
            if (info.isMobile) {
              return _MobileView(this.contestant, model);
            }

            //default view
            return _MobileView(this.contestant, model);
          });
        },
        viewModelBuilder: () => AboutContestantViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final Contestant contestant;
  final AboutContestantViewModel model;
  const _MobileView(this.contestant, this.model, {Key? key}) : super(key: key);

  Widget get _customPadding => SizedBox(
        height: 10,
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(3, 3))
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(this.contestant.imagePath!),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: model.goBack,
              )),
            ],
          )),
          Expanded(
              child: Container(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Full Name: ',
                        style: labelTextStyle(),
                      ),
                      Text(
                        this.contestant.name!,
                        style: normalText(),
                      ),
                    ],
                  ),
                  _customPadding,
                  Row(
                    children: [
                      Text(
                        'College: ',
                        style: labelTextStyle(),
                      ),
                      Text(
                        this.contestant.college!,
                        style: normalText(),
                      ),
                    ],
                  ),
                  _customPadding,
                  Row(
                    children: [
                      Text(
                        'Department: ',
                        style: labelTextStyle(),
                      ),
                      Text(
                        this.contestant.department!,
                        style: normalText(),
                      ),
                    ],
                  ),
                  _customPadding,
                  Row(
                    children: [
                      Text(
                        'Year: ',
                        style: labelTextStyle(),
                      ),
                      Text(
                        this.contestant.year.toString(),
                        style: normalText(),
                      ),
                    ],
                  ),
                  _customPadding,
                  Row(
                    children: [
                      Text(
                        'Hall of Affiliation: ',
                        style: labelTextStyle(),
                      ),
                      Text(
                        this.contestant.hall!,
                        style: normalText(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}

TextStyle labelTextStyle() => GoogleFonts.aladin(
    color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500);

TextStyle normalText() => GoogleFonts.aladin(
    color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300);
