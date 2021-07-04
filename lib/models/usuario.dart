import 'package:flutter/material.dart';

class Usuario {

  bool online;
  String? email;
  String? nombre;
  String? uid;
  
  Usuario({
    required this.online,
    this.email,
    this.nombre,
    this.uid
  });

}