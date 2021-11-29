import 'dart:io';

import 'package:turk_ai_test/models/base_model.dart';

abstract class IUserService {
  Future<BaseModel?> uploadProfileImage(
    File image, {
    void Function(int, int)? onSendProgress,
  });
  Future<BaseModel?> getAllUsers();
  Future<BaseModel?> userDetail(String id);
}
