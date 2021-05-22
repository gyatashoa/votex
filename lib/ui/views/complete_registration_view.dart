import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/completeRegistration_view_model.dart';
import 'package:votex/ui/view_model/login_view_model.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';
import 'package:votex/ui/widgets/auth_busy_btn.dart';
import 'package:votex/ui/widgets/auth_header.dart';
import 'package:votex/ui/widgets/custom_icon.dart';

class CompleteRegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompleteRegistrationViewModel>.reactive(
        builder: (context, model, widget) {
          return ResponsiveBuilder(builder: (context, info) {
            if (info.isMobile) {
              return _MobileView(
                model,
                info: info,
              );
            }

            //default view
            return _MobileView(
              model,
              info: info,
            );
          });
        },
        viewModelBuilder: () => CompleteRegistrationViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final CompleteRegistrationViewModel model;
  SizingInformation? info;

  _MobileView(this.model, {this.info});
  @override
  Widget build(BuildContext context) {
    Size devSize = info!.screenSize;
    return SafeArea(
      child: GestureDetector(
        onTap: () => model.unfocus(context),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: devSize.width * .11),
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: devSize.height * 0.05,
                            bottom: devSize.height * .02),
                        child: Align(
                            alignment: Alignment.center, child: CustomIcon2()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: devSize.height * .09),
                        child: AuthHeader(model.headLine),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        style: textFieldInputFont,
                        keyboardType: TextInputType.number,
                        onChanged: (text) => model.onFieldChange(
                            data: text, type: FieldType.SCHOOLID),
                        controller: model.schoolIdController,
                        validator: (text) => model.validator(
                            type: FieldType.SCHOOLID, data: text),
                        decoration: InputDecoration(hintText: model.schoolId),
                      ),
                      SizedBox(
                        height: devSize.height * 0.02,
                      ),
                      DropdownButtonFormField<int>(
                          onChanged: (int? i) => model.onDropChanged(
                              data: i, type: FieldType.COLLEGE),
                          value: model.data['college'],
                          items: model.colleges),
                      SizedBox(
                        height: devSize.height * 0.05,
                      ),
                      DropdownButtonFormField<int>(
                          onChanged: (int? i) => model.onDropChanged(
                              data: i, type: FieldType.DEPARTMENT),
                          value: model.data['department'],
                          items: model.departments),
                      SizedBox(
                        height: devSize.height * 0.1,
                      ),
                      AuthBusyBtn(
                        model.signText,
                        onPressed: model.submit,
                        isBusy: model.isBusy,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
