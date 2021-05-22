import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';
import 'package:votex/ui/view_model/signup_view_model.dart';
import 'package:votex/ui/widgets/auth_busy_btn.dart';
import 'package:votex/ui/widgets/auth_header.dart';
import 'package:votex/ui/widgets/custom_icon.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, widget) {
          return ResponsiveBuilder(builder: (context, info) {
            if (info.isMobile) {
              return _MobileView(
                model,
                info: info,
              );
            }
            //return default
            return _MobileView(
              model,
              info: info,
            );
          });
        },
        viewModelBuilder: () => SignUpViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final SignUpViewModel model;
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
                        padding: EdgeInsets.only(bottom: devSize.height * .07),
                        child: AuthHeader(model.headLine),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        style: textFieldInputFont,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) => model.onFieldChange(
                            data: text, type: FieldType.EMAIL),
                        validator: (text) =>
                            model.validator(data: text, type: FieldType.EMAIL),
                        controller: model.emailController,
                        decoration:
                            InputDecoration(hintText: model.emailHintext),
                      ),
                      SizedBox(
                        height: devSize.height * 0.02,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        style: textFieldInputFont,
                        onChanged: (text) => model.onFieldChange(
                            data: text, type: FieldType.PASSWORD1),
                        validator: (text) => model.validator(
                            data: text, type: FieldType.PASSWORD1),
                        controller: model.password1Controller,
                        obscureText: true,
                        decoration:
                            InputDecoration(hintText: model.passwordHintext),
                      ),
                      SizedBox(
                        height: devSize.height * 0.02,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (text) => model.signUp(),
                        keyboardType: TextInputType.visiblePassword,
                        style: textFieldInputFont,
                        onChanged: (text) => model.onFieldChange(
                            data: text, type: FieldType.PASSWORD2),
                        validator: (text) => model.validator(
                            data: text,
                            type: FieldType.PASSWORD2,
                            password1: model.password1Controller.text),
                        controller: model.password2Controller,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: model.confirmPasswordHintext),
                      ),
                      SizedBox(
                        height: devSize.height * 0.05,
                      ),
                      AuthBusyBtn(
                        model.signText,
                        onPressed: model.signUp,
                        isBusy: model.isBusy,
                      ),
                      SizedBox(
                        height: devSize.height * 0.05,
                      ),
                      Align(
                        child: Text(
                          model.alreadyHaveAnAcc,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      SizedBox(
                        height: devSize.height * 0.01,
                      ),
                      Align(
                        child: InkWell(
                          onTap: model.navigateToSignIn,
                          child: Text(
                            model.registerText,
                            style: primaryGreenText1,
                          ),
                        ),
                      )
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
