import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/login_view_model.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';
import 'package:votex/ui/widgets/auth_busy_btn.dart';
import 'package:votex/ui/widgets/auth_header.dart';
import 'package:votex/ui/widgets/custom_icon.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
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
        viewModelBuilder: () => LoginViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final LoginViewModel model;
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
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) => model.onFieldChange(
                            data: text, type: FieldType.EMAIL),
                        controller: model.emailController,
                        validator: (text) =>
                            model.validator(type: FieldType.EMAIL, data: text),
                        decoration:
                            InputDecoration(hintText: model.emailHintext),
                      ),
                      SizedBox(
                        height: devSize.height * 0.02,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        style: textFieldInputFont,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (text) => model.onFieldChange(
                            data: text, type: FieldType.PASSWORD1),
                        controller: model.password1Controller,
                        validator: (text) => model.validator(
                            type: FieldType.PASSWORD1, data: text),
                        obscureText: true,
                        decoration:
                            InputDecoration(hintText: model.passwordHintext),
                      ),
                      SizedBox(
                        height: devSize.height * 0.02,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: model.forgotPassword,
                            child: Text(
                              model.forgotPasswordTxt,
                              style: primaryGreenText1,
                            ),
                          )),
                      SizedBox(
                        height: devSize.height * 0.1,
                      ),
                      AuthBusyBtn(
                        model.signText,
                        onPressed: model.signIn,
                        isBusy: model.isBusy,
                      ),
                      SizedBox(
                        height: devSize.height * 0.06,
                      ),
                      Align(
                        child: Text(
                          model.needAccTxt,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      SizedBox(
                        height: devSize.height * 0.01,
                      ),
                      Align(
                        child: InkWell(
                          onTap: model.navigateToCreateAccount,
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
