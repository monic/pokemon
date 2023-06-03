import 'package:flutter/material.dart';
import 'package:pokemon/common/error/failure.dart';
import 'package:pokemon/common/models/poke.dart';
import 'package:pokemon/common/widgets/po_error.dart';
import 'package:pokemon/common/widgets/po_loading.dart';
import 'package:pokemon/features/pokedex/screens/details/pages/datail_page.dart';

import '../../../../../common/repositories/pokemon_repository.dart';

class DetailArguments{
  DetailArguments({required this.poke});
  final Poke poke;  
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key, required this.repository, required this.arguments});    
  final IPokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Poke>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return PoLoading();
      }

      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
        return DetailPage(poke: arguments.poke, list: snapshot.data!);
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