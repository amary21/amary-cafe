import 'package:flutter/material.dart';

class FavIconWidget extends StatefulWidget {
  const FavIconWidget({super.key});

  @override
  State<FavIconWidget> createState() => _FavIconWidgetState();
}

class _FavIconWidgetState extends State<FavIconWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.favorite));
  }
}
