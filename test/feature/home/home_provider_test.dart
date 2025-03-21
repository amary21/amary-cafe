import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/feature/home/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amary_cafe/feature/home/home_provider.dart';

import '../../fake/fake_cafe_repository.dart';

void main() {
  late HomeProvider homeProvider;
  late FakeCafeRepository fakeCafeRepository;
  late List<Cafe> dummyCafeList;

  setUp(() {
    fakeCafeRepository = FakeCafeRepository();
    homeProvider = HomeProvider(fakeCafeRepository);

    dummyCafeList = [
      Cafe(
        id: "1",
        name: "Amary Cafe",
        description: "Tempat nyaman untuk bersantai.",
        pictureId: "amary-pic",
        city: "Jakarta",
        rating: 4.5,
      ),
      Cafe(
        id: "2",
        name: "Cafe Aroma",
        description: "Cafe dengan aroma kopi khas.",
        pictureId: "aroma-pic",
        city: "Bandung",
        rating: 4.3,
      ),
    ];
  });

  test(
    "getCafeList harus mengubah state menjadi HomeListLoadedState jika sukses",
    () async {
      // Given
      fakeCafeRepository.cafes = Future.value(dummyCafeList);

      // When
      await homeProvider.getCafeList();

      // Then
      expect(homeProvider.state, isA<HomeListLoadedState>());
      expect(
        (homeProvider.state as HomeListLoadedState).data,
        equals(dummyCafeList),
      );
    },
  );

  test(
    "getCafeList harus mengubah state menjadi HomeListErrorState jika terjadi error",
    () async {
      // Given
      fakeCafeRepository.cafes = Future.error(Exception("Terjadi kesalahan"));

      // When
      await homeProvider.getCafeList();

      // Then
      expect(homeProvider.state, isA<HomeListErrorState>());
      expect(
        (homeProvider.state as HomeListErrorState).error,
        contains("Terjadi kesalahan"),
      );
    },
  );

  test(
    "getSearchList harus mengubah state menjadi HomeListLoadedState jika pencarian berhasil",
    () async {
      // Given
      fakeCafeRepository.cafes = Future.value(dummyCafeList);

      // When
      await homeProvider.getSearchList("Kopi");

      // Then
      expect(homeProvider.state, isA<HomeListLoadedState>());
      expect(
        (homeProvider.state as HomeListLoadedState).data,
        equals(dummyCafeList),
      );
    },
  );

  test(
    "getSearchList harus memanggil getCafeList jika pencarian kosong",
    () async {
      // Given
      fakeCafeRepository.cafes = Future.value(dummyCafeList);

      // When
      await homeProvider.getSearchList("");

      // Then
      expect(homeProvider.state, isA<HomeListLoadedState>());
      expect(
        (homeProvider.state as HomeListLoadedState).data,
        equals(dummyCafeList),
      );
    },
  );

  test(
    "getSearchList harus mengubah state menjadi HomeListErrorState jika terjadi error",
    () async {
      // Given
      fakeCafeRepository.cafes = Future.error(Exception("Terjadi kesalahan saat mencari data"));

      // When
      await homeProvider.getSearchList("Kopi");

      // Then
      expect(homeProvider.state, isA<HomeListErrorState>());
      expect(
        (homeProvider.state as HomeListErrorState).error,
        contains("Terjadi kesalahan saat mencari data"),
      );
    },
  );
}
