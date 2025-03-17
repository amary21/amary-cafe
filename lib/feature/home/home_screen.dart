import 'package:amary_cafe/feature/home/home_provider.dart';
import 'package:amary_cafe/feature/home/home_state.dart';
import 'package:amary_cafe/widget/cafe_card_widget.dart';
import 'package:amary_cafe/route/nav_route.dart';
import 'package:amary_cafe/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final homeProvide = context.read<HomeProvider>();

    Future.microtask(() {
      homeProvide.getCafeList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amary Cafe",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Recommendation restaurant for you!",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SearchWidget(
              onChanged: (value) {
                context.read<HomeProvider>().getSearchList(value);
              },
            ),
          ],
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return switch (value.state) {
            HomeListLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
            HomeListLoadedState(data: var cafes) => ListView.builder(
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
            HomeListErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
