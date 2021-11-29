import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:turk_ai_test/core/logger.dart';
import 'package:turk_ai_test/models/base_model.dart';
import 'package:turk_ai_test/services/concrete/user_service.dart';

class UploadViewModel extends BaseViewModel {
  Logger? log;
  File? imageFile;
  double progressPercent = 0;

  UploadViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  void pickImage(source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      imageFile = File(image.path);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadProfileImage(context) async {
    try {
      var baseModel = await UserService.instance.uploadProfileImage(
        imageFile!,
        onSendProgress: (int sentBytes, int totalBytes) {
          this.progressPercent = sentBytes / totalBytes * 100;
          notifyListeners();
        },
      );
      if (baseModel != null &&
          baseModel is BaseModel &&
          baseModel.status == 200) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          title: 'İŞLEM BAŞARILI',
          desc: 'Yükleme işlemi başarıyla gerçekleştirildi.',
          btnOkOnPress: () {},
        )..show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          title: 'HATA',
          desc: baseModel?.message ??
              "İşlem sırasında beklenmedik bir hata oluştu.",
          btnOkOnPress: () {},
        )..show();
      }
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'HATA',
        desc: "İşlem sırasında beklenmedik bir hata oluştu.",
        btnOkOnPress: () {},
      )..show();
      print(e);
      throw e;
    }
  }
}
