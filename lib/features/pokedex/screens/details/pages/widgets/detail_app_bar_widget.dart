import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';


class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({
    Key? key,
    required this.poke,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);
  final Poke poke;
  final VoidCallback onBack;
  final bool isOnTop;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: poke.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.chevron_left),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: isOnTop ? 0 : 1,
        child: Text(
          poke.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}