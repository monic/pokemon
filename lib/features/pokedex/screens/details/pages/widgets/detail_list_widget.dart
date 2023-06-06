import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({super.key, required this.poke, required this.list, required this.controller, required this.onChangePoke});
  final Poke poke;
  final List<Poke> list;
  final PageController controller;
  final ValueChanged<Poke> onChangePoke;

  @override
  Widget build(BuildContext context) {
    return Positioned(
              top: 102,
              left: 0,
              right: 0,
              height: 350,
              child: Container(
                color: poke.baseColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        height: 200,
                        width: double.infinity,
                        child: PageView(
                          onPageChanged: (index) =>
                            onChangePoke(list[index]),
                          controller: controller,
                          children: list.map((e) {
                            bool diff = e.name != poke.name;
                            return AnimatedOpacity(
                              duration: Duration(milliseconds: 400),
                              opacity: diff ? 0.4 : 1.0,
                              child: TweenAnimationBuilder<double>(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn,
                                tween: Tween<double>(end: diff ? 100 : 300, begin: diff ? 300 : 0),
                                builder: (context, value, child) {
                                  return Center(
                                    child: Image.network(
                                      e.image,  
                                      width: value,                              
                                      color: diff ? Colors.black45.withOpacity(0.4) : null,
                                  ),
                                );
                              }
                            ),
                          );},
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

