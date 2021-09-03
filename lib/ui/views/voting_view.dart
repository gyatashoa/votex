import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/theme/btn_styles.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/voting_view_model.dart';
import 'package:votex/ui/widgets/animation_widgets.dart';

class VotingView extends StatelessWidget {
  final VotingDataModel dataModel;
  const VotingView(this.dataModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VotingViewModel>.reactive(
        // onModelReady: (model) => model.onInit(dataModel),
        builder: (_, model, widget) {
          return ResponsiveBuilder(builder: (_, info) {
            if (info.isMobile) return _MobileView(dataModel, model);
            return _MobileView(dataModel, model);
          });
        },
        viewModelBuilder: () => VotingViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final VotingDataModel dataModel;
  final VotingViewModel model;
  const _MobileView(this.dataModel, this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            this.dataModel.title!,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        body: model.isBusy
            ? Center(
                child: Column(
                  children: [
                    LottieBallotBox(),
                    Text(
                      'Please Wait',
                      style: mediumHeaderText,
                    )
                  ],
                ),
              )
            : Container(
                height: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: this
                                  .dataModel
                                  .contestants!
                                  .asMap()
                                  .entries
                                  .map((e) => RadioListTile<int>(
                                      value: e.key,
                                      title: Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        e.value.imagePath!),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(e.value.name!)
                                        ],
                                      ),
                                      groupValue: model.state,
                                      onChanged: (i) => model.change(i!)))
                                  .toList()),
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Container(
                            width: double.infinity,
                            child: TextButton(
                                style: btnGreen.style,
                                onPressed: () =>
                                    model.onSubmit(this.dataModel, context),
                                child: Text(
                                  model.submitText,
                                  style: whiteBtnText,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
