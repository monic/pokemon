import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';
import 'package:pokemon/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:pokemon/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.poke, required this.list, required this.onBack, required this.controller, required this.onChangePoke});
  final Poke poke;
  final List<Poke> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Poke> onChangePoke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarWidget(
            poke: poke, 
            onBack: onBack,
            ),
            DetailListWidget(
              poke: poke,
              list: list, 
              controller: controller, 
              onChangePoke: onChangePoke,
            ),        
        ],
      ),
    );
  }
}