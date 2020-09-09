import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xshoes/model/categories.dart';
import 'package:xshoes/model/product.dart';
class NetworkService {
  var client=http.Client();
  
  String basePath = "http://192.168.43.150/xshoes-webservice/";

  Future<Product> getProduct()async{
    Product result=Product();
    String url =basePath+"serviceshoes.php";
    var response=await client.get(url);
    if(response.statusCode==200){
       result=productFromJson(response.body);
    }
    return result;
  }
  Future<Categories> getCategories()async{
    Categories cat=Categories();
    String url =basePath+"getcategories.php";
    var response=await client.get(url);
    if(response.statusCode==200){
       cat=categoriesFromJson(response.body);
    }
    return cat;
  }
  Future registerUser(String fullname, String _email, String password) async {
    String url = basePath + "serviceregister.php";
    var response = await client.post(url,
        body: {'email': _email, 'fullname': fullname, 'password': password});
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as Map;
      return result;
    }
    return {'message': "register gagal", 'result': false};
  }

  Future loginUser(String _email, String password) async {
    String url = basePath + "servicelogin.php";
    var response =
        await client.post(url, body: {'email': _email, 'password': password});
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as Map;
      (result['result'] == 1)
          ? result['result'] = true
          : result['result'] = false;
      return result;
    }
    return {'message': "login gagal", 'result': false};
  }
}