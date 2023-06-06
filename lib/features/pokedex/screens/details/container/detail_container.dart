import 'package:flutter/material.dart';
import 'package:pokemon/common/error/failure.dart';
import 'package:pokemon/common/models/poke.dart';
import 'package:pokemon/common/widgets/po_error.dart';
import 'package:pokemon/common/widgets/po_loading.dart';
import 'package:pokemon/features/pokedex/screens/details/pages/datail_page.dart';

import '../../../../../common/repositories/pokemon_repository.dart';

class DetailArguments{
  DetailArguments({this.index = 0, required this.poke});
  final Poke poke;  
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({Key? key, required this.repository, required this.arguments, required this.onBack});    
  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Poke>> _future;
  Poke? _poke;

  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!
    );
    _future = widget.repository.getAllPokemons();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Poke>>(
      future: _future,
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return PoLoading();
      }

      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
        if (_poke == null){
          _poke = widget.arguments.poke;
        }
        return DetailPage(
          poke: _poke!, 
          list: snapshot.data!,
          onBack: widget.onBack,
          controller: _controller, onChangePoke: (Poke value) { 
            setState(() {
              _poke = value;
            });
           },
        );
      }
      if(snapshot.hasError){
        return PoError(
          error: (snapshot.error as Failure).message!,
        );
      }
      return Container();
      },
    );
  }
}