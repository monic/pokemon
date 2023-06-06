import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';

import 'detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({super.key, required this.poke, required this.list, required this.controller, required this.onChangePoke});
  final Poke poke;
  final List<Poke> list;
  final PageController controller;
  final ValueChanged<Poke> onChangePoke;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: poke.baseColor,
        child: Column(
          children: [
            Padding(                      
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      poke.name, 
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),),
                  ),
                  Text(
                    '#${poke.num}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                ],
              ),
            ),
            SizedBox(
                height: 300,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) =>
                    onChangePoke(list[index]),
                  controller: controller,
                  children: list.map((e) {
                    bool diff = e.name != poke.name;
                    return DetailItemListWidget(
                      isDiff: diff,
                      poke: e,
                    );
                    },
                )
                .toList(),
              ),  
            ),   
          ],
        ),
      ),
    );
  }
}

