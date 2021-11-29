import 'dart:io';

import 'package:dio/dio.dart';
import 'package:turk_ai_test/core/constants/app_constants.dart';
import 'package:turk_ai_test/core/network/api_network_manager.dart'; 
import 'package:turk_ai_test/models/base_model.dart';
import 'package:turk_ai_test/services/abstract/i_user_service.dart';

class UserService extends IUserService {
  static UserService _instance = UserService._init();
  static UserService get instance => _instance;

  UserService._init();

  var _apiNetwork = ApiNetworkManager.instance.dio;

  @override
  Future<BaseModel?> uploadProfileImage(File file,
      {void Function(int, int)? onSendProgress}) async {
    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: DateTime.now().toIso8601String(),
      ),
    });
    var response = await _apiNetwork.post(
      ApiConstants.STORE,
      data: data,
      onSendProgress: onSendProgress,
    );

    if (response.data != null && response.statusCode == 200) {
      return BaseModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<BaseModel?> getAllUsers() async {
    var response = await _apiNetwork.get(
      ApiConstants.INDEX,
    );
    if (response.data != null && response.statusCode == 200) {
      return BaseModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<BaseModel?> userDetail(String id) async {
    var response = await _apiNetwork.get(
      ApiConstants.SHOW + "/$id",
    );
    if (response.data != null && response.statusCode == 200) {
      return BaseModel.fromJson(response.data);
    }
    return null;
  }
}
