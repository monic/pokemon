import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon/common/consts/api_consts.dart';
import 'package:pokemon/common/error/failure.dart';
import 'package:pokemon/common/models/poke.dart';

abstract class IPokemonRepository{
  Future<List<Poke>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository{
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Poke>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Poke.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados');
    }
  }
}