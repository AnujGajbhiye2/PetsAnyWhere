import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paw/model/user_model.dart';
import 'package:paw/environment/Strings.dart' as env;

class HttpService {
  final String apiUrl = env.dev_API_LINK;

  Future  getUserData() async {
    http.Response res = await http.get(apiUrl);

    if(res.statusCode == 200) {
        List body = jsonDecode(res.body);
    }
    return null;
  }

}