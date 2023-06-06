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
          physics: const ClampingScrollPhysics(),
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 85),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Speed',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]
                                  )
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Special Def',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Special Att',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Defense',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Attack',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'HP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              children: const <Widget>[
                                Text(
                                  '80',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '47',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '68',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '41',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '72',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '49',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '357',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ]
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              children: const <Widget>[
                                StatusBar(widthFactor: 0.80),
                                SizedBox(height: 10,),
                                StatusBar(widthFactor: 0.47),
                                SizedBox(height: 10,),
                                StatusBar(widthFactor: 0.68),
                                SizedBox(height: 10,),
                                StatusBar(widthFactor: 0.41),
                                SizedBox(height: 10,),
                                StatusBar(widthFactor: 0.72),
                                SizedBox(height: 10,),
                                StatusBar(widthFactor: 0.49),
                                SizedBox(height: 10,),
                                StatusBar(widthFactor: 0.357),
                                SizedBox(height: 10,),
                              ]
                            ),
                          ],
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

class StatusBar extends StatelessWidget {
  final double widthFactor;

  const StatusBar({Key? key, required this.widthFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      child: Center(
        child: Container(
          height: 4,
          width: MediaQuery.of(context).size.width * .47,
          alignment: Alignment.centerLeft,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.grey,
          ),
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: widthFactor > 0.5 ? Colors.teal : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
