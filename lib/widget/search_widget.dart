import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function(String value) onChanged;

  const SearchWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search cafe...",
          suffix: const Icon(Icons.search),
          hintStyle: Theme.of(context).textTheme.titleMedium,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
