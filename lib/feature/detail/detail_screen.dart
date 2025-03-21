import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/feature/detail/detail_provider.dart';
import 'package:amary_cafe/feature/detail/detail_state.dart';
import 'package:amary_cafe/feature/detail/widget/body_detail_widget.dart';
import 'package:amary_cafe/feature/detail/widget/fav_icon/fav_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final Cafe cafe;

  const DetailScreen({super.key, required this.cafe});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    final homeProvide = context.read<DetailProvider>();

    Future.microtask(() {
      homeProvide.getDetail(widget.cafe.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Cafe"),
        actions: [
          FavIconWidget(cafe: widget.cafe)
        ],
      ),
      body: Consumer<DetailProvider>(
        builder: (context, value, child) {
          return switch (value.state) {
            DetailLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
            DetailLoadedState(data: var cafe) => BodyDetailWidget(detail: cafe),
            DetailErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
