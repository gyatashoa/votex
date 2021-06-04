import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/ui/view_model/discover_view_model.dart';
import 'package:votex/ui/widgets/custom_vote_cards.dart';

class DiscoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return ViewModelBuilder<DiscoverViewModel>.reactive(
        builder: (context, model, widget) {
          if (!model.dataReady) return CircularProgressIndicator();
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: devSize.width * .07,
                vertical: devSize.height * .025),
            child: Column(
                children:
                    model.data!.map((e) => CustomVCards(model: e)).toList()),
          );
        },
        viewModelBuilder: () => DiscoverViewModel());
  }
}
