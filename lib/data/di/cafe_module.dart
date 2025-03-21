import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/data/implementation/database/service/cafe_db_service.dart';
import 'package:amary_cafe/data/implementation/database/service/cafe_db_service_impl.dart';
import 'package:amary_cafe/data/implementation/preference/cafe_preference.dart';
import 'package:amary_cafe/data/implementation/preference/cafe_preference_impl.dart';
import 'package:amary_cafe/data/implementation/remote/api/cafe_api.dart';
import 'package:amary_cafe/data/implementation/remote/api/cafe_api_impl.dart';
import 'package:amary_cafe/data/implementation/repository/cafe_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> cafeModule({
  required String baseUrl,
  required String baseImageUrl,
  required String databaseName,
  required int databaseVersion,
  required SharedPreferences preferences,
}) {
  return [
    Provider<CafeApi>(
      create:
          (context) =>
              CafeApiImpl(baseUrl: baseUrl, baseImageUrl: baseImageUrl),
    ),
    Provider<CafeDbService>(
      create:
          (context) => CafeDbServiceImpl(
            databaseName: databaseName,
            tableName: "cafe",
            version: databaseVersion,
          ),
    ),
    Provider<CafePreference>(
      create: (context) => CafePreferenceImpl(preferences: preferences),
    ),
    ProxyProvider3<CafeApi, CafeDbService, CafePreference, CafeRepository>(
      update:
          (context, cafeApi, cafeDbService, cafePreference, _) =>
              CafeRepositoryImpl(
                cafeApi: cafeApi,
                cafeDbService: cafeDbService,
                cafePreference: cafePreference,
              ),
    ),
  ];
}
