import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/ui/view_model/discover_view_model.dart';
import 'package:votex/ui/widgets/custom_vote_cards.dart';
import 'package:votex/ui/widgets/loading_shimmer_widget.dart';

class DiscoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return ViewModelBuilder<DiscoverViewModel>.reactive(
        onModelReady: (model) => SchedulerBinding.instance!
            .addPostFrameCallback((_) => model.onInit(model)),
        builder: (context, model, widget) {
          if (model.isBusy) return LoadingShimmer();
          //TODO: Will return an error widget here
          if (model.hasError) return Container();
          //TODO: Will return empty number of voting cards here
          if (model.data!.size == 0) return Container();
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  children: model
                      .convert(model.data!.docs)
                      .map((e) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: devSize.width * .07),
                            child: InkWell(
                                // onTap: () => model.navigateToDetail(),
                                child: CustomVCards(model: e)),
                          ))
                      .toList()),
            ),
          );
        },
        viewModelBuilder: () => DiscoverViewModel());
  }
}
