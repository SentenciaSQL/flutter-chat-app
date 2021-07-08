import 'package:chat/global/enviroment.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {

  Usuario usuarioPara = new Usuario();

  Future<List<Mensaje>?> getChat( String usuarioID ) async{
    final uri = Uri.parse('${Envireoment.apiUrl}/mensajes/$usuarioID');

    final resp = await http.get(uri, 
      headers: {
        'Content-Type': 'application/json',
        'x-token' : await AuthService.getToken() ?? ''
      }
    );

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }

}