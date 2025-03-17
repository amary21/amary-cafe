import 'package:amary_cafe/data/implementation/database/entity/cafe_entity.dart';

abstract class CafeDbService {
  Future<int> insertItem(CafeEntity entity);

  Future<List<CafeEntity>> getAllItem();

  Future<CafeEntity> getItemById(String id);
  
  Future<int> removeItem(String id);
}
