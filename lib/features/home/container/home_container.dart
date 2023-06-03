import 'package:flutter/material.dart';
import 'package:pokemon/common/error/failure.dart';
import 'package:pokemon/common/models/poke.dart';
import 'package:pokemon/common/repositories/pokemon_repository.dart';
import 'package:pokemon/features/home/pages/home_error.dart';
import 'package:pokemon/features/home/pages/home_loading.dart';
import 'package:pokemon/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key, 
    required this.repository});
    
  final IPokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Poke>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return HomeLoading();
      }

      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
        return HomePage(
          list: snapshot.data!
          );
      }
      if(snapshot.hasError){
        return HomeError(
          error: (snapshot.error as Failure).message!,
        );
      }
      return Container();
      },
    );
  }
}