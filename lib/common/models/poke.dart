import 'package:flutter/material.dart';

class Poke{
  final String name;
  final String image;
  final List<String> type;
  final int id;
  final String num;

  factory Poke.fromMap(Map<String, dynamic> json) {
    return Poke(
      name: json['name'], 
      image: json['img'], 
      id: json['id'], 
      num: json['num'], 
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
      );
    }

  Poke({
    required this.name, 
    required this.image, 
    required this.type, 
    required this.id, 
    required this.num,
    
    });
}