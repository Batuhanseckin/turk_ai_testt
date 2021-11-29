// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:turk_ai_test/core/router_constants.dart';

import 'package:turk_ai_test/views/home/home_view.dart' as view0;
import 'package:turk_ai_test/views/user_detail/user_detail_view.dart' as view1;
import 'package:turk_ai_test/views/upload/upload_view.dart' as view2;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => view0.HomeView(), settings: settings);
      case userDetailViewRoute:
        return MaterialPageRoute(builder: (_) => view1.UserDetailView(), settings: settings);
      case uploadViewRoute:
        return MaterialPageRoute(builder: (_) => view2.UploadView(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}