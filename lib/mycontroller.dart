import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodcart/repository/service/apiservices.dart';

import 'model/resp_model/cart.dart';

final cartListProvider = FutureProvider<List<Cart>>((ref) async {
  final apiService = ApiService();
  return await apiService.fetchData();
});
