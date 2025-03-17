import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/feature/detail/widget/fav_icon/fav_icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavIconWidget extends StatefulWidget {
  final Cafe cafe;

  const FavIconWidget({super.key, required this.cafe});

  @override
  State<FavIconWidget> createState() => _FavIconWidgetState();
}

class _FavIconWidgetState extends State<FavIconWidget> {
  @override
  void initState() {
    final favIconProvider = context.read<FavIconProvider>();

    Future.microtask(() async {
      await favIconProvider.getFavCafe(widget.cafe.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final favIconProvider = context.read<FavIconProvider>();
        final isFavorite = favIconProvider.isFavorited;

        if (!isFavorite) {
          await favIconProvider.saveCafe(widget.cafe);
        } else {
          await favIconProvider.removeCafe(widget.cafe.id);
        }
        favIconProvider.isFavorited = !isFavorite;
      },
      icon: Icon(
        context.watch<FavIconProvider>().isFavorited
          ? Icons.favorite
          : Icons.favorite_border
      ),
    );
  }
}
