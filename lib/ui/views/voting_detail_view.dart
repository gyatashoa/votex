import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/providers/subscriptions_provider.dart';
import 'package:votex/theme/btn_styles.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/voting_detail_view_model.dart';
import 'package:votex/ui/widgets/animation_widgets.dart';
import 'package:votex/ui/widgets/pie_chart.dart';
import 'package:votex/utils/color_tags.dart';

class VotingDetailView extends StatelessWidget {
  final String id;
  const VotingDetailView(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VotingDetailViewModel>.reactive(
        builder: (ctx, model, widget) {
          return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: model.getVotingDataModel(VotingDataModel, this.id),
              builder: (_,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Scaffold(
                      appBar: AppBar(),
                      body: Center(child: LottieLoadingAnimation()));
                if (snapshot.hasError)
                  return Scaffold(
                      appBar: AppBar(), body: Center(child: LottieErrorPage()));
                if (!snapshot.hasData)
                  return Scaffold(
                      appBar: AppBar(),
                      body: Center(child: LottieLoadingAnimation()));
                return ResponsiveBuilder(builder: (_, info) {
                  if (info.isMobile)
                    return _MobileView(
                        model, model.convertData(snapshot.data!));
                  return _MobileView(model, model.convertData(snapshot.data!));
                });
              });
        },
        viewModelBuilder: () => VotingDetailViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final VotingDetailViewModel model;
  final VotingDataModel data;
  const _MobileView(this.model, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasEnded = DateTime.now().isAfter(this.data.endTime!);
    bool hasNotStarted = DateTime.now().isBefore(this.data.startTime!);
    final devSize = MediaQuery.of(context).size;
    int numberOfVoters = 0;
    this.data.contestants!.forEach((element) {
      numberOfVoters += element.votes!.length;
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: model.goBack,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 4,
        title: Text(
          this.data.title!,
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [
          (!hasNotStarted && !hasEnded)
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
              : (hasNotStarted
                  ? AvatarGlow(
                      showTwoGlows: true,
                      duration: Duration(milliseconds: 2000),
                      repeat: true,
                      repeatPauseDuration: Duration(milliseconds: 100),
                      glowColor: Colors.yellow,
                      endRadius: 25,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.yellow,
                      ),
                    )
                  : AvatarGlow(
                      showTwoGlows: true,
                      duration: Duration(milliseconds: 2000),
                      repeat: true,
                      repeatPauseDuration: Duration(milliseconds: 100),
                      glowColor: Colors.blue,
                      endRadius: 25,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.blue,
                      ),
                    )),
          Consumer<SubscriptionsProvider>(builder: (_, value, __) {
            bool isSubcribed = value.getSubscriptions
                .where((element) => this.data.id == element.id)
                .isNotEmpty;
            return IconButton(
                onPressed: isSubcribed
                    ? () async {
                        value.removeSubscription(data);
                        await model.unsubscribe(value.getIdInNumbers(data));
                      }
                    : () async {
                        value.subscriptions = data;
                        await model.subscribe(data, value.getIdInNumbers(data));
                      },
                icon: Icon(
                  isSubcribed
                      ? Icons.notifications_off_rounded
                      : Icons.notification_add,
                  color: Colors.green,
                ));
          })
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  numberOfVoters == 0
                      ? Container()
                      : Container(
                          padding: EdgeInsets.only(top: 40),
                          height: 200,
                          child: PieChartWidget(
                            model: this.data,
                            numberOfVoters: numberOfVoters,
                          ),
                        ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: this
                        .data
                        .contestants!
                        .asMap()
                        .entries
                        .map((e) => ListTile(
                              onTap: () =>
                                  model.navigateToAboutContestant(e.value),
                              leading: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(e.value.imagePath!))),
                              ),
                              title: Text(
                                e.value.name!,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              subtitle: Text(
                                '${e.value.votes!.length} votes',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              trailing: CircleAvatar(
                                  radius: 18,
                                  child: Text(
                                    numberOfVoters == 0
                                        ? "0%"
                                        : '${((e.value.votes!.length * 100) / numberOfVoters).roundToDouble()}%',
                                    style: smallWhiteText,
                                  ),
                                  backgroundColor: colorTags[e.key]),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Total Votes: $numberOfVoters',
                    style: boldBlackMediumText,
                  )
                ],
              ),
            )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: devSize.width * .095, vertical: 40),
                  child: TextButton(
                    style: btnGreen.style,
                    onPressed: () => model.onVotePressed(data, context),
                    child: Text(
                      'VOTE',
                      style: whiteBtnText,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
