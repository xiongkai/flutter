import 'package:flutter/material.dart';

import 'application.dart';
import 'routes.dart';

class NavigatorUtil{
  ///返回
  static void back(BuildContext context){
    Application.router.pop(context);
  }
  /// 跳转到主页面
  static void goHomePage(BuildContext context, {bool replace = false, bool clearStack = false}) {
    Application.router.navigateTo(context, Routes.home, replace: replace, clearStack: clearStack);
  }
  /// 跳转到登录注册页面
  static void goLoginPage(BuildContext context, {bool replace = false, bool clearStack = false}) {
    Application.router.navigateTo(context, Routes.login, replace: replace, clearStack: clearStack);
  }
  /// 跳转到详情页面
  static void goDetailPage(BuildContext context, {bool replace = false, bool clearStack = false}) {
    Application.router.navigateTo(context, Routes.detail, replace: replace, clearStack: clearStack);
  }
}