import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_test/core/navigation/routes.dart';
import 'package:interview_test/modules/authentication/login_phone.dart';
import 'package:interview_test/modules/authentication/login_view.dart';
import 'package:interview_test/modules/pageview_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginRoute:
      return _getPageRoute(
          routeName: settings.name,
          args: settings.arguments,
          view: const LoginView());
    case Routes.loginPhoneFieldRoute:
      return _getPageRoute(
          routeName: settings.name,
          args: settings.arguments,
          view: const LoginPhoneView());
    case Routes.loginRoute:
      return _getPageRoute(
          routeName: settings.name,
          args: settings.arguments,
          view: const LoginView());
    case Routes.pageviewRoute:
      return _getPageRoute(
          routeName: settings.name,
          args: settings.arguments,
          view: const BottomNav());

    default:
      return CupertinoPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute<dynamic> _getPageRoute(
    {String? routeName, required Widget view, required Object? args}) {
  return CupertinoPageRoute<dynamic>(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => view);
}
