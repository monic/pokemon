import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/common/repositories/pokemon_repository.dart';
import 'package:pokemon/features/home/container/home_container.dart';
import 'package:pokemon/features/home/pages/home_loading.dart';
import 'package:pokemon/features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      theme: ThemeData(        
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio()
          ),
        ),
    );
  }
}

