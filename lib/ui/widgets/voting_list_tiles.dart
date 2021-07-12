import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/providers/recent_voting_searches_provider.dart';
import 'package:votex/providers/subscriptions_provider.dart';
import 'package:votex/theme/fonts.dart';

class BuildVotingListTiles extends StatelessWidget {
  final List<VotingDataModel> dataModel;
  final bool shouldHighlightSome;
  final bool shouldUpdateRecentSearchesProvider;
  final String? query;
  final bool swipeable;
  final Function(VotingDataModel) onTileTap;
  final Function(VotingDataModel)? onDismiss;
  const BuildVotingListTiles(this.dataModel, this.onTileTap,
      {Key? key,
      this.query,
      this.shouldHighlightSome = false,
      this.swipeable = false,
      this.onDismiss,
      this.shouldUpdateRecentSearchesProvider = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentSearches = Provider.of<RecentVotingSearchesProvider>(context);
    return ListView.separated(
      itemBuilder: (_, i) {
        bool hasEnded = DateTime.now().isAfter(this.dataModel[i].endTime!);
        bool hasNotStarted =
            DateTime.now().isBefore(this.dataModel[i].startTime!);
        return this.swipeable
            ? Dismissible(
                background: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    )),
                key: Key(this.dataModel[i].id!),
                onDismissed: (dir) {
                  this.onDismiss!(this.dataModel[i]);
                },
                confirmDismiss: (DismissDirection dir) async {
                  return true;
                },
                child: ListTile(
                  onTap: () {
                    shouldUpdateRecentSearchesProvider
                        ? recentSearches.addRecentSearchesWithSingleData =
                            this.dataModel[i]
                        // ignore: unnecessary_statements
                        : null;
                    this.onTileTap(this.dataModel[i]);
                  },
                  leading: Icon(Icons.how_to_vote_sharp),
                  title: this.shouldHighlightSome
                      ? RichText(
                          text: TextSpan(
                              text: this
                                  .dataModel[i]
                                  .title!
                                  .substring(0, query!.length),
                              style: deepenText,
                              children: [
                              TextSpan(
                                  text: this
                                      .dataModel[i]
                                      .title!
                                      .substring(query!.length),
                                  style: faintedText)
                            ]))
                      : Text(this.dataModel[i].title!),
                  trailing: (!hasNotStarted && !hasEnded)
                      ? AvatarGlow(
                          repeat: true,
                          animate: true,
                          showTwoGlows: true,
                          repeatPauseDuration: Duration(milliseconds: 100),
                          glowColor: Colors.green,
                          endRadius: 30,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ),
                        )
                      : (hasNotStarted
                          ? AvatarGlow(
                              repeat: true,
                              animate: true,
                              showTwoGlows: true,
                              repeatPauseDuration: Duration(milliseconds: 100),
                              glowColor: Colors.yellow,
                              endRadius: 30,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.yellow,
                              ),
                            )
                          : AvatarGlow(
                              repeat: true,
                              animate: true,
                              showTwoGlows: true,
                              repeatPauseDuration: Duration(milliseconds: 100),
                              glowColor: Colors.blue,
                              endRadius: 30,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.blue,
                              ),
                            )),
                ),
              )
            : ListTile(
                onTap: () {
                  shouldUpdateRecentSearchesProvider
                      ? recentSearches.addRecentSearchesWithSingleData =
                          this.dataModel[i]
                      // ignore: unnecessary_statements
                      : null;
                  this.onTileTap(this.dataModel[i]);
                },
                leading: Icon(Icons.how_to_vote_sharp),
                title: this.shouldHighlightSome
                    ? RichText(
                        text: TextSpan(
                            text: this
                                .dataModel[i]
                                .title!
                                .substring(0, query!.length),
                            style: deepenText,
                            children: [
                            TextSpan(
                                text: this
                                    .dataModel[i]
                                    .title!
                                    .substring(query!.length),
                                style: faintedText)
                          ]))
                    : Text(this.dataModel[i].title!),
                trailing: (!hasNotStarted && !hasEnded)
                    ? AvatarGlow(
                        repeat: true,
                        animate: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        glowColor: Colors.green,
                        endRadius: 30,
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ),
                      )
                    : (hasNotStarted
                        ? AvatarGlow(
                            repeat: true,
                            animate: true,
                            showTwoGlows: true,
                            repeatPauseDuration: Duration(milliseconds: 100),
                            glowColor: Colors.yellow,
                            endRadius: 30,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.yellow,
                            ),
                          )
                        : AvatarGlow(
                            repeat: true,
                            animate: true,
                            showTwoGlows: true,
                            repeatPauseDuration: Duration(milliseconds: 100),
                            glowColor: Colors.blue,
                            endRadius: 30,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.blue,
                            ),
                          )),
              );
      },
      itemCount: this.dataModel.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 0,
          color: Colors.black,
        );
      },
    );
  }
}
