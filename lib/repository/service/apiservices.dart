import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpodcart/model/resp_model/resp_model.dart';

class ApiService {
  fetchData() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/cart"));
    var jsonn = jsonDecode(response.body);
    var respmain = RespModel.fromJson(jsonn);
    var list = respmain.carts;
    return list;
  }
}
