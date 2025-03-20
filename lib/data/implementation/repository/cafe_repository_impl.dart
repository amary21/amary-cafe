import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/data/api/model/dark_theme.dart';
import 'package:amary_cafe/data/api/model/detail.dart';
import 'package:amary_cafe/data/api/model/notify.dart';
import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/data/implementation/database/entity/cafe_entity.dart';
import 'package:amary_cafe/data/implementation/database/service/cafe_db_service.dart';
import 'package:amary_cafe/data/implementation/mapper/cafe_mapper.dart';
import 'package:amary_cafe/data/implementation/preference/cafe_preference.dart';
import 'package:amary_cafe/data/implementation/remote/api/cafe_api.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_detail_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_list_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_response.dart';

class CafeRepositoryImpl implements CafeRepository {
  final CafeApi _cafeApi;
  final CafeDbService _cafeDbService;
  final CafePreference _cafePreference;

  CafeRepositoryImpl({
    required CafeApi cafeApi,
    required CafeDbService cafeDbService,
    required CafePreference cafePreference,
  }) : _cafeApi = cafeApi,
       _cafeDbService = cafeDbService,
       _cafePreference = cafePreference;

  @override
  Future<List<Cafe>> getList() async {
    try {
      CafeListResponse cafeListResponse = await _cafeApi.getCafeList();
      if (cafeListResponse.error) {
        throw Exception(cafeListResponse.message);
      } else {
        List<CafeResponse> cafeResponse = cafeListResponse.cafes;
        return cafeResponse.map((element) => element.toCafe()).toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Detail> getDetail(String id) async {
    try {
      CafeDetailResponse cafeDetailResponse = await _cafeApi.getDetail(id);
      if (cafeDetailResponse.error) {
        return throw Exception(cafeDetailResponse.message);
      } else {
        return cafeDetailResponse.cafe.toDetail();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Cafe>> getSearch(String value) async {
    try {
      CafeListResponse cafeListResponse = await _cafeApi.getSearch(value);
      if (cafeListResponse.error) {
        throw Exception(cafeListResponse.message);
      } else {
        List<CafeResponse> cafeResponse = cafeListResponse.cafes;
        return cafeResponse.map((element) => element.toCafe()).toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Cafe>> localGetAllItem() async {
    try {
      List<CafeEntity> cafeEntities = await _cafeDbService.getAllItem();
      if (cafeEntities.isEmpty) {
        return throw "Data not found";
      } else {
        return cafeEntities.map((entity) => entity.toModel()).toList();
      }
    } catch (e) {
      return throw Exception(e);
    }
  }

  @override
  Future<Cafe> localGetItemById(String id) async {
    try {
      CafeEntity cafeEntity = await _cafeDbService.getItemById(id);
      return cafeEntity.toModel();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<int> localInsertItem(Cafe cafe) async {
    try {
      return _cafeDbService.insertItem(cafe.toEntity());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<int> localRemoveItem(String id) {
    try {
      return _cafeDbService.removeItem(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<DarkTheme> getIsDarkTheme() async {
    final isDarkTheme = await _cafePreference.getIsDarkTheme();
    return isDarkTheme.isEnableDarkTheme;
  }

  @override
  Future<Notify> getNotification() async {
    final isNotify = await _cafePreference.getNotification();
    return isNotify.isEnableNotify;
  }

  @override
  Future<void> saveDarkTheme(DarkTheme value) async {
    await _cafePreference.saveDarkTheme(value.isEnable);
  }

  @override
  Future<void> saveNotification(Notify value) async {
    await _cafePreference.saveNotification(value.isEnable);
  }
}
