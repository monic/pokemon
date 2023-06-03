import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';
import 'package:pokemon/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokemon/features/pokedex/screens/home/pages/widgets/pokemon_item.dart';


class HomePage extends StatelessWidget {
  const HomePage ({super.key, required this.list, required this.onItemTap});
  final List <Poke> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list.map((e) => PokemonItem(poke: e)).toList(),
        ),
      ),
    );
  }
}