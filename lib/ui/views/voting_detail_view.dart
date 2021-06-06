import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/models/voting_model.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/voting_detail_view_model.dart';
import 'package:votex/ui/widgets/pie_chart.dart';

class VotingDetailView extends StatelessWidget {
  final VotingModel dataModel;
  const VotingDetailView(this.dataModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VotingDetailViewModel>.nonReactive(
        builder: (ctx, model, widget) {
          return ResponsiveBuilder(builder: (_, info) {
            if (info.isMobile) return _MobileView(model, dataModel);
            return _MobileView(model, dataModel);
          });
        },
        viewModelBuilder: () => VotingDetailViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final VotingDetailViewModel model;
  final VotingModel data;
  const _MobileView(this.model, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: model.goBack,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 4,
          title: Text(
            this.data.pollTitle,
            style: Theme.of(context).textTheme.headline3,
          ),
          actions: [
            this.data.status == PollStatus.ONGOING
                ? AvatarGlow(
                    showTwoGlows: true,
                    duration: Duration(milliseconds: 2000),
                    repeat: true,
                    repeatPauseDuration: Duration(milliseconds: 100),
                    glowColor: Theme.of(context).primaryColor,
                    endRadius: 25.0,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: devSize.width * .095, vertical: 40),
                    child: TextButton(
                      onPressed: model.onVotePressed,
                      child: Text(
                        'VOTE',
                        style: GoogleFonts.montserrat(color: Colors.white),
                      ),
                    ),
                  )),
              Positioned.fill(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      height: 200,
                      child: PieChartWidget(
                        model: this.data,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: this
                          .data
                          .contestants
                          .asMap()
                          .entries
                          .map((e) => ListTile(
                                leading: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/user_c.jpg'))),
                                ),
                                title: Text(
                                  e.value,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                subtitle: Text(
                                  '12,556 votes',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                trailing: CircleAvatar(
                                  radius: 18,
                                  child: Text(
                                    '${this.data.values[e.key]}%',
                                    style: smallWhiteText,
                                  ),
                                  backgroundColor: this.data.tags![e.key],
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total Votes: 28,685',
                      style: boldBlackMediumText,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
