import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/models/voting_model.dart';
import 'package:votex/ui/view_model/voting_detail_view_model.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: model.goBack,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 2,
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
        body: Container(),
      ),
    );
  }
}
