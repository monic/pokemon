import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {Key? key, required this.isDiff, required this.poke})
      : super(key: key);
  final bool isDiff;
  final Poke poke;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            tween: Tween<double>(
                end: isDiff ? 100 : 300, begin: isDiff ? 300 : 100),
            builder: (context, value, child) {
              return Image.network(
                poke.image,
                width: value,
                fit: BoxFit.contain,
                color: isDiff ? Colors.black.withOpacity(0.4) : null,
              );
            }),
      ),
    );
  }
}