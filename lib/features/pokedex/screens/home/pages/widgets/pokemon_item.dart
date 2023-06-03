import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';
import 'package:pokemon/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokemon/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key, required this.poke, required this.onTap});
  final Poke poke;
  final Function(String, DetailArguments) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => onTap('/details', DetailArguments(poke: poke)),
          child: Container(
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
        ),
        Positioned(
          bottom: 12,
          right: 2,
          child: Image.network(
            poke.image,
          ),
        ),
      ],
    );
  }
}