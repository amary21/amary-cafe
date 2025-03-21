import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/data/di/cafe_module.dart';
import 'package:amary_cafe/feature/detail/detail_provider.dart';
import 'package:amary_cafe/feature/detail/widget/fav_icon/fav_icon_provider.dart';
import 'package:amary_cafe/feature/favorite/favorite_provider.dart';
import 'package:amary_cafe/feature/home/home_provider.dart';
import 'package:amary_cafe/feature/main/main_provider.dart';
import 'package:amary_cafe/feature/setting/setting_provider.dart';
import 'package:amary_cafe/route/nav_host.dart';
import 'package:amary_cafe/service/notification_module.dart';
import 'package:amary_cafe/service/notification_service.dart';
import 'package:amary_cafe/style/theme/cafe_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ...cafeModule(
          baseUrl: "https://restaurant-api.dicoding.dev",
          baseImageUrl: "https://restaurant-api.dicoding.dev/images/medium/",
          databaseName: "amary-cafe.db",
          databaseVersion: 1,
          preferences: preferences,
        ),
        ...notificationModule(),
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProxyProvider<CafeRepository, HomeProvider>(
          create: (context) => HomeProvider(context.read<CafeRepository>()),
          update:
              (context, cafeRepository, previous) =>
                  HomeProvider(cafeRepository),
        ),
        ChangeNotifierProxyProvider<CafeRepository, DetailProvider>(
          create: (context) => DetailProvider(context.read<CafeRepository>()),
          update:
              (context, cafeRepository, previous) =>
                  DetailProvider(cafeRepository),
        ),
        ChangeNotifierProxyProvider<CafeRepository, FavoriteProvider>(
          create: (context) => FavoriteProvider(context.read<CafeRepository>()),
          update:
              (context, cafeRepository, previous) =>
                  FavoriteProvider(cafeRepository),
        ),
        ChangeNotifierProxyProvider<CafeRepository, FavIconProvider>(
          create: (context) => FavIconProvider(context.read<CafeRepository>()),
          update:
              (context, cafeRepository, previous) =>
                  FavIconProvider(cafeRepository),
        ),
        ChangeNotifierProxyProvider2<
          CafeRepository,
          NotificationService,
          SettingProvider
        >(
          create:
              (context) => SettingProvider(
                context.read<CafeRepository>(),
                context.read<NotificationService>(),
              ),
          update:
              (context, cafeRepository, notificationService, previous) =>
                  SettingProvider(cafeRepository, notificationService)
                    ..requestPermissions(),
        ),
      ],
      child: AmaryCafe(),
    ),
  );
}

class AmaryCafe extends StatelessWidget {
  const AmaryCafe({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, provider, _) {
        return MaterialApp(
          title: 'Amary Cafe',
          theme: CafeTheme.lightTheme,
          darkTheme: CafeTheme.darkTheme,
          themeMode:
              provider.darkTheme.isEnable ? ThemeMode.dark : ThemeMode.light,
          initialRoute: NavHost.initialHost,
          routes: NavHost.host,
        );
      },
    );
  }
}
