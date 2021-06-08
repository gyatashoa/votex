import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/ui/view_model/startup_view_model.dart';
import 'package:votex/ui/widgets/custom_icon.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.nonReactive(
        onModelReady: (model) => SchedulerBinding.instance!
            .addPostFrameCallback((_) => model.init(model)),
        builder: (context, model, widget) {
          return Scaffold(
            backgroundColor: primaryGreenColor,
            body: Center(
              child: Container(
                child: CustomIcon1(),
              ),
            ),
          );
        },
        viewModelBuilder: () => StartUpViewModel());
  }
}
