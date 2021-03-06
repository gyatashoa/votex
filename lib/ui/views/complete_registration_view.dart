import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/completeRegistration_view_model.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';
import 'package:votex/ui/widgets/auth_busy_btn.dart';
import 'package:votex/ui/widgets/auth_header.dart';
import 'package:votex/ui/widgets/custom_datefield.dart';
import 'package:votex/ui/widgets/custom_icon.dart';

class CompleteRegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompleteRegistrationViewModel>.reactive(
        onModelReady: (model) => SchedulerBinding.instance!
            .addPostFrameCallback((_) => model.onInit()),
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

// ignore: must_be_immutable
class _MobileView extends StatelessWidget {
  final CompleteRegistrationViewModel model;
  SizingInformation? info;

  _MobileView(this.model, {this.info});
  @override
  Widget build(BuildContext context) {
    Size devSize = info!.screenSize;
    return GestureDetector(
      onTap: () => model.unfocus(context),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: devSize.width * .11),
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: devSize.height * 0.009,
                          bottom: devSize.height * .02),
                      child: Align(
                          alignment: Alignment.center, child: CustomIcon2()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: devSize.height * .03),
                      child: AuthHeader(model.headLine),
                    ),
                    TextFormField(
                      enabled: false,
                      controller: model.schoolIdController,
                      decoration: InputDecoration(
                          labelText: model.schoolId, hintText: model.schoolId),
                    ),
                    SizedBox(
                      height: devSize.height * 0.02,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      style: textFieldInputFont,
                      keyboardType: TextInputType.text,
                      onChanged: (text) =>
                          model.onFieldChange(data: text, type: FieldType.NAME),
                      controller: model.nameController,
                      validator: (text) =>
                          model.validator(type: FieldType.NAME, data: text),
                      decoration: InputDecoration(hintText: model.name),
                    ),
                    SizedBox(
                      height: devSize.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDateField(model.dateController),
                        ),
                        TextButton(
                          child: Icon(
                            Icons.calendar_today,
                            color: primaryGreenColor,
                          ),
                          onPressed: () => model.onChangeDatePressed(context),
                        )
                      ],
                    ),
                    SizedBox(
                      height: devSize.height * 0.02,
                    ),
                    DropdownButtonFormField<String>(
                        hint: Text(model.collegeTxt),
                        validator: (String? i) =>
                            model.validator(type: FieldType.COLLEGE, data: i),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (String? i) => model.onDropChanged(
                            data: i, type: FieldType.COLLEGE),
                        value: model.data['college'],
                        items: model.colleges),
                    SizedBox(
                      height: devSize.height * 0.02,
                    ),
                    DropdownButtonFormField<String>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hint: Text(model.departmentTxt),
                        validator: (String? i) => model.validator(
                            data: i, type: FieldType.DEPARTMENT),
                        onChanged: (String? i) => model.onDropChanged(
                            data: i, type: FieldType.DEPARTMENT),
                        value: model.data['departmentId'],
                        items: model.departments),
                    SizedBox(
                      height: devSize.height * 0.07,
                    ),
                    Consumer<UserDetailsProvider>(
                      builder: (_, provider, __) => AuthBusyBtn(
                        model.signText,
                        onPressed: () => model.submit(provider),
                        isBusy: model.isBusy,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
