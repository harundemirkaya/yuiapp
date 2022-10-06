import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/product_model.dart';
import 'api_urls.dart';

abstract class YuiRepo {
  Future<List<ProductModel>> getProducts();
}

class YuiRepository implements YuiRepo {
  final _urls = AppUrl();

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await http
        .get(Uri.parse(_urls.products))
        .timeout(const Duration(seconds: 10));

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      if (data["message"] != null) throw data["message"];
      throw 'Bir hata oluştu! Code: ${response.statusCode}';
    }
  }
}
