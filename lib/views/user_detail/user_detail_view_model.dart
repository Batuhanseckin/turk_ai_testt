import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:turk_ai_test/core/logger.dart';
import 'package:turk_ai_test/models/base_model.dart';
import 'package:turk_ai_test/models/user_detail_model.dart';
import 'package:turk_ai_test/services/concrete/user_service.dart';

class UserDetailViewModel extends BaseViewModel {
  Logger? log;
  bool isError = false;

  UserDetailViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  late BuildContext context;
  getContext(BuildContext context) => this.context = context;

  bool fetchingUserDetail = false;
  late UserDetailModel? userDetailModel;

  void getUserDetail(String id) async {
    this.fetchingUserDetail = true;
    notifyListeners();
    try {
      var baseModel = await UserService.instance.userDetail(id);
      if (baseModel != null &&
          baseModel is BaseModel &&
          baseModel.status == 200) {
        userDetailModel = UserDetailModel.fromJson(baseModel.data);
      } else {
        this.isError = true;
      }
      this.fetchingUserDetail = false;
      notifyListeners();
    } catch (e) {
      this.fetchingUserDetail = false;
      this.isError = true;
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'HATA',
        desc: "İşlem sırasında beklenmedik bir hata oluştu.",
        btnOkOnPress: () {},
      )..show();
      notifyListeners();
      throw e;
    }
  }
}
