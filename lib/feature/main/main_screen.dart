import 'package:amary_cafe/feature/favorite/favorite_screen.dart';
import 'package:amary_cafe/feature/home/home_screen.dart';
import 'package:amary_cafe/feature/main/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNabBar) {
            0 => HomeScreen(),
            _ => FavoriteScreen(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<MainProvider>().indexBottomNabBar,
        onTap: (index) {
          context.read<MainProvider>().setIndexBottomNabBar = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
            tooltip: "Favorite",
          ),
        ],
      ),
    );
  }
}
