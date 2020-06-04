import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:learn/homePage.dart';
import 'package:learn/notFoundPage.dart';
import 'package:learn/plugin/pluginDemoPage.dart';
import 'package:learn/provider/basic/ConsumerDemoPage.dart';
import 'package:learn/provider/basic/ProviderOfDemoPage.dart';
import 'package:learn/provider/basic/SelectorDemoPage.dart';
import 'package:learn/provider/providerPage.dart';
import 'package:learn/widget/exchangeWidget/exchangeDemoPage.dart';
import 'package:learn/widget/exchangeWidget/exchangeDemoPage2.dart';
import 'package:learn/widget/exchangeWidget/exchangeDemoPage3.dart';
import 'package:learn/widget/exchangeWidget/exchangeDemoPage4.dart';
import 'package:learn/widget/exchangeWidget/exchangeDemoPage5.dart';
import 'package:learn/widget/inhertWidget/inhertDemoPage.dart';
import 'package:learn/widget/statefulWidget/statefulDemoPage.dart';
import 'package:learn/widget/statelessWidget/statelessDemoPage.dart';
import 'package:learn/widget/widgetPage.dart';

class Routes{
  static final Router _router = Router();
  static const String home = "/";
  //
  static const String provider = "/provider";
  static const String provider_providerOf = "/provider/providerOf";
  static const String provider_consumer = "/provider/consumer";
  static const String provider_selector = "/provider/selector";
  //
  static const String bloc = "/bloc";
  //
  static const String plugin = "/plugin";
  //
  static const String widget = "/widget";
  static const String widget_stateless = "/widget/stateless";
  static const String widget_stateful = "/widget/stateful";
  static const String widget_inhert = "/widget/inhert";
  static const String widget_exchange = "/widget/exchange";
  static const String widget_exchange2 = "/widget/exchange2";
  static const String widget_exchange3 = "/widget/exchange3";
  static const String widget_exchange4 = "/widget/exchange4";
  static const String widget_exchange5 = "/widget/exchange5";

  static void pop(BuildContext context){
    _router.pop(context);
  }

  static Future navigateTo(BuildContext context, String path, {bool replace = false, bool clearStack = false}){
    return _router.navigateTo(context, path, replace: replace, clearStack: clearStack);
  }

  static Router init(){
    _router.notFoundHandler = Handler(handlerFunc: _handleNotFound);
    _router.define(home, handler: Handler(handlerFunc: _handleHomePage));

    _router.define(provider, handler: Handler(handlerFunc: _handleProviderPage));
    _router.define(provider_providerOf, handler: Handler(handlerFunc: _handleProviderOfPage));
    _router.define(provider_consumer, handler: Handler(handlerFunc: _handleConsumerPage));
    _router.define(provider_selector, handler: Handler(handlerFunc: _handleSelectorPage));

    _router.define(plugin, handler: Handler(handlerFunc: _handlePluginPage));

    _router.define(widget, handler: Handler(handlerFunc: _handleWidgetPage));
    _router.define(widget_stateless, handler: Handler(handlerFunc: _handleStatelessPage));
    _router.define(widget_stateful, handler: Handler(handlerFunc: _handleStatefulPage));
    _router.define(widget_inhert, handler: Handler(handlerFunc: _handleInhertPage));
    _router.define(widget_exchange, handler: Handler(handlerFunc: _handleExchangePage));
    _router.define(widget_exchange2, handler: Handler(handlerFunc: _handleExchangePage2));
    _router.define(widget_exchange3, handler: Handler(handlerFunc: _handleExchangePage3));
    _router.define(widget_exchange4, handler: Handler(handlerFunc: _handleExchangePage4));
    _router.define(widget_exchange5, handler: Handler(handlerFunc: _handleExchangePage5));
    return _router;
  }

  static Widget _handleNotFound(BuildContext context, Map<String, List<String>> parameters){
    return NotFoundPage();
  }

  static Widget _handleHomePage(BuildContext context, Map<String, List<String>> parameters){
    return HomePage();
  }

  static Widget _handleProviderPage(BuildContext context, Map<String, List<String>> parameters){
    return ProviderPage();
  }

  static Widget _handleProviderOfPage(BuildContext context, Map<String, List<String>> parameters){
    return ProviderOfDemoPage();
  }

  static Widget _handleConsumerPage(BuildContext context, Map<String, List<String>> parameters){
    return ConsumerDemoPage();
  }

  static Widget _handleSelectorPage(BuildContext context, Map<String, List<String>> parameters){
    return SelectorDemoPage();
  }

  static Widget _handlePluginPage(BuildContext context, Map<String, List<String>> parameters){
    return PluginDemoPage();
  }

  static Widget _handleWidgetPage(BuildContext context, Map<String, List<String>> parameters){
    return WidgetPage();
  }

  static Widget _handleStatelessPage(BuildContext context, Map<String, List<String>> parameters){
    return StatelessDemoPage();
  }

  static Widget _handleStatefulPage(BuildContext context, Map<String, List<String>> parameters){
    return StatefulDemoPage();
  }

  static Widget _handleInhertPage(BuildContext context, Map<String, List<String>> parameters){
    return InhertDemoPage();
  }

  static Widget _handleExchangePage(BuildContext context, Map<String, List<String>> parameters){
    return ExchangeDemoPage();
  }

  static Widget _handleExchangePage2(BuildContext context, Map<String, List<String>> parameters){
    return ExchangeDemoPage2();
  }

  static Widget _handleExchangePage3(BuildContext context, Map<String, List<String>> parameters){
    return ExchangeDemoPage3();
  }

  static Widget _handleExchangePage4(BuildContext context, Map<String, List<String>> parameters){
    return ExchangeDemoPage4();
  }

  static Widget _handleExchangePage5(BuildContext context, Map<String, List<String>> parameters){
    return ExchangeDemoPage5();
  }
}

