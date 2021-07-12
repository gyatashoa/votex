import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/providers/subscriptions_provider.dart';
import 'package:votex/ui/view_model/subscription_view_model.dart';
import 'package:votex/ui/widgets/voting_list_tiles.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubscriptionViewModel>.reactive(
        builder: (ctx, model, _) {
          return Column(
            children: [
              AppBar(
                elevation: 2,
                title: Text(
                  'Subscriptions',
                  style: GoogleFonts.montserrat(color: Colors.black),
                ),
              ),
              Expanded(
                child: Consumer<SubscriptionsProvider>(builder: (_, value, __) {
                  if (value.getSubscriptions.isEmpty)
                    return Center(
                      //TODO: Will have to implement a ui for no subscriptions
                      child: Text("You have no Subscriptions"),
                    );
                  return BuildVotingListTiles(
                    value.getSubscriptions,
                    model.navigateToVotingDetailsView,
                    swipeable: true,
                    onDismiss: value.removeSubscription,
                  );
                }),
              )
            ],
          );
        },
        viewModelBuilder: () => SubscriptionViewModel());
  }
}
