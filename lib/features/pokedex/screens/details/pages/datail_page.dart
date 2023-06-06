import 'package:flutter/material.dart';
import 'package:pokemon/common/models/poke.dart';
import 'package:pokemon/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:pokemon/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.poke, required this.list, required this.onBack, required this.controller, required this.onChangePoke});
  final Poke poke;
  final List<Poke> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Poke> onChangePoke;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
late ScrollController scrollController;

@override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification){
          setState(() {
            if (scrollController.position.pixels > 37){
              isOnTop = false;
          } else if (scrollController.position.pixels <= 36){
             isOnTop = true;
          }           
        });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              poke: widget.poke, 
              onBack: widget.onBack,
              isOnTop: isOnTop,
              ),          
            DetailListWidget(
                poke: widget.poke,
                list: widget.list, 
                controller: widget.controller, 
               onChangePoke: widget.onChangePoke,
               ),
               SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Container(
                        color: widget.poke.baseColor,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               ),
          ],
        ),
      ),
    );
  }
}