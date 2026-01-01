import 'package:flutter/material.dart';


extension RouteContext on BuildContext {
  //for routes

  pushNamedAndRemoveUntil(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (Route route) => false,
        arguments: args,
      );
}
