import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/data/implementation/remote/api/cafe_api.dart';
import 'package:amary_cafe/data/implementation/remote/api/cafe_api_impl.dart';
import 'package:amary_cafe/data/implementation/repository/cafe_repository_impl.dart';
import 'package:amary_cafe/feature/detail/detail_provider.dart';
import 'package:amary_cafe/feature/favorite/favorite_provider.dart';
import 'package:amary_cafe/feature/home/home_provider.dart';
import 'package:amary_cafe/feature/main/main_provider.dart';
import 'package:amary_cafe/route/nav_host.dart';
import 'package:amary_cafe/style/theme/cafe_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<CafeApi>(
          create: (context) => CafeApiImpl(
            "https://restaurant-api.dicoding.dev", //base url
            "https://restaurant-api.dicoding.dev/images/medium/" //base image url
          )
        ),
        ProxyProvider<CafeApi, CafeRepository>(
          update: (context, cafeApi, _) => CafeRepositoryImpl(cafeApi)
        ),
        ChangeNotifierProvider(
          create: (context) => MainProvider()
        ),
        ChangeNotifierProxyProvider<CafeRepository, HomeProvider>(
          create: (context) => HomeProvider(context.read<CafeRepository>()),
          update: (context, cafeRepository, previous) => HomeProvider(cafeRepository),
        ),
        ChangeNotifierProxyProvider<CafeRepository, DetailProvider>(
          create: (context) => DetailProvider(context.read<CafeRepository>()),
          update: (context, cafeRepository, previous) => DetailProvider(cafeRepository),
        ),
        ChangeNotifierProxyProvider<CafeRepository, FavoriteProvider>(
          create: (context) => FavoriteProvider(context.read<CafeRepository>()),
          update: (context, cafeRepository, previous) => FavoriteProvider(cafeRepository),
        ),
      ],
      child: AmaryCafe(),
    )
  );
}

class AmaryCafe extends StatelessWidget {
  const AmaryCafe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amary Cafe',
      theme: CafeTheme.lightTheme,
      darkTheme: CafeTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: NavHost.initialHost,
      routes: NavHost.host,
    );
  }
}
