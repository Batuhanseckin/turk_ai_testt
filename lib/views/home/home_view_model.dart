import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:turk_ai_test/core/logger.dart';
import 'package:turk_ai_test/core/router_constants.dart';
import 'package:turk_ai_test/models/base_model.dart';
import 'package:turk_ai_test/models/user_list_model.dart';
import 'package:turk_ai_test/services/concrete/user_service.dart';

class HomeViewModel extends FutureViewModel<List<UserListModel>> {
  Logger? log;

  HomeViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  @override
  Future<List<UserListModel>> futureToRun() async {
    try {
      var baseModel = await UserService.instance.getAllUsers();
      if (baseModel != null &&
          baseModel is BaseModel &&
          baseModel.status == 200) {
        return (baseModel.data as List)
            .map((e) => UserListModel.fromJson(e))
            .toList();
      }
      return [];
    } catch (e) {
      print(e);
      throw e;
    }
  }

  nextDetailPage(String? id) {
    if (id == null) {
      return;
    }
    NavigationService().navigateTo(userDetailViewRoute, arguments: id);
  }

  void nextUploadPage() {
    NavigationService().navigateTo(uploadViewRoute);
  }
}
