import 'package:amary_cafe/feature/favorite/favorite_provider.dart';
import 'package:amary_cafe/feature/favorite/favorite_state.dart';
import 'package:amary_cafe/route/nav_route.dart';
import 'package:amary_cafe/widget/cafe_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    final favoriteProvider = context.read<FavoriteProvider>();

    Future.microtask(() {
      favoriteProvider.getFavorite();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorite Cafe",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Favorite restaurant for you!",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, value, child) {
          return switch (value.state) {
            FavoriteLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
            FavoriteLoadedState(data: var cafes) => ListView.builder(
              itemCount: cafes.length,
              itemBuilder: (context, index) {
                final cafe = cafes[index];
                return CafeCardWidget(
                  cafe: cafe,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NavRoute.detailRoute.name,
                      arguments: cafe.id,
                    );
                  },
                );
              },
            ),
            
            FavoriteErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}