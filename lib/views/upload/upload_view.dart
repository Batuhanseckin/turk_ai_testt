library upload_view;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:turk_ai_test/core/manager/ui_helper.dart';
import 'package:turk_ai_test/core/extensions/string_extension.dart';
import 'upload_view_model.dart';

part 'upload_mobile.dart';
part 'upload_tablet.dart';
part 'upload_desktop.dart';

class UploadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadViewModel>.reactive(
        viewModelBuilder: () => UploadViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder:
            (BuildContext context, UploadViewModel viewModel, Widget? child) {
          return ScreenTypeLayout(
            mobile: _UploadMobile(viewModel),
            desktop: _UploadDesktop(viewModel),
            tablet: _UploadTablet(viewModel),
          );
        });
  }
}
