import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/providers/current_voting_data_models.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/discover_view_model.dart';
import 'package:votex/ui/widgets/animation_widgets.dart';
import 'package:votex/ui/widgets/custom_vote_cards.dart';

class DiscoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    final provider = Provider.of<CurrentVotingDataModelProvider>(context);
    return ViewModelBuilder<DiscoverViewModel>.reactive(
        builder: (context, model, widget) {
          return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: model.stream,
              builder: (_,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: LottieLoadingAnimation());
                if (snapshot.hasError)
                  return Column(
                    children: [
                      LottieErrorPage(),
                    ],
                  );

                if (snapshot.data!.docs.length == 0)
                  return Center(
                      child: Column(
                    children: [
                      LottieEmptyBox(),
                      Text(
                        "No Data Available",
                        style: mediumHeaderText,
                      )
                    ],
                  ));
                provider.currentVotingDataModel =
                    model.convert(snapshot.data!.docs);
                return Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                        children: model
                            .convert(snapshot.data!.docs)
                            .map((e) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: devSize.width * .07),
                                  child: InkWell(
                                      onTap: () {
                                        model.navigateToDetail(e);
                                      },
                                      child: CustomVCards(model: e)),
                                ))
                            .toList()),
                  ),
                );
              });
        },
        viewModelBuilder: () => DiscoverViewModel());
  }
}
