import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/reset_password_view_model.dart';
import 'package:votex/ui/widgets/auth_busy_btn.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
        builder: (ctx, model, _) {
          return ResponsiveBuilder(builder: (_, info) {
            if (info.isMobile) {
              return _MobileView(model);
            }
            return _MobileView(model);
          });
        },
        viewModelBuilder: () => ResetPasswordViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final ResetPasswordViewModel model;
  const _MobileView(this.model, {Key? key}) : super(key: key);
  final imagePath = 'assets/images/send_email.png';

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: model.goBack,
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Forgot your Password?',
                style: mediumHeaderText,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: devSize.width * .16),
                child: Text(
                  'Enter your registered email below to receive password reset instruction',
                  textAlign: TextAlign.center,
                  style: faintedTextSecondary,
                ),
              ),
              Container(
                  height: devSize.height * .5,
                  child: Image.asset(this.imagePath)),
              Form(
                  key: model.formkey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: devSize.width * .18),
                    child: TextFormField(
                      onFieldSubmitted: (val) => model.resetPassword(),
                      controller: model.emailController,
                      validator: model.validate,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: devSize.width * .18),
                child: AuthBusyBtn('Send Link',
                    isBusy: model.isBusy, onPressed: model.resetPassword),
              )
            ],
          ),
        ),
      ),
    );
  }
}
