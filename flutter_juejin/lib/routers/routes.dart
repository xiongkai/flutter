import 'package:fluro/fluro.dart';

import 'routeHandlers.dart';

class Routes{
  static final String home = "/";
  static final String login = "/login";
  static final String detail = "/detail";

  static void configureRoutes(Router router) {
    router.notFoundHandler = notFoundHandler;
    /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画，可以看上图
    /// 我这边先不设置默认的转场动画，转场动画在下面会讲，可以在另外一个地方设置（可以看NavigatorUtil类）
    router.define(home, handler: homeHandler);
    router.define(detail, handler: detailHandler);
  }
}