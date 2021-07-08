import 'package:chat/global/enviroment.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/models/usuarios_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsuarioService {

  Future<List<Usuario>> getUsuarios() async {

    try {
      final uri = Uri.parse('${Envireoment.apiUrl}/usuarios');
      final resp = await http.get(uri, 
        headers: {
          'Content-Type': 'application/json',
          'x-token' : await AuthService.getToken() ?? ''
        }
      );

      final usuariosResponse = usuarioResponseFromJson(resp.body);
      return usuariosResponse.usuarios ?? [];
      
    } catch (e) {
      return [];
    }
  }

}