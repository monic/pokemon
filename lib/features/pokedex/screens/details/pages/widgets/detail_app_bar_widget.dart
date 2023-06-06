import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({super.key, required this.poke, required this.onBack});
  final Poke poke;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: poke.baseColor,
        leading: IconButton(onPressed: onBack, icon: Icon(Icons.chevron_left),),
      ),
    );
  }
}