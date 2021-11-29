library user_detail_view;

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:turk_ai_test/core/manager/ui_helper.dart';
import 'user_detail_view_model.dart';

part 'user_detail_mobile.dart';
part 'user_detail_tablet.dart';
part 'user_detail_desktop.dart';

class UserDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    return ViewModelBuilder<UserDetailViewModel>.reactive(
      viewModelBuilder: () => UserDetailViewModel(),
      onModelReady: (viewModel) {
        viewModel.getContext(context);
        viewModel.getUserDetail(id);
      },
      builder:
          (BuildContext context, UserDetailViewModel viewModel, Widget? child) {
        return ScreenTypeLayout(
          mobile: _UserDetailMobile(viewModel),
          desktop: _UserDetailDesktop(viewModel),
          tablet: _UserDetailTablet(viewModel),
        );
      },
    );
  }
}
