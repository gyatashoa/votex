import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/ui/view_model/profile_view_model.dart';
import 'package:votex/ui/widgets/fade_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget get space => SliverPadding(
        padding: EdgeInsets.only(top: 5),
      );

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return ViewModelBuilder<ProfileViewModel>.reactive(
        onModelReady: ProfileViewModel().init,
        builder: (ctx, model, widget) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: devSize.height,
            child: CustomScrollView(
              controller: model.scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  stretch: true,
                  flexibleSpace: FadeOnScroll(
                    scrollController: model.scrollController,
                    appBarHeight: devSize.height * .35,
                    child: Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.16),
                                  spreadRadius: 5,
                                  blurRadius: 6,
                                  offset: Offset(3, 3))
                            ], shape: BoxShape.circle, color: Colors.white),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt_outlined)),
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/user.jpg'),
                                fit: BoxFit.fitHeight)),
                      ),
                    ),
                  ),
                  expandedHeight: devSize.height * .35,
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: devSize.width * .07),
                  sliver: SliverFixedExtentList(
                    itemExtent: 75,
                    delegate: SliverChildListDelegate(
                      [
                        // space,
                        _CustomTextFieldLabels(model.idController,
                            isEditable: false, labelText: model.schoolIdText),
                        _CustomTextFieldLabels(model.fullNameController,
                            isEditable: false, labelText: model.fullNameText),
                        _CustomTextFieldLabels(model.emailController,
                            isEditable: false, labelText: model.emailText),
                        _CustomTextFieldLabels(model.dateController,
                            isEditable: true, labelText: model.dateText),
                        _CustomTextFieldLabels(model.collegeController,
                            isEditable: false, labelText: model.collegeText),
                        _CustomTextFieldLabels(model.departmentController,
                            isEditable: false, labelText: model.departmentText),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: devSize.width * .07),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        viewModelBuilder: () => ProfileViewModel());
  }
}

class _CustomTextFieldLabels extends StatelessWidget {
  final String labelText;
  final bool isEditable;
  final TextEditingController controller;
  const _CustomTextFieldLabels(this.controller,
      {Key? key,
      @required this.isEditable = false,
      @required this.labelText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyText1,
      controller: this.controller,
      enabled: this.isEditable,
      decoration: InputDecoration(
          suffix: this.isEditable ? Icon(Icons.edit) : null,
          labelStyle: Theme.of(context).textTheme.subtitle2,
          labelText: this.labelText),
    );
  }
}
