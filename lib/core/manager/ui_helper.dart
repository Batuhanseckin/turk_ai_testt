import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  static UIHelper _instance = UIHelper._init();
  static UIHelper get instance => _instance;
  UIHelper._init();

  static dynamicHeight(double height) => ScreenUtil().setHeight(height);
  static dynamicWidth(double width) => ScreenUtil().setWidth(width);
  static dynamicSp(double fontsize) => ScreenUtil().setSp(fontsize);

  double get screenWidth => ScreenUtil().screenWidth;
  double get screenHeight => ScreenUtil().screenHeight;
}
