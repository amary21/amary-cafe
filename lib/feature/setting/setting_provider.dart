import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;

  SettingProvider(this._cafeRepository);
}
