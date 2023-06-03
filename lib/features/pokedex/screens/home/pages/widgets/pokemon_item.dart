import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';
import 'package:pokemon/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key, required this.poke});
  final Poke poke;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: poke.baseColor!.withOpacity(0.7),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(poke.name,style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      ),),
                    ),
                    
                    Text(
                      '#${poke.num}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: poke.type
                      .map((e) => TypeWidget(
                        name: e,
                        ))
                        .toList(),
                    ),
                    Flexible(
                      child: Container(
                        height: 100,
                        width: 100,
                      ),
                    ),
                    
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 1,
          child: Image.network(
            poke.image,
          ),
        ),
      ],
    );
  }
}