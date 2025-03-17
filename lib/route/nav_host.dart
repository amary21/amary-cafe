import 'package:amary_cafe/feature/detail/detail_screen.dart';
import 'package:amary_cafe/feature/home/home_screen.dart';
import 'package:amary_cafe/route/nav_route.dart';
import 'package:flutter/material.dart';

class NavHost {
  static String get initialHost {
    return NavRoute.mainRoute.name;
  }

  static Map<String, WidgetBuilder> get host {
    return {
      NavRoute.mainRoute.name: (context) => HomeScreen(),
      NavRoute.detailRoute.name:
          (context) => DetailScreen(
            id: ModalRoute.of(context)?.settings.arguments as String,
          ),
    };
  }
}
