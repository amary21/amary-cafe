import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/data/api/model/menu.dart';
import 'package:amary_cafe/data/api/model/name.dart';
import 'package:amary_cafe/data/api/model/detail.dart';
import 'package:amary_cafe/data/api/model/review.dart';
import 'package:amary_cafe/data/implementation/database/entity/cafe_entity.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_detail_item_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_menu_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_review_response.dart';

extension CafeMapper on CafeResponse {
  Cafe toCafe() {
    return Cafe(
      id: id,
      name: name,
      description: description,
      pictureId: pictureId,
      city: city,
      rating: rating,
    );
  }
}

extension CafeDetailMapper on CafeDetailItemResponse {
  Detail toDetail() {
    return Detail(
      id: id,
      name: name,
      description: description,
      city: city,
      address: address,
      pictureId: pictureId,
      rating: rating,
      categories:
          categories.map((element) => Name(name: element.name)).toList(),
      menu: menus.toMenus(),
      reviews: reviews.map((elemet) => elemet.toReview()).toList(),
    );
  }
}

extension MenusMapper on CafeMenuResponse {
  Menu toMenus() {
    return Menu(
      foods: foods.map((element) => Name(name: element.name)).toList(),
      drinks: drinks.map((element) => Name(name: element.name)).toList(),
    );
  }
}

extension ReviewMapper on CafeReviewResponse {
  Review toReview() {
    return Review(name: name, review: review, date: date);
  }
}

extension CafeModelToEnctityMapper on Cafe {
  CafeEntity toEntity() {
    return CafeEntity(
      id: id,
      name: name,
      description: description,
      pictureId: pictureId,
      city: city,
      rating: rating,
    );
  }
}

extension CafeEnctityToModelMapper on CafeEntity {
  Cafe toModel() {
    return Cafe(
      id: id,
      name: name,
      description: description,
      pictureId: pictureId,
      city: city,
      rating: rating,
    );
  }
}
